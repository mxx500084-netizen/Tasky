import 'package:flutter/material.dart';

class newTask extends StatefulWidget {
  const newTask({super.key});

  @override
  State<newTask> createState() => _NewtaskState();
}

bool isSwitch = false;
GlobalKey<FormState> _kay = GlobalKey();
TextEditingController taskName = TextEditingController();
TextEditingController taskDescription = TextEditingController();

class _NewtaskState extends State<newTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Task",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        centerTitle: false,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0XFF181818),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _kay,
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
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return "Please Enter Task Name ";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Finish UI design for login screen",
                          hintStyle: TextStyle(color: Color(0xff6D6D6D)),
                          filled: true,
                          fillColor: Color(0xff282828),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Task Description",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: taskDescription,
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return "Please Enter task Description";
                          }
                          return null;
                        },
                        maxLines: 5,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText:
                              "Finish onboarding UI and hand off to devs by Thursday.",
                          hintStyle: TextStyle(color: Color(0xff6D6D6D)),
                          filled: true,
                          hintMaxLines: 5,
                          fillColor: Color(0xff282828),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "High Priority",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Switch(
                            value: isSwitch,
                            onChanged: (bool newvalue) {
                              setState(() {
                                isSwitch = newvalue;
                              });
                            },
                            activeTrackColor: Color(0xff15B86C),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_kay.currentState?.validate() ?? false) {}
                },
                icon: Icon(Icons.add),
                label: Text("Add Task"),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(343, 40),
                  backgroundColor: Color(0xff15B86C),
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
