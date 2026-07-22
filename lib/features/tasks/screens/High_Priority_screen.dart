

import 'package:to_do/app_exports.dart';
class HighPriorityScreen extends StatefulWidget {
  const HighPriorityScreen({super.key});

  @override
  State<HighPriorityScreen> createState() => _HighPriorityScreenState();
}

class _HighPriorityScreenState extends State<HighPriorityScreen> {
  List<TaskModel> _allTasks = [];
  List<TaskModel> _highPriorityTasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final String? storedTasks = PreferencesManager().getString('task_list');
    List<TaskModel> tasks = [];
    if (storedTasks != null && storedTasks.isNotEmpty) {
      final List<dynamic> decodedTasks = jsonDecode(storedTasks);
      tasks = decodedTasks.map((item) => TaskModel.fromJson(item)).toList();
    }
    if (!mounted) return;

    setState(() {
      _allTasks = tasks;
      _highPriorityTasks = _allTasks.where((task) => task.isSwitch).toList().reversed.toList();
    });
  }

  Future<void> _toggleTaskStatus(TaskModel task, bool? val) async {
    setState(() {
      task.isDone = val ?? false;
    });
    final String encoded = jsonEncode(_allTasks.map((e) => e.toJson()).toList());
    await PreferencesManager().setString('task_list', encoded);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("High Priority Tasks"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: _highPriorityTasks.isEmpty
            ? Center(
                child: Text(
                  "No high priority tasks!",
                  style: TextStyle(color: AppColors.textWhite, fontSize: 14.sp),
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                itemCount: _highPriorityTasks.length,
                separatorBuilder: (context, index) => Gap(10.h),
                itemBuilder: (context, index) {
                  final task = _highPriorityTasks[index];
                  return TaskListItem(
                    task: task,
                    onStatusChanged: (val) => _toggleTaskStatus(task, val),
                  );

                },
              ),
      ),
    );
  }
}
