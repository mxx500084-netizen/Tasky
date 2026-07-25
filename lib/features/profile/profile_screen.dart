import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:to_do/app_exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? motivationQuote;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    final loadedName = PreferencesManager().getString('username');
    final loadedQuote = PreferencesManager().getString('motivationQuote');
    final loadedImage = PreferencesManager().getString('profile_image');
    if (!mounted) return;

    setState(() {
      name = loadedName;
      motivationQuote = loadedQuote ?? 'One task at a time. One step closer.';
      imagePath = loadedImage;
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text('Choose from Gallery'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text('Take a Photo'),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );

    if (source != null) {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        await PreferencesManager().setString('profile_image', image.path);
        setState(() {
          imagePath = image.path;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile"), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(20.h),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: imagePath != null
                      ? FileImage(File(imagePath!))
                      : const AssetImage(AppAssets.userAvatar) as ImageProvider,
                  backgroundColor: Colors.transparent,
                  radius: 60.r,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        size: 26.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(16.h),
          Text("$name", style: Theme.of(context).textTheme.titleLarge),
          Gap(4.h),
          Text(
            motivationQuote ?? 'One task at a time. One step closer.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ListTile(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => const UserDetailsScreen()),
              );
              _loadName();
            },
            title: Text(
              "User Details",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: CustomSvg(path: AppAssets.userIcon, autoColor: true),
            trailing: CustomSvg(path: AppAssets.arrowRight, autoColor: true),
          ),
          Divider(indent: 20.w, endIndent: 20.w),
          ListTile(
            title: Text(
              "Dark Mode",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: CustomSvg(path: AppAssets.leadingElement, autoColor: true),
            trailing: ValueListenableBuilder(
              valueListenable: ThemeController.themeNotifier,
              builder: (BuildContext context, value, Widget? child) {
                return Switch(
                  value: value == ThemeMode.dark,
                  onChanged: (bool value) async {
                    ThemeController.toggleTheme();
                  },
                );
              },
            ),
          ),
          Divider(indent: 20.w, endIndent: 20.w),
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
            title: Text(
              "Log out",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: CustomSvg(path: AppAssets.logOut, autoColor: true),
            trailing: CustomSvg(path: AppAssets.arrowRight, autoColor: true),
          ),
        ],
      ),
    );
  }
}
