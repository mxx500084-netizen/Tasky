import 'package:to_do/app_exports.dart';

import '../../core/constants/storageKey.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.logo,
                        width: 42.w,
                        height: 42.h,
                      ),
                      Gap(16.w),
                      Text(
                        "Task",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Gap(70.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome To Tasky",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        AppAssets.wavingHand,
                        width: 28.w,
                        height: 28.h,
                      ),
                    ],
                  ),
                  Gap(8.h),
                  Column(
                    children: [
                      Text(
                        "Your productivity journey starts here.",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Gap(50.h),
                      SvgPicture.asset(
                        AppAssets.welcomeIllustration,
                        width: 215.w,
                        height: 204.h,
                      ),
                      Gap(80.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Gap(8.h),
                            CustomTextForm(
                              controller1: controller,
                              validator: (String? value) {
                                return null;
                              },
                              text: "e.g. Sarah Khalid",
                            ),
                            Gap(24.h),
                            CustomButton(
                              text: "Let’s Get Started",
                              onPressed: () async {
                                String name = controller.text.trim();

                                if (name.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Theme.of(context).colorScheme.error,
                                      content: const Text(
                                        "Please enter your full name",
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                await PreferencesManager().setString(
                                  Storagekey.username,
                                  name,
                                );
                                await PreferencesManager().setString(
                                  Storagekey.motivationQuote,
                                  "One task at a time. One step closer.",
                                );

                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) =>
                                          const MainNavigationScreen(),
                                    ),
                                  );
                                }
                              },
                            ),
                            Gap(50.h),
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
      ),
    );
  }
}
