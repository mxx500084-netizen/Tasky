import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/app_exports.dart';



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
                      CustomText(
                        text: "Task",
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textWhite,
                      ),
                    ],
                  ),
                  Gap(70.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Welcome To Tasky",
                        color: AppColors.textWhite,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
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
                      CustomText(
                        text: "Your productivity journey starts here.",
                        color: AppColors.textWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
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
                            CustomText(
                              text: "Full Name",
                              color: AppColors.textWhite,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            Gap(8.h),
                            CustomTextForm(
                              controller1: controller,
                              validator: (String? value) {
                                return null;
                              },
                              color: AppColors.textWhite,
                              text: "e.g. Sarah Khalid",
                            ),
                            Gap(24.h),
                            CustomButton(
                              text: "Let’s Get Started",
                              onPressed: () async {
                                String name = controller.text.trim();

                                if (name.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content: Text(
                                        "Please enter your full name",
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                await PreferencesManager().setString('username',name );
                                await PreferencesManager().setString('motivationQuote',"One task at a time. One step closer." );



                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) => const MainNavigationScreen(),
                                    ),
                                  );
                                }
                              },
                            ),
                            Gap(50.h)
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
