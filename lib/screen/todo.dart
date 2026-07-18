import 'package:to_do/app_exports.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // 1. Declare your state variables here
  bool isLoading = true;
  String name = "";
  List<TaskModule> task = [];

  // 2. Move initState inside the State class
  @override
  void initState() {
    super.initState();
    _loadName();
    _loadTask();
  }

  // 3. Move your helper methods inside the State class
  Future<void> _loadName() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString('username') ?? "";
      isLoading = false;
    });
  }

  Future<void> _loadTask() async {
    final pref = await SharedPreferences.getInstance();
    final finalTask = pref.getString("task");

    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;
      setState(() {
        final tasks = taskAfterDecode.map((element) {
          return TaskModule.fromjson(element);
        }).toList();
        task=tasks.where(((element) => element.isDone==false)).toList();
      });

      setState(() {
        task = task;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: isLoading
            ? const Center(
          child: CircularProgressIndicator(color: Colors.white),
        )
            : ListWidget(
          tasks: task,
          ontap: (bool? value, int index) async{
            setState(() {
              task[index].isDone = value ?? false;
            });
            final pref = await SharedPreferences.getInstance();
            final String taskEncode = jsonEncode(task
                .map((element) => element.toMap())
                .toList());
            await pref.setString("task", taskEncode);
          },
        ),
      ),
    );
  }
}