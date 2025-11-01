import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class AstrologerDetailPage extends StatefulWidget {
  final String astrologerId;

  const AstrologerDetailPage({super.key, required this.astrologerId});

  @override
  State<AstrologerDetailPage> createState() => _AstrologerDetailPageState();
}

class _AstrologerDetailPageState extends State<AstrologerDetailPage> {
  Map<String, dynamic>? astrologerData;
  bool isLoading = true;
  String? errorMessage;
  bool isFavorite = false;
  bool actionInProgress = false;

  @override
  void initState() {
    super.initState();
    fetchAstrologerDetails();
  }

  Future<void> toggleFavorite(String userId) async {
    if (actionInProgress) return;
    setState(() => actionInProgress = true);

    try {
      final url = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/favorite-astrologer/set',
      );

      // If already favorite, send null to remove
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'userId': userId,
          'astrologerId': isFavorite ? null : widget.astrologerId,
        }),
      );

      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          setState(() => isFavorite = !isFavorite);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isFavorite
                    ? 'You have marked ${astrologerData?['fullName']} as your personal astrologer.'
                    : 'Removed ${astrologerData?['fullName']} from personal astrologer.',
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(data['message'] ?? 'Failed')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => actionInProgress = false);
    }
  }

  Future<void> fetchAstrologerDetails() async {
    setState(() => isLoading = true);

    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final userId = profileProvider.userId;

      // Fetch astrologer details
      final astrologerUrl = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/councillor/${widget.astrologerId}',
      );
      final astrologerResponse = await http.get(astrologerUrl);

      if (astrologerResponse.statusCode != 200) {
        setState(() {
          errorMessage =
              'Failed to fetch astrologer: ${astrologerResponse.statusCode}';
          isLoading = false;
        });
        return;
      }

      final astrologerJson = json.decode(astrologerResponse.body);
      if (astrologerJson['success'] != true || astrologerJson['data'] == null) {
        setState(() {
          errorMessage = 'Astrologer not found';
          isLoading = false;
        });
        return;
      }

      // Fetch user's favorite astrologer
      bool favoriteStatus = false;
      if (userId != null) {
        final favUrl = Uri.parse(
          'https://chat-backend-rvk9.onrender.com/api/favorite-astrologer/$userId',
        );
        final favResponse = await http.get(favUrl);

        if (favResponse.statusCode == 200) {
          try {
            final favJson = json.decode(favResponse.body);
            if (favJson['success'] == true &&
                favJson['favoriteAstrologerId'] != null) {
              favoriteStatus =
                  favJson['favoriteAstrologerId'] == widget.astrologerId;
            }
          } catch (_) {
            // Ignore JSON errors, default favoriteStatus = false
          }
        }
      }

      setState(() {
        astrologerData = astrologerJson['data'];
        isFavorite = favoriteStatus;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  Future<void> markAsFavorite(String userId) async {
    if (actionInProgress) return;
    setState(() => actionInProgress = true);

    try {
      final url = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/favorite-astrologer/set',
      );

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'userId': userId,
          'astrologerId': widget.astrologerId,
        }),
      );

      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          final data = json.decode(response.body);
          if (data['success'] == true) {
            setState(() => isFavorite = true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'You have marked ${astrologerData?['fullName']} as your personal astrologer.',
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(data['message'] ?? 'Failed')),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid server response')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => actionInProgress = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(astrologerData?['fullName'] ?? 'Astrologer Details'),
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          astrologerData?['image'] != null &&
                                  astrologerData!['image']!.isNotEmpty
                              ? NetworkImage(astrologerData!['image'])
                              : null,
                      child:
                          (astrologerData?['image'] == null ||
                                  astrologerData!['image']!.isEmpty)
                              ? const Icon(Icons.person, size: 50)
                              : null,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      astrologerData?['fullName'] ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Education: ${astrologerData?['education'] ?? '-'}\n'
                      'Qualification: ${astrologerData?['qualification'] ?? '-'}\n'
                      'Experience: ${astrologerData?['experience'] ?? '-'}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        final profileProvider = Provider.of<ProfileProvider>(
                          context,
                          listen: false,
                        );
                        final userId = profileProvider.userId;
                        if (userId != null) {
                          toggleFavorite(userId);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('User not found. Please log in.'),
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        isFavorite ? Icons.star : Icons.star_border,
                        color: Colors.yellowAccent,
                      ),
                      label: Text(
                        isFavorite
                            ? 'Your Personal Astrologer'
                            : 'Make Personal Astrologer',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isFavorite
                                ? Colors.grey.shade700
                                : Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                    ),

                    // Add your suggestion text here
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "By clicking 'Your Personal Astrologer', your questions go to this astrologer first. If unavailable, another astrologer will answer.",
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          astrologerData?['bio'] ?? '-',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
