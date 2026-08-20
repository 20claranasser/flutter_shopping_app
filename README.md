FASHION SHOPPING APP
Project Overview
Fashion Shopping App is a Flutter-based mobile shopping application designed to provide a simple and
user-friendly experience for browsing fashion products, viewing offers, managing a shopping cart, and
completing checkout.
The project supports both English and Arabic localization and includes a theme toggle for a more
personalized user experience.
Features
1. Product Browsing
• Browse fashion products.
• Products are organized into categories such as Dresses, Sets, and Tops.
• Product images and details are displayed in the shopping interface.
2. Hot Offers
• Dedicated area for featured and discounted products.
• Helps users quickly discover available offers.
3. Search
• Search for products from the application.
• Provides a convenient way to find specific fashion items.
4. Shopping Cart
• Add products to the shopping cart.
• View selected products.
• Manage cart items before checkout.
5. Checkout
• Dedicated checkout screen.
• Review the order before completing the purchase.
6. Localization
• Supports English and Arabic.
• Uses Flutter's localization system with AppLocalizations.
• The application language can be switched from the user interface.
7. Theme Support
• Supports switching between light and dark themes.
• Theme settings are managed through the main application.
8. Responsive Flutter UI
• Built using Flutter widgets and Material Design.
• Designed to work across supported Flutter platforms.
Setup Instructions
Prerequisites
Make sure the following are installed:
1. Flutter SDK
2. Dart SDK
3. Android Studio or VS Code
4. An Android emulator or a physical Android device
Check your Flutter installation using:
flutter doctor
Installation
1. Clone the repository:
git clone <repository-url>
2. Navigate to the project directory:
cd fashion_shopping_app
3. Install the Flutter dependencies:
flutter pub get
4. Make sure the required assets are available in:
assets/images/
5. Generate or update localization files if required:
flutter gen-l10n
6. Check the connected devices:
flutter devices
7. Run the application:
flutter run
Project Structure
fashion_shopping_app/
■
■■■ assets/
■ ■■■ images/
■
■■■ lib/
■ ■■■ l10n/
■ ■■■ screens/
■ ■ ■■■ cart_screen.dart
■ ■ ■■■ checkout_screen.dart
■ ■ ■■■ search_screen.dart
■ ■■■ widgets/
■ ■■■ cart_manager.dart
■ ■■■ product_data.dart
■ ■■■ main.dart
■
■■■ l10n.yaml
■■■ pubspec.yaml
■■■ analysis_options.yaml
■■■ README.md
Dependencies
The main dependencies used by the project include:
• Flutter
• Dart
• Flutter Localization
• intl
• Material Design
Running the Project
After completing the setup, run:
flutter pub get
flutter run
For a debug APK:
flutter build apk --debug
