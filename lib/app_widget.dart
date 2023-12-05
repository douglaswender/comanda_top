import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Comanda Top',
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1976D2),
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: const Color(0xFF1976D2),
        cardColor: Colors.white,
        dividerColor: Colors.grey[300],
        highlightColor: const Color(0xFFE1F5FE),
        splashColor: const Color(0xFFBBDEFB),
        indicatorColor: const Color(0xFF1976D2),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF1976D2),
          textTheme: ButtonTextTheme.primary,
        ),
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xFF1976D2)))),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16.0),
          titleSmall: TextStyle(fontSize: 14.0),
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0),
          labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF1976D2),
          selectionColor: Color(0xFFBBDEFB),
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(0xFF1976D2, <int, Color>{
            50: Color(0xFFE3F2FD),
            100: Color(0xFFBBDEFB),
            200: Color(0xFF90CAF9),
            300: Color(0xFF64B5F6),
            400: Color(0xFF42A5F5),
            500: Color(0xFF2196F3),
            600: Color(0xFF1E88E5),
            700: Color(0xFF1976D2),
            800: Color(0xFF1565C0),
            900: Color(0xFF0D47A1),
          }),
          accentColor: const Color(0xFFFFC107),
          errorColor: const Color(0xFFE57373),
          brightness: Brightness.light,
        )
            .copyWith(background: Colors.white)
            .copyWith(error: const Color(0xFFE57373)),
      ),
    );
  }
}
