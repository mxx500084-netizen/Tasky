import 'dart:convert';
import 'package:to_do/app_exports.dart';

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _NewtaskState();
}

bool isSwitch = false;
GlobalKey<FormState> _kay = GlobalKey();
class _NewtaskState extends State<user> {

  TextEditingController newUserName = TextEditingController();
  TextEditingController motivationQuote = TextEditingController();

  @override
  void dispose() {
    newUserName.dispose();
    motivationQuote.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Details",

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
                      CustomText(text: "User Name",fontSize: 16,fontWeight: FontWeight.w400,color:Colors.white ,)
                      ,
                      SizedBox(height: 8),
                      Textform(controller1:  newUserName, validator: (String? value) {
                        if (value?.trim().isEmpty ?? false) {
                          return "please enter your New User name";
                        } else {
                          return null;
                        }
                      } , color: Colors.white,
                          text: "Usama Elgendy"
                      ),

                      SizedBox(height: 20),
                      CustomText(text: "Motivation Quote",fontSize: 16,fontWeight: FontWeight.w400,color:Colors.white ,)
                      ,
                      SizedBox(height: 8),
                      Textform(controller1:  motivationQuote, validator: (String? value) {
                        if (value?.trim().isEmpty ?? false) {
                          return "please enter your Motivation Quote";
                        } else {
                          return null;
                        }
                      } , color: Colors.white,maxLines: 5,
                          text: "One task at a time. One step closer."
                      ),

                      SizedBox(height: 28),
                      ]
                  ),
                ),
              ),
              CustomButton(text: "Save Changes", onPressed:  () async{
           if (_kay.currentState?.validate() ?? false) {
             final model = TaskModule(
               taskName: newUserName.text,
               taskDescription: motivationQuote.text,
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
         })
             , SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
