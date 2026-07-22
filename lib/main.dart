import 'package:to_do/app_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
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
      builder: (context, child) {
        return MaterialApp(
          title: 'tasky',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              foregroundColor: Colors.white,
              backgroundColor: AppColors.background,
              iconTheme: const IconThemeData(color: AppColors.textWhite),
            ),
            checkboxTheme: CheckboxThemeData(
              fillColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.primaryGreen;
                }
                return Colors.transparent;
              }),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
            ),
            switchTheme: SwitchThemeData(
              trackColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.primaryGreen;
                }
                return Colors.white;
              }),
              thumbColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white;
                }
                return AppColors.disabledGrey;
              }),
            ),
            useMaterial3: true,
            splashFactory: NoSplash.splashFactory,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}