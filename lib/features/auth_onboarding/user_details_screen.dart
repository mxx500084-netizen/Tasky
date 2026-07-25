import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/app_exports.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  String? name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController newUserName = TextEditingController();
  final TextEditingController motivationQuote = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    final username =   PreferencesManager().getString('username');
    final quote = PreferencesManager().getString('motivationQuote');



    if (!mounted) return;
    setState(() {
      newUserName.text = username ?? "";
      motivationQuote.text = quote ?? "";
    });
  }

  Future<void> _updateDetails(String newName, String newQuote) async {
    await PreferencesManager().setString('username',newName);
    await PreferencesManager().setString('motivationQuote',newQuote);


    if (!mounted) return;
    setState(() {
      name = newName;
    });
  }

  @override
  void dispose() {
    newUserName.dispose();
    motivationQuote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style:Theme.of(context).textTheme.titleLarge,
                      ),
                      Gap(8.h),
                      CustomTextForm(
                        controller1: newUserName,
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your New User name";
                          }
                          return null;
                        },

                        text: "Usama Elgendy",
                      ),
                      Gap(20.h),
                      Text(
                        "Motivation Quote",
                        style:Theme.of(context).textTheme.titleLarge,
                      ),
                      Gap(8.h),
                      CustomTextForm(
                        controller1: motivationQuote,
                        validator: (String? value) {
                          return null;
                        },

                        maxLines: 5,
                        text: "One task at a time. One step closer.",
                      ),
                      Gap(28.h),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: "Save Changes",
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String finalQuote = motivationQuote.text.trim();
                    if (finalQuote.isEmpty) {
                      finalQuote = "One task at a time. One step closer.";
                      motivationQuote.text = finalQuote;
                    }

                    await _updateDetails(newUserName.text.trim(), finalQuote);

                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
