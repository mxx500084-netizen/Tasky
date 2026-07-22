
import 'package:to_do/app_exports.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool isSwitch = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();

  @override
  void dispose() {
    taskName.dispose();
    taskDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Task"),
      ),
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
                      CustomText(
                        text: "Task Name",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textWhite,
                      ),
                      Gap(8.h),
                      CustomTextForm(
                        controller1: taskName,
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter task name";
                          }
                          return null;
                        },
                        color: AppColors.textWhite,
                        text: "Finish UI design for login screen",
                      ),
                      Gap(20.h),
                      CustomText(
                        text: "Task Description",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textWhite,
                      ),
                      Gap(8.h),
                      CustomTextForm(
                        controller1: taskDescription,
                        validator: (String? value) => null,
                        color: AppColors.textWhite,
                        maxLines: 5,
                        text: "Finish onboarding UI and hand off to devs by Thursday.",
                      ),
                      Gap(28.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "High Priority",
                            color: AppColors.textWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          Switch(
                            value: isSwitch,
                            onChanged: (bool newValue) {
                              setState(() {
                                isSwitch = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final newTask = TaskModel(
                      taskName: taskName.text.trim(),
                      taskDescription: taskDescription.text.trim(),
                      isSwitch: isSwitch,
                      isDone: false,
                    );

                    final String? storedTasks = PreferencesManager().getString('task_list');
                    List<TaskModel> tasks = [];
                    if (storedTasks != null && storedTasks.isNotEmpty) {
                      final List<dynamic> decodedTasks = jsonDecode(storedTasks);
                      tasks = decodedTasks.map((item) => TaskModel.fromJson(item)).toList();
                    }
                    tasks.add(newTask);
                    final String encoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
                 final result=   await PreferencesManager().setString('task_list', encoded);
if(result==true){ if (context.mounted) {
  Navigator.pop(context);
}}

                  }
                },
                icon: const Icon(Icons.add),
                text: "Add Task",
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
