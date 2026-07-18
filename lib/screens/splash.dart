import 'package:to_do/app_exports.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');

    if (!mounted) return;

    if (username != null && username.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const mainPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Welcome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: Expanded(
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/Vector (1).svg",
                width: 150,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset("assets/Rectangle 2.svg"),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset("assets/Rectangle 1.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
