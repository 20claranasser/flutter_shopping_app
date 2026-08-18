import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.red),
            onPressed: () {
              if (Localizations.localeOf(context).languageCode == 'ar') {
                FashionApp.of(context)?.setLocale(const Locale('en'));
              } else {
                FashionApp.of(context)?.setLocale(const Locale('ar'));
              }
            },
          ),
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
              color: Colors.red,
            ),
            onPressed: () {
              FashionApp.of(context)?.setThemeMode(
                theme.brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                l10n.register,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (val) => (val == null || val.isEmpty || val[0] != val[0].toUpperCase())
                    ? "First letter must be Uppercase"
                    : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                decoration: InputDecoration(
                  labelText: l10n.email,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => (val != null && val.contains('@')) ? null : "Must include @",
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.password,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                validator: (val) => (val != null && val.length < 6) ? "Min 6 characters" : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password_outlined),
                ),
                validator: (val) => (val != _passController.text) ? "Passwords do not match" : null,
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        content: const Text("Account created successfully"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              Navigator.pushReplacementNamed(context, '/main');
                            },
                            child: const Text("Close"),
                          )
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(l10n.register),
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/signin'),
                child: Text(l10n.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}