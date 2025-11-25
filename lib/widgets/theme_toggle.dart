// widgets/theme_toggle.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode(context);

    return ListTile(
      leading: Icon(
        isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text('Theme', style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(
        isDark ? 'Dark Mode' : 'Light Mode',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: isDark,
        onChanged: (_) => themeProvider.toggleTheme(),
        activeColor: Theme.of(context).colorScheme.primary,
      ),
      onTap: () => themeProvider.toggleTheme(),
    );
  }
}
