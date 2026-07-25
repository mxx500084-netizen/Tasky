import 'dart:io';
import 'package:to_do/app_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];
  String? name;
  String? motivationQuote;
  String? imagePath;
  bool isLoading = true;

  int total = 0;
  int done = 0;
  double present = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _updateProgress() {
    total = tasks.length;
    done = tasks.where((e) => e.isDone).length;
    present = total == 0 ? 0 : done / total;
  }

  Future<void> _loadData() async {
    setState(() => isLoading = true);
    final loadedName = PreferencesManager().getString('username');
    final loadedQuote = PreferencesManager().getString('motivationQuote');
    final loadedImage = PreferencesManager().getString('profile_image');

    final String? storedTasks = PreferencesManager().getString('task_list');

    List<TaskModel> loadedTasks = [];
    if (storedTasks != null && storedTasks.isNotEmpty) {
      final List<dynamic> decodedTasks = jsonDecode(storedTasks);
      loadedTasks = decodedTasks
          .map((item) => TaskModel.fromJson(item))
          .toList();
    }

    if (!mounted) return;

    setState(() {
      name = loadedName;
      motivationQuote = loadedQuote ?? "One task at a time. One step closer.";
      tasks = loadedTasks;
      imagePath = loadedImage;
      _updateProgress();
      isLoading = false;
    });
  }

  Future<void> _toggleTaskStatus(TaskModel task, bool? val) async {
    setState(() {
      task.isDone = val ?? false;
      _updateProgress();
    });

    final String encoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
    await PreferencesManager().setString('task_list', encoded);
  }

  void _onActionSelected(TaskModel task, TaskAction action) async {
    if (action == TaskAction.edit) {
      final index = tasks.indexOf(task);
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              NewTaskScreen(taskToEdit: task, taskIndex: index),
        ),
      );
      _loadData();
    } else if (action == TaskAction.delete) {
      setState(() {
        tasks.remove(task);
        _updateProgress();
      });
      final String encoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
      await PreferencesManager().setString('task_list', encoded);
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final highPriorityTasks = tasks.where((t) => t.isSwitch).toList();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10.h),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: imagePath != null
                              ? FileImage(File(imagePath!))
                              : const AssetImage(AppAssets.userAvatar)
                                    as ImageProvider,
                          backgroundColor: Colors.transparent,
                          radius: 20.r,
                        ),
                        Gap(18.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Evening, ${name ?? ''}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              motivationQuote ??
                                  "One task at a time. One step closer.",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(12.h),
                    Text(
                      "Yuhuu ,Your work Is ",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          "almost done !",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Gap(8.w),
                        SvgPicture.asset(
                          AppAssets.wavingHand,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ],
                    ),
                    Gap(12.h),
                    TaskProgressCard(
                      present: present,
                      done: done,
                      total: total,
                    ),
                    Gap(8.h),
                    HighPriorityCard(
                      highPriorityTasks: highPriorityTasks,
                      onStatusChanged: (task, val) =>
                          _toggleTaskStatus(task, val),
                      onNavigateBack: _loadData,
                    ),
                    Gap(12.h),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                      child: Text(
                        "My Tasks",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (tasks.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      "No tasks yet",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 80.h),
                  sliver: SliverList.separated(
                    itemCount: tasks.length,
                    separatorBuilder: (context, index) => Gap(10.h),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskListItem(
                        task: task,
                        onStatusChanged: (val) => _toggleTaskStatus(task, val),
                        onActionSelected: (action) =>
                            _onActionSelected(task, action),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 44.h,
          child: FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewTaskScreen()),
              );
              _loadData();
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add New Task'),
          ),
        ),
      ),
    );
  }
}
