import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/app/di/app_dependencies.dart';
import 'package:surf_places/features/settings/theme_provider.dart';
import 'package:surf_places/features/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...AppDependencies.providers(),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder:
            (_, themeProvider, __) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeProvider.theme,
              home: const SplashScreen(),
            ),
      ),
    );
  }
}
