import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/screen/home.dart';

import '../module/bnb.dart';

final TextEditingController controller = TextEditingController();
final GlobalKey<FormState> _key = GlobalKey<FormState>();
void _handle(BuildContext context)async{
  
                        _key.currentState?.validate();

                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString(
                          'username',
                          controller.value.text,
                        );
                        if (_key.currentState?.validate() ?? false) {
                          if (!context.mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return mainPage();
                              },
                            ),
                          );
                        }
                     
}
class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
                    const Text(
                      "Task",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 108),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome To Tasky",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xffFFFCFC),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width:8 ),
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
                    const Text(
                      "Your productivity journey starts here.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xffFFFCFC),
                      ),
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
                          const Text(
                            "Full Name",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 8),

                          TextFormField(
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? false) {
                                return "please enter your full name";
                              } else {
                                return null;
                              }
                            },
                            // onFieldSubmitted:(value) async {
                            //       _key.currentState?.validate();
                            //
                            //       final prefs =
                            //           await SharedPreferences.getInstance();
                            //       await prefs.setString(
                            //         'username',
                            //         controller.value.text,
                            //       );
                            //       if (_key.currentState?.validate() ?? false) {
                            //         if (!context.mounted) return;
                            //         Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) {
                            //               return MyWidget();
                            //             },
                            //           ),
                            //         );
                            //       }
                            //     },
                            controller: controller,
                            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(

                              // suffixIcon: IconButton(
                              //   onPressed: () async {
                              //     _key.currentState?.validate();
                              //
                              //     final prefs =
                              //         await SharedPreferences.getInstance();
                              //     await prefs.setString(
                              //       'username',
                              //       controller.value.text,
                              //     );
                              //     if (_key.currentState?.validate() ?? false) {
                              //       if (!context.mounted) return;
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) {
                              //             return MyWidget();
                              //           },
                              //         ),
                              //       );
                              //     }
                              //   },
                              //   icon: Icon(Icons.login),
                              //   color: Colors.white,
                              // ),

                              hintText: "e.g. Sarah Khalid",
                              filled: true,
                              fillColor: const Color(0xff282828),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: () async {
                        _key.currentState?.validate();

                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString(
                          'username',
                          controller.value.text,
                        );
                        if (_key.currentState?.validate() ?? false) {
                          if (!context.mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return mainPage();
                              },
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(343, 40),
                        backgroundColor: Color(0xff15B86C),
                        foregroundColor: Color(0xffFFFCFC),
                      ),
                      child: Text("Let’s Get Started"),
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
