import 'dart:convert';
import 'package:to_do/module/task_module.dart';
import 'package:to_do/screens/NewTask.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String name = "";
  List<TaskModule> task = [];

  @override
  void initState() {
    super.initState();
    _loadName();
    _loadTask();
  }

  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username') ?? "";
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
      print(tasks);
      setState(() {
        task = tasks;
      });
      print("$taskAfterDecode");
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
                SizedBox(height: 10),
                Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/Leading element.png'),
                      width: 42,
                      height: 42,
                    ),
                    const SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Evening, $name",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "One task at a time. One step closer.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Yuhuu ,Your work Is ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "almost done !",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      "assets/waving-hand-medium-light-skin-tone-svgrepo-com 1.svg",
                    ),

                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: task.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(

                                height: 72,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff282828),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Checkbox(value: task[index].isDone, onChanged: (bool? value) async {

                                      setState(() {
                                        task  [index].isDone= value??false;

                                      });
                                      final pref = await SharedPreferences.getInstance();

                                      final String taskEncode = jsonEncode(task.map((element) => element.toMap()).toList());

                                      await pref.setString("task", taskEncode);
                                    }
                                    ,
                                      activeColor: Color(0xff15B86C),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4)),
                                    ),Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        Text(task[index].taskName,maxLines: 1,overflow:TextOverflow.ellipsis , style: TextStyle(
                                            decoration: task[index].isDone ? TextDecoration.lineThrough: TextDecoration.none,

                                      color:task[index].isDone? Color(0xffA0A0A0):Color(0xffFFFCFC) ,
                                                                      fontSize: 20),),
                                        Text(task[index].taskDescription, overflow:TextOverflow.ellipsis ,style: TextStyle(color: Color(0xffC6C6C6),fontSize: 14),),
                                      ],),
                                    )
                                  ,
                                    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
                                  
                                  ],
                                ),


                          ),
                      );
                    },
                  ),
                ),],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 44,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return newTask();
                  },
                ),
              );
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
