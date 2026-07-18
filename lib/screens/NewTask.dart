import 'dart:convert';
import 'package:to_do/app_exports.dart';

class newTask extends StatefulWidget {
  const newTask({super.key});

  @override
  State<newTask> createState() => _NewtaskState();
}

bool isSwitch = false;
GlobalKey<FormState> _kay = GlobalKey();


class _NewtaskState extends State<newTask> {TextEditingController taskName = TextEditingController();
TextEditingController taskDescription = TextEditingController();
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
        title: const Text(
          "New Task",

        ),
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
                      CustomText(text: "Task Name",fontSize: 16,fontWeight: FontWeight.w400,color:Colors.white ,)
                     ,
                      SizedBox(height: 8),
                      Textform(controller1:  taskName, validator: (String? value) {
                        if (value?.trim().isEmpty ?? false) {
                          return "please enter your full name";
                        } else {
                          return null;
                        }
                      } , color: Colors.white,
                          text: "Finish UI design for login screen"
                      ),

                      SizedBox(height: 20),
                      CustomText(text: "Task Description",fontSize: 16,fontWeight: FontWeight.w400,color:Colors.white ,)
,
                      SizedBox(height: 8),
                      Textform(controller1:  taskDescription, validator: (String? value) {return null;} , color: Colors.white,maxLines: 5,
                          text: "Finish onboarding UI and hand off to devs by Thursday."
                      ),

                      SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "High Priority",color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400,)

                          ,Switch(
                            value: isSwitch,
                            onChanged: (bool newvalue) {
                              setState(() {
                                isSwitch = newvalue;
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
                onPressed: () async{
                  if (_kay.currentState?.validate() ?? false) {
                    final model = TaskModule(
                        taskName: taskName.text,
                        taskDescription: taskDescription.text,
                        isSwitch: isSwitch,);
                    final pref= await SharedPreferences.getInstance();
                    final taskJson = pref.getString("task");
                    List<dynamic> listTask =[];
                    if(taskJson!=null){
                      listTask=jsonDecode(taskJson);
                    }
                    listTask.add(model.toMap());
                    final taskEncode= jsonEncode(listTask);
                  await  pref.setString("task", taskEncode);

                    if (mounted) {
                      Navigator.of(context).pop();
                    }

                   }
                },
                icon: Icon(Icons.add),
                text:"Add Task",

              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
