import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/screens/NewTask.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String name = "";

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username') ?? "";
    });
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
              SizedBox(height: 10,),
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
                const SizedBox(
                  height: 24,
                ), 
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
              ],
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
