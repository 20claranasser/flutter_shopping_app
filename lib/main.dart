import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// الاستيراد المباشر والمضبوط حسب إعدادات مشروعك
import 'l10n/app_localizations.dart';

import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/search_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/checkout_screen.dart';

void main() => runApp(const FashionApp());

class FashionApp extends StatefulWidget {
  const FashionApp({super.key});

  static _FashionAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_FashionAppState>();

  @override
  State<FashionApp> createState() => _FashionAppState();
}

class _FashionAppState extends State<FashionApp> {
  Locale _locale = const Locale('ar'); 
  ThemeMode _themeMode = ThemeMode.light;

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode value) => setState(() => _themeMode = value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale, 
      
      // إزالة كلمة const هنا لحل خطأ non_constant_list_element
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      
      themeMode: _themeMode, 
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/': page = const WelcomeScreen(); break;
          case '/signin': page = const SigninScreen(); break;
          case '/signup': page = const SignupScreen(); break;
          case '/main': page = const MainLayout(); break;
          case '/checkout': page = const CheckoutScreen(); break;
          default: page = const WelcomeScreen();
        }
        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final appState = FashionApp.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: const Text("RED FASHION", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
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
            icon: Icon(theme.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode, color: Colors.red),
            onPressed: () {
              appState?.setThemeMode(theme.brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navButton(Icons.home, l10n.home, 0),
                _navButton(Icons.search, l10n.search, 1),
                _navButton(Icons.shopping_cart, l10n.cart, 2),
              ],
            ),
          ),
        ),
      ),
      body: _screens[_currentIndex],
    );
  }

  Widget _navButton(IconData icon, String label, int index) {
    bool isSel = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSel ? Colors.red : Colors.grey, size: 28),
          Text(label, style: TextStyle(color: isSel ? Colors.red : Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}