import 'package:to_do/app_exports.dart';

final TextEditingController controller = TextEditingController();
final GlobalKey<FormState> _key = GlobalKey<FormState>();

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/Vector (1).svg",
                      width: 42,
                      height: 42,
                    ),
                    SizedBox(width: 16),
                    CustomText(
                      text: "Task",
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                    ),
                  ],
                ),
                const SizedBox(height: 108),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Welcome To Tasky",
                      color: Color(0xffFFFCFC),
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      "assets/waving-hand-medium-light-skin-tone-svgrepo-com 1.svg",
                      width: 28,
                      height: 28,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    CustomText(
                      text: "Your productivity journey starts here.",
                      color: Color(0xffFFFCFC),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 50),
                    SvgPicture.asset(
                      "assets/pana.svg",
                      width: 215,
                      height: 204.39450073242188,
                    ),
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Full Name",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 8),

                          Textform(controller1:  controller, validator: (String? value) {
                            if (value?.trim().isEmpty ?? false) {
                              return "please enter your full name";
                            } else {
                              return null;
                            }
                          } , color: Color.fromARGB(255, 255, 255, 255),
                              text: "e.g. Sarah Khalid"
                          ),

                          SizedBox(height: 24),
                          CustomButton(
                            text: "Let’s Get Started",
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (c) => mainPage()),
                                );
                              }
                            },
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
