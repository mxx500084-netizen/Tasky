import 'package:to_do/app_exports.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF181818),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF15B86C),
    onPrimary: Color(0xFFFFFCFC),
    surface: Color(0xFF181818),
    onSurface: Color(0xFFFFFCFC),
    surfaceContainer: Color(0xFF282828),
    primaryContainer: Color(0xFF282828),
    onSurfaceVariant: Color(0xFF6D6D6D),
    outline: Color(0xFF383838),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFFFFCFC),
    ),
    foregroundColor: const Color(0xFFFFFCFC),
    backgroundColor: const Color(0xFF181818),
    iconTheme: const IconThemeData(color: Color(0xFFFFFCFC)),
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
      color: const Color(0xFFFFFCFC),
    ),
    // ===Tasky===
    headlineMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFFFFFFF),
    ),
    // Welcome To Tasky
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFFFFCFC),
    ),
    // ===My Task=== / name(profile) / User Details screen title
    titleLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFFFFCFC),
    ),
    // home / New Task / To do / Completed / User Details
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFFFFCFC),
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFFFFCFC),
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
      color: const Color(0xFF6D6D6D),
    ),
    // ===Description Task=== / Motivation(profile) / Done(home)
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFC6C6C6),
    ),
    // finish task (grey)
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFA0A0A0),
    ),
    labelSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF15B86C),
    ),
    displaySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF6D6D6D),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Color(0xFF6D6D6D)),
    filled: true,
    fillColor: const Color(0xFF282828),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
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
  dividerTheme: const DividerThemeData(color: Color(0xFF383838), thickness: 1),
  popupMenuTheme: PopupMenuThemeData(
    color: const Color(0xFF181818),
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
        color: const Color(0xFFFFFCFC),
      ),
    ),
  ),
  splashFactory: NoSplash.splashFactory,
);
