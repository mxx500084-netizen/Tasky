import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/app_exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitch = true;
  String? name;
  String? motivationQuote;

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    final loadedName =   PreferencesManager().getString('username');
    final loadedQuote = PreferencesManager().getString('motivationQuote');


    if (!mounted) return;

    setState(() {
      name = loadedName;
      motivationQuote = loadedQuote ?? 'One task at a time. One step closer.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(20.h),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(AppAssets.userAvatar),
                  backgroundColor: Colors.transparent,
                  radius: 60.r,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 26.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(16.h),
          CustomText(
            text: "$name",
            color: AppColors.textWhite,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          Gap(4.h),
          CustomText(
            text: motivationQuote ?? 'One task at a time. One step closer.',
            color: AppColors.textGrey,
            fontSize: 14.sp,
          ),
          ListTile(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => const UserDetailsScreen()),
              );
              _loadName();
            },
            title: const Text("User Details"),
            leading: SvgPicture.asset(AppAssets.userIcon),
            trailing: SvgPicture.asset(AppAssets.arrowRight),
            textColor: AppColors.textWhite,
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: AppColors.dividerGrey,
            thickness: 1,
          ),
          ListTile(
            title: const Text("Dark Mode"),
            leading: SvgPicture.asset(AppAssets.leadingElement),
            trailing: Switch(
              value: isSwitch,
              onChanged: (bool value) {
                setState(() {
                  isSwitch = value;
                });
              },
            ),
            textColor: AppColors.textWhite,
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: AppColors.dividerGrey,
            thickness: 1,
          ),
          ListTile(
            onTap: () async {
              await PreferencesManager().remove('username');
              await PreferencesManager().remove('motivationQuote');
              await PreferencesManager().remove('task_list');


              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (c) => const WelcomeScreen()),
                  (Route<dynamic> route) => false,
                );
              }
            },
            title: const Text("Log out"),
            leading: SvgPicture.asset(AppAssets.logOut),
            trailing: SvgPicture.asset(AppAssets.arrowRight),
            textColor: AppColors.textWhite,
          ),
        ],
      ),
    );
  }
}
