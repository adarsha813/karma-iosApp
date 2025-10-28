class ValidationUtils {
  // Email validation
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email.trim());
  }

  // Name validation (allows international characters)
  static bool isValidName(String name) {
    if (name.trim().length < 2) return false;

    final nameRegex = RegExp(r'^[a-zA-Z\s\u00C0-\u024F\u1E00-\u1EFF]+$');
    return nameRegex.hasMatch(name.trim());
  }

  // Phone number validation (basic international format)
  static bool isValidPhone(String phone) {
    final phoneRegex = RegExp(r'^[\+]?[0-9\s\-\(\)]{10,15}$');
    return phoneRegex.hasMatch(phone.trim());
  }

  // URL validation
  static bool isValidUrl(String url) {
    final urlRegex = RegExp(
      r'^(https?:\/\/)?' // protocol
      r'((([a-z\d]([a-z\d-]*[a-z\d])*)\.)+[a-z]{2,}|' // domain name
      r'((\d{1,3}\.){3}\d{1,3}))' // OR ip (v4) address
      r'(\:\d+)?(\/[-a-z\d%_.~+]*)*' // port and path
      r'(\?[;&a-z\d%_.~+=-]*)?' // query string
      r'(\#[-a-z\d_]*)?$', // fragment locator
      caseSensitive: false,
    );
    return urlRegex.hasMatch(url.trim());
  }

  // Message/content validation
  static bool isValidMessage(
    String message, {
    int minLength = 10,
    int maxLength = 2000,
  }) {
    final trimmed = message.trim();
    return trimmed.length >= minLength && trimmed.length <= maxLength;
  }

  // Check if string contains only whitespace
  static bool isNotJustWhitespace(String input) {
    return input.trim().isNotEmpty;
  }
}
