import 'dart:convert';
import 'package:to_do/app_exports.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String name = "";
  List<TaskModule> task = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadName();
    _loadTask();
  }

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
      final tasks = taskAfterDecode.map((element) {
        return TaskModule.fromjson(element);
      }).toList();

      setState(() {
        task = tasks;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/Leading element.png'),
                      backgroundColor: Colors.transparent,
                      radius: 20,
                    ),
                    const SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Good Evening, $name",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: "One task at a time. One step closer.",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const
                CustomText(
                  text: "Yuhuu ,Your work Is ",
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                  color: Colors.white,
                ),

                Row(
                  children: [
                    const
                    CustomText(
                      text: "almost done !",
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: Colors.white,
                    ),

                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      "assets/waving-hand-medium-light-skin-tone-svgrepo-com 1.svg",
                    ),
                  ],
                ),
                Expanded(
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : ListWidget(
                          tasks: task,
                          ontap: (bool? value, int index) async {
                            setState(() {
                              task[index].isDone = value ?? false;
                            });
                            final pref = await SharedPreferences.getInstance();
                            final String taskEncode = jsonEncode(
                              task.map((element) => element.toMap()).toList(),
                            );
                            await pref.setString("task", taskEncode);
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 44,
          child: FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return newTask();
                  },
                ),
              );
              _loadTask();
            },
            backgroundColor: const Color(0xff15B86C),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add New Task'),
          ),
        ),
      ),
    );
  }
}
