import 'package:to_do/app_exports.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tasky',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff181818),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0XFF181818),
          iconTheme: IconThemeData(
            color: Color(0XFFFFFCFC)
          ),
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xff15B86C);
              }
              return Colors.transparent;
            }),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          switchTheme:SwitchThemeData(trackColor:  WidgetStateProperty.resolveWith((states){
            if(states.contains(WidgetState.selected)){
             return Color(0xff15B86C);
            };
            return Colors.white;

          })
            ,thumbColor:  WidgetStateProperty.resolveWith((states){
                if(states.contains(WidgetState.selected)){
                  return Colors.white;
                };
                return Color(0xff9E9E9E);

              })
            ,),
          useMaterial3: true),

      home: const SplashScreen(),
    );
  }
}