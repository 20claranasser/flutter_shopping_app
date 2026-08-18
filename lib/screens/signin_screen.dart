import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.signIn,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 30),

              TextFormField(
                decoration: InputDecoration(
                  labelText: l10n.email,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(val ?? "");
                  if (val == null || val.isEmpty) return "Required";
                  if (!emailValid) return "Enter valid email";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.password,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                validator: (val) => (val != null && val.length < 6) ? "Min 6 characters" : null,
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/main');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(l10n.signIn),
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
                child: Text(l10n.register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}