import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/profile_provider.dart';

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
    final name = _nameController.text.trim();
    final secret = _secretController.text.trim();

    if ([name, secret].any((e) => e.isEmpty) ||
        _selectedDob == null ||
        _selectedTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("All fields are required.")));
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

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account recovered successfully.")),
        );

        Navigator.pop(context, userId); // ✅ return the recovered ID back
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Recovery failed. Check your info.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recover Account")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),
            // DOB picker
            ListTile(
              title: Text(
                _selectedDob == null
                    ? "Select Date of Birth"
                    : "DOB: ${_selectedDob!.day}-${_selectedDob!.month}-${_selectedDob!.year}",
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            const SizedBox(height: 10),
            // Time picker
            ListTile(
              title: Text(
                _selectedTime == null
                    ? "Select Time of Birth"
                    : "Time: ${_selectedTime!.format(context)}",
              ),
              trailing: const Icon(Icons.access_time),
              onTap: _pickTime,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _secretController,
              decoration: const InputDecoration(labelText: "Recovery Secret"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _recoverAccount,
                  child: const Text("Recover Account"),
                ),
          ],
        ),
      ),
    );
  }
}
