import 'package:flutter/material.dart';
import 'package:to_do/screen/home.dart';
import 'package:to_do/screen/todo.dart';
import 'package:to_do/screen/Completed.dart';
import 'package:to_do/screen/Profile.dart';

import 'package:flutter_svg/flutter_svg.dart';
class mainPage extends StatefulWidget {
   const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
int _currentScreen=0;
final List<Widget> _screen=[
  MyWidget(),
  ToDoPage(),
  CompletedPage(),
  ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen,
onTap:(
    int? index
    ){
  setState(() {

_currentScreen=index??0;
});

} ,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff181818),
        unselectedItemColor: Color(0xffC6C6C6),
        selectedItemColor: Color(0xff15B86C),
        items: [BottomNavigationBarItem(icon: SvgPicture.asset('assets/Home.svg'
        ,colorFilter: ColorFilter.mode(
              _currentScreen==0? Color(0xff15B86C):Color(0xffC6C6C6)
          , BlendMode.srcIn),
        
        )
            , label: ("Home")
        ),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/ToDo.svg'
    ,colorFilter: ColorFilter.mode(
    _currentScreen==1? Color(0xff15B86C):Color(0xffC6C6C6)
    , BlendMode.srcIn),)
              , label: ("To Do")
          )
       ,   BottomNavigationBarItem(icon: SvgPicture.asset('assets/Complete.svg',colorFilter: ColorFilter.mode(
              _currentScreen==2? Color(0xff15B86C):Color(0xffC6C6C6)
              , BlendMode.srcIn),)
              , label: ("Complete")
          )
         , BottomNavigationBarItem(icon: SvgPicture.asset('assets/Profile.svg',colorFilter: ColorFilter.mode(
              _currentScreen==3? Color(0xff15B86C):Color(0xffC6C6C6)
              , BlendMode.srcIn),)
              , label: ("Profile")
          )
        ]
    ),

      body: _screen[_currentScreen],

    );
  }
}
