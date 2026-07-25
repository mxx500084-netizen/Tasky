import 'package:to_do/app_exports.dart';

class NewTaskScreen extends StatefulWidget {
  final TaskModel? taskToEdit;
  final int? taskIndex;

  const NewTaskScreen({super.key, this.taskToEdit, this.taskIndex});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool isSwitch = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.taskToEdit != null) {
      taskName.text = widget.taskToEdit!.taskName;
      taskDescription.text = widget.taskToEdit!.taskDescription;
      isSwitch = widget.taskToEdit!.isSwitch;
    }
  }

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
        title: Text(widget.taskToEdit != null ? "Edit Task" : "New Task"),
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
                      Text(
                        "Task Name",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
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

                        text: "Finish UI design for login screen",
                      ),
                      Gap(20.h),
                      Text(
                        "Task Description",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Gap(8.h),
                      CustomTextForm(
                        controller1: taskDescription,
                        validator: (String? value) => null,

                        maxLines: 5,
                        text:
                            "Finish onboarding UI and hand off to devs by Thursday.",
                      ),
                      Gap(28.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "High Priority",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
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
                      isDone: widget.taskToEdit?.isDone ?? false,
                    );

                    final String? storedTasks = PreferencesManager().getString(
                      'task_list',
                    );
                    List<TaskModel> tasks = [];
                    if (storedTasks != null && storedTasks.isNotEmpty) {
                      final List<dynamic> decodedTasks = jsonDecode(
                        storedTasks,
                      );
                      tasks = decodedTasks
                          .map((item) => TaskModel.fromJson(item))
                          .toList();
                    }

                    if (widget.taskIndex != null &&
                        widget.taskIndex! < tasks.length) {
                      tasks[widget.taskIndex!] = newTask;
                    } else {
                      tasks.add(newTask);
                    }

                    final String encoded = jsonEncode(
                      tasks.map((e) => e.toJson()).toList(),
                    );
                    final result = await PreferencesManager().setString(
                      'task_list',
                      encoded,
                    );
                    if (result == true) {
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }
                  }
                },
                icon: Icon(widget.taskToEdit != null ? Icons.save : Icons.add),
                text: widget.taskToEdit != null ? "Save Changes" : "Add Task",
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
