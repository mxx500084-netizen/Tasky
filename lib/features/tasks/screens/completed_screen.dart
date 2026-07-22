

import 'package:to_do/app_exports.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  List<TaskModel> _allTasks = [];
  List<TaskModel> _completedTasks = [];

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
      _completedTasks = _allTasks.where((task) => task.isDone).toList();
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
        title: const Text("Completed Tasks"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: _completedTasks.isEmpty
            ? Center(
                child: Text(
                  "No completed tasks yet!",
                  style: TextStyle(color: AppColors.textWhite, fontSize: 14.sp),
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                itemCount: _completedTasks.length,
                separatorBuilder: (context, index) => Gap(10.h),
                itemBuilder: (context, index) {
                  final task = _completedTasks[index];
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
