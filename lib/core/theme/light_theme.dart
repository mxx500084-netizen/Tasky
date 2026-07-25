import 'package:to_do/app_exports.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xffF6F7F9),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF15B86C),
    onPrimary: Color(0xFFFFFCFC),
    surface: Color(0xffF6F7F9),
    onSurface: Color(0xFF161F1B),
    surfaceContainer: Color(0xffffffff),
    primaryContainer: Color(0xffffffff),
    onSurfaceVariant: Color(0xFF9E9E9E),
    outline: Color(0xFFD1DAD6),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF161F1B),
    ),
    foregroundColor: const Color(0xFF161F1B),
    backgroundColor: const Color(0xffF6F7F9),
    iconTheme: const IconThemeData(color: Color(0xFF161F1B)),
    elevation: 0,
    scrolledUnderElevation: 0,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF15B86C);
      }
      return Colors.transparent;
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF15B86C);
      }
      return Colors.white;
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return const Color(0xFF9E9E9E);
    }),
  ),
  textTheme: TextTheme(
    // Yuhuu
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF161F1B),
    ),
    // ===Tasky===
    headlineMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF161F1B),
    ),
    // Welcome To Tasky
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF3A4640),
    ),
    // ===My Task=== / name(profile) / User Details screen title
    titleLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF161F1B),
    ),
    // home / New Task / To do / Completed / User Details
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF161F1B),
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF161F1B),
    ),
    // Achieved Tasks(home)
    titleSmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF15B86C),
    ),
    // Form text input / hint text
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF9E9E9E),
    ),
    // ===Description Task=== / Motivation(profile) / Done(home)
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF3A4640),
    ),
    // finish task (grey)
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF6A6A6A),
    ),
    // High Priority Tasks
    labelSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF15B86C),
    ),
    displaySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFC6C6C6),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
    filled: true,
    fillColor: const Color(0xFFFFFFFF),
    focusColor: Color(0xFFD1DAD6),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.red, width: 0.5),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(double.maxFinite, 40),
      backgroundColor: const Color(0xFF15B86C),
      foregroundColor: const Color(0xFFFFFCFC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    ),
  ),
  dividerTheme: const DividerThemeData(color: Color(0xFFD1DAD6), thickness: 1),
  popupMenuTheme: PopupMenuThemeData(
    color: const Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Color(0xFF15B86C), width: 1),
      borderRadius: BorderRadius.circular(16.r),
    ),
    elevation: 2,
    shadowColor: const Color(0xFF15B86C),
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF161F1B),
      ),
    ),
  ),
  splashFactory: NoSplash.splashFactory,
);
