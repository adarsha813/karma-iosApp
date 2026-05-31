import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:kundali/config/environment.dart';

class SSLPinningService {
  // 🛡️ Production certificate fingerprints - UPDATE THESE WITH YOUR ACTUAL CERTS
  static final Map<String, List<String>> _pinnedCertificates = {
    Uri.parse(Environment.baseUrl).host: [
      'sha256/${Environment.pinnedCertPrimary}',
      if (Environment.pinnedCertBackup.isNotEmpty)
        'sha256/${Environment.pinnedCertBackup}',
    ],
  };

  // 🛡️ Initialize SSL pinning for the entire app
  static Future<void> initialize() async {
    if (kIsWeb) {
      // Web doesn't support certificate pinning
      return;
    }

    // Override the default HTTP client
    HttpOverrides.global = _PinnedHttpOverrides();

    _logger.info('SSL Pinning initialized', feature: 'ssl_pinning');
  }

  // 🛡️ Verify certificate against pinned fingerprints
  static bool verifyCertificate(X509Certificate cert, String host) {
    try {
      final allowedFingerprints = _pinnedCertificates[host];

      // If host not in pinned list, allow connection (for non-critical domains)
      if (allowedFingerprints == null) {
        _logger.warning(
          'Host not in pinned list: $host',
          feature: 'ssl_pinning',
        );
        return true;
      }

      // Calculate actual certificate fingerprint
      final actualFingerprint = _calculateCertificateFingerprint(cert);

      // Check if fingerprint matches any pinned certificate
      final isValid = allowedFingerprints.contains(actualFingerprint);

      if (!isValid) {
        _logger.security(
          'CERTIFICATE PINNING FAILURE',
          feature: 'ssl_pinning',
          metadata: {
            'host': host,
            'receivedFingerprint': actualFingerprint,
            'expectedFingerprints': allowedFingerprints,
            'certificateSubject': cert.subject,
            'certificateIssuer': cert.issuer,
            'timestamp': DateTime.now().toIso8601String(),
          },
        );

        // 🚨 BLOCK CONNECTION - Potential MITM Attack
        _triggerSecurityAlert(host, actualFingerprint, allowedFingerprints);
      } else {
        _logger.info(
          'Certificate validation successful for $host',
          feature: 'ssl_pinning',
        );
      }

      return isValid;
    } catch (e, stackTrace) {
      _logger.error(
        'Certificate verification error',
        e,
        feature: 'ssl_pinning',
        stackTrace: stackTrace,
      );

      // 🛡️ Security-first approach: Block on errors
      return false;
    }
  }

  // 🛡️ Calculate SHA256 fingerprint of certificate
  static String _calculateCertificateFingerprint(X509Certificate cert) {
    try {
      // Get DER encoded certificate
      final derBytes = cert.der;

      // Calculate SHA256 hash
      final hash = sha256.convert(derBytes);

      // Format as 'sha256/Base64Hash'
      final fingerprint = 'sha256/${base64.encode(hash.bytes)}';

      return fingerprint;
    } catch (e) {
      _logger.error(
        'Error calculating certificate fingerprint',
        e,
        feature: 'ssl_pinning',
      );
      rethrow;
    }
  }

  // 🛡️ Security alert for pinning failures
  static void _triggerSecurityAlert(
    String host,
    String receivedFingerprint,
    List<String> expectedFingerprints,
  ) {
    // Log security event
    _logger.security(
      'POTENTIAL MITM ATTACK DETECTED',
      feature: 'security_alert',
      metadata: {
        'host': host,
        'receivedFingerprint': receivedFingerprint,
        'expectedFingerprints': expectedFingerprints,
        'action': 'connection_blocked',
        'timestamp': DateTime.now().toIso8601String(),
        'deviceInfo': {
          'platform': Platform.operatingSystem,
          'version': Platform.operatingSystemVersion,
          'appVersion': '1.0.0',
        },
      },
    );
  }

  // 🛡️ Check if host requires pinning
  static bool isHostPinned(String host) {
    return _pinnedCertificates.containsKey(host);
  }

  // 🛡️ Get all pinned hosts (for debugging)
  static List<String> getPinnedHosts() {
    return _pinnedCertificates.keys.toList();
  }

  // 🛡️ Update certificates dynamically (for certificate rotation)
  static void updatePinnedCertificates(
    Map<String, List<String>> newCertificates,
  ) {
    _pinnedCertificates.addAll(newCertificates);
    _logger.info('Updated pinned certificates', feature: 'ssl_pinning');
  }
}

// 🛡️ Custom HttpOverrides for certificate pinning
class _PinnedHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return _PinnedHttpClient(super.createHttpClient(context));
  }
}

// 🛡️ SIMPLIFIED HttpClient implementation with only actual methods
class _PinnedHttpClient implements HttpClient {
  final HttpClient _inner;

