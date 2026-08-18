import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    // This allows the footer to change color in Dark Mode
    final theme = Theme.of(context);

    return Container(
      // Use surfaceContainer instead of hardcoded white
      color: theme.colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "RED FASHION",
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "© 2026 Women Fashion Store. All rights reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 12),
          ),
        ],
      ),
    );
  }
}