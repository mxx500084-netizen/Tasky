

import 'package:to_do/app_exports.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<TaskModel> _allTasks = [];
  List<TaskModel> _todoTasks = [];

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
      _todoTasks = _allTasks.where((task) => !task.isDone).toList();
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

  void _onActionSelected(TaskModel task, TaskAction action) async {
    if (action == TaskAction.edit) {
      final index = _allTasks.indexOf(task);
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewTaskScreen(
            taskToEdit: task,
            taskIndex: index,
          ),
        ),
      );
      _loadTasks();
    } else if (action == TaskAction.delete) {
      setState(() {
        _allTasks.remove(task);
      });
      final String encoded = jsonEncode(_allTasks.map((e) => e.toJson()).toList());
      await PreferencesManager().setString('task_list', encoded);
      _loadTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do Tasks"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: _todoTasks.isEmpty
            ? Center(
                child: Text(
                  "No pending tasks!",
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14.sp),
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                itemCount: _todoTasks.length,
                separatorBuilder: (context, index) => Gap(10.h),
                itemBuilder: (context, index) {
                  final task = _todoTasks[index];
                  return TaskListItem(
                    task: task,
                    onStatusChanged: (val) => _toggleTaskStatus(task, val),
                    onActionSelected: (action) => _onActionSelected(task, action),
                  );
                },
              ),
      ),
    );
  }
}