  _PinnedHttpClient(this._inner) {
    // Configure the inner client with certificate pinning
    _inner.badCertificateCallback = _verifyCertificateCallback;
    _inner.connectionTimeout = const Duration(seconds: 15);
    _inner.idleTimeout = const Duration(seconds: 30);
    _inner.autoUncompress = true;
    _inner.maxConnectionsPerHost = 6;
  }

  bool _verifyCertificateCallback(X509Certificate cert, String host, int port) {
    return SSLPinningService.verifyCertificate(cert, host);
  }

  // 🛡️ Core HTTP methods - THESE ARE THE ACTUAL METHODS
  @override
  Future<HttpClientRequest> getUrl(Uri url) => _inner.getUrl(url);

  @override
  Future<HttpClientRequest> postUrl(Uri url) => _inner.postUrl(url);

  @override
  Future<HttpClientRequest> putUrl(Uri url) => _inner.putUrl(url);

  @override
  Future<HttpClientRequest> deleteUrl(Uri url) => _inner.deleteUrl(url);

  @override
  Future<HttpClientRequest> patchUrl(Uri url) => _inner.patchUrl(url);

  @override
  Future<HttpClientRequest> headUrl(Uri url) => _inner.headUrl(url);

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) =>
      _inner.openUrl(method, url);

  @override
  Future<HttpClientRequest> open(
    String method,
    String host,
    int port,
    String path,
  ) => _inner.open(method, host, port, path);

  // 🛡️ Authentication methods - ACTUAL METHODS
  @override
  void addCredentials(
    Uri url,
    String realm,
    HttpClientCredentials credentials,
  ) {
    _inner.addCredentials(url, realm, credentials);
  }

  @override
  void addProxyCredentials(
    String host,
    int port,
    String realm,
    HttpClientCredentials credentials,
  ) {
    _inner.addProxyCredentials(host, port, realm, credentials);
  }

  @override
  set authenticate(
    Future<bool> Function(Uri url, String scheme, String? realm)? f,
  ) {
    _inner.authenticate = f;
  }

  @override
  set authenticateProxy(
    Future<bool> Function(String host, int port, String scheme, String? realm)?
    f,
  ) {
    _inner.authenticateProxy = f;
  }

  // 🛡️ Properties - ONLY ACTUAL PROPERTIES
  @override
  set connectionTimeout(Duration? timeout) {
    _inner.connectionTimeout = timeout;
  }

  @override
  Duration? get connectionTimeout => _inner.connectionTimeout;

  @override
  set idleTimeout(Duration timeout) {
    _inner.idleTimeout = timeout;
  }

  @override
  Duration get idleTimeout => _inner.idleTimeout;

  @override
  set maxConnectionsPerHost(int? max) {
    _inner.maxConnectionsPerHost = max;
  }

  @override
  int? get maxConnectionsPerHost => _inner.maxConnectionsPerHost;

  @override
  set userAgent(String? userAgent) {
    _inner.userAgent = userAgent;
  }

  @override
  String? get userAgent => _inner.userAgent;

  @override
  set autoUncompress(bool autoUncompress) {
    _inner.autoUncompress = autoUncompress;
  }

  @override
  bool get autoUncompress => _inner.autoUncompress;

  // 🛡️ Bad certificate callback - THIS IS AN ACTUAL PROPERTY
  @override
  set badCertificateCallback(
    bool Function(X509Certificate cert, String host, int port)? callback,
  ) {
    // Ignore external attempts to set badCertificateCallback
    // We control this internally for SSL pinning
    _logger.warning(
      'External badCertificateCallback assignment blocked - using SSL pinning',
      feature: 'ssl_pinning',
    );
  }

  // 🛡️ Connection management
  @override
  void close({bool force = false}) {
    _inner.close(force: force);
  }

  // 🛡️ Handle any other methods via noSuchMethod
  @override
  dynamic noSuchMethod(Invocation invocation) {
    // For any methods we haven't explicitly implemented, delegate to inner client
    return _inner.noSuchMethod(invocation);
  }
}

// Simple logger for SSL service
class _Logger {
  void info(String message, {String? feature}) {
    //AppLogger.info('ℹ️ [${feature ?? 'ssl_pinning'}] $message');
  }

  void warning(String message, {String? feature}) {
    //AppLogger.info('⚠️ [${feature ?? 'ssl_pinning'}] $message');
  }

  void error(
    String message,
    dynamic error, {
    String? feature,
    StackTrace? stackTrace,
  }) {
    //AppLogger.info('❌ [${feature ?? 'ssl_pinning'}] $message: $error');
    if (stackTrace != null) {
      //AppLogger.info('Stack trace: $stackTrace');
    }
  }

  void security(
    String message, {
    String? feature,
    Map<String, dynamic>? metadata,
  }) {
    //AppLogger.info('🔒 [SECURITY - ${feature ?? 'ssl_pinning'}] $message');
    if (metadata != null) {
      //AppLogger.info('Metadata: $metadata');
    }
  }
}

final _logger = _Logger();
