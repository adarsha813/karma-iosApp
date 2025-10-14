import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/profile_provider.dart';
import 'profile_settings_screen.dart';
import '../l10n/app_localizations.dart'; // Add this import

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({Key? key}) : super(key: key);

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final _nameController = TextEditingController();
  final _secretController = TextEditingController();

  DateTime? _selectedDob;
  TimeOfDay? _selectedTime;

  bool _isLoading = false;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 20),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() => _selectedDob = picked);
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 12, minute: 0),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  Future<void> _recoverAccount() async {
    final l10n = AppLocalizations.of(context)!;
    final name = _nameController.text.trim();
    final secret = _secretController.text.trim();

    if ([name, secret].any((e) => e.isEmpty) ||
        _selectedDob == null ||
        _selectedTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.allFieldsRequired)));
      return;
    }

    setState(() => _isLoading = true);

    final dobStr =
        "${_selectedDob!.year.toString().padLeft(4, '0')}-"
        "${_selectedDob!.month.toString().padLeft(2, '0')}-"
        "${_selectedDob!.day.toString().padLeft(2, '0')}";

    final timeStr =
        "${_selectedTime!.hour.toString().padLeft(2, '0')}:"
        "${_selectedTime!.minute.toString().padLeft(2, '0')}";

    try {
      final response = await http.post(
        Uri.parse("https://chat-backend-rvk9.onrender.com/users/recover"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "dob": dobStr,
          "timeOfBirth": timeStr,
          "recoverySecret": secret,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userId = data['userId'];
        final token = data['recoveryToken'];

        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        await profileProvider.saveUserId(userId);
        await profileProvider.saveToken(token);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.accountRecoveredSuccess)));

        Navigator.pop(context, userId); // ✅ return the recovered ID back
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.recoveryFailed)));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${l10n.errorPrefix} $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.recoverAccount)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: l10n.nameLabel),
            ),
            const SizedBox(height: 10),
            // DOB picker
            ListTile(
              title: Text(
                _selectedDob == null
                    ? l10n.birthDatePlaceholder
                    : "${l10n.birthDateLabel}: ${_selectedDob!.day}-${_selectedDob!.month}-${_selectedDob!.year}",
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            const SizedBox(height: 10),
            // Time picker
            ListTile(
              title: Text(
                _selectedTime == null
                    ? l10n.birthTimePlaceholder
                    : "${l10n.birthTimeLabel}: ${_selectedTime!.format(context)}",
              ),
              trailing: const Icon(Icons.access_time),
              onTap: _pickTime,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _secretController,
              decoration: InputDecoration(labelText: l10n.recoverySecretLabel),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _recoverAccount,
                  child: Text(l10n.recoverAccount),
                ),
            const SizedBox(height: 20),

            // 👇 New "I am a new user" link
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileSettingsScreen(),
                    ),
                  );
                },
                child: Text(
                  l10n.onboardingNewUser,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
