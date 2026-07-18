import 'package:to_do/app_exports.dart';

class ProfilePage extends StatefulWidget {
   const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSwitch =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("My Profile")
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/Leading element.png'),
                  backgroundColor: Colors.transparent,
                  radius: 60,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 30),
 CustomText(text: 'One task at a time. One step closer.',color: Color(0XFFC6C6C6),fontSize: 14,),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c)=>
              user(),

              ));

            },
            title:  Text("User Details"),
            leading:  SvgPicture.asset("assets/user-03.svg"),
            trailing: SvgPicture.asset("assets/arrow-right.svg"),
            textColor: Colors.white,

          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            color: Color(0xff6E6E6E),
            thickness: 1,
          ),

          ListTile(
            title:  Text("Dark Mode"),
            leading:  SvgPicture.asset("assets/Leading element.svg"),
            trailing:  Switch(value: isSwitch, onChanged: (bool value){
              setState(( ) {
                isSwitch= value;
              });
            }),
            textColor: Colors.white,

          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            color: Color(0xff6E6E6E),
            thickness: 1,
          ),

          ListTile( onTap: (){
          },
            title:  Text("Log out"),
            leading:  SvgPicture.asset("assets/log-out-01.svg"),
            trailing: SvgPicture.asset("assets/arrow-right.svg"),
            textColor: Colors.white,

          ),
        ],
      ),
    );
  }
}