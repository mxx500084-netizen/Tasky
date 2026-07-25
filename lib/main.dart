import 'package:flutter/foundation.dart';
import 'package:to_do/app_exports.dart';
import 'package:to_do/core/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  ThemeController.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: ThemeController.themeNotifier,
          builder: (context, currentThemeMode, _) {
            return MaterialApp(
              title: 'Tasky',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: currentThemeMode,
              home: const SplashScreen(),
              builder: (context, child) {
                return ColoredBox(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF1C1C1E)
                      : const Color(0xFFF2F2F7),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: ClipRRect(
                        child: child ?? const SizedBox(),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
