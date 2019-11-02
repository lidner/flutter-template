import 'package:flutter/material.dart';
import 'package:myapp/pages/chat.dart';
import 'package:myapp/pages/dashboard.dart';
import 'package:myapp/pages/profile.dart';
import 'package:myapp/pages/settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Свойства

  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    Chat(),
    Profile(),
    Settings()
  ]; //Все страницы

  //Активный таб (страница)
  
  Widget currentScreen = Dashboard(); //иницилизируем первым скрином Dashboard

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      //Fab Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: (){},
      ),

      //Fab Button Position
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Bottom App Bar

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                       currentScreen = Dashboard();
                       currentTab = 0; 
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Icon(Icons.dashboard, color: currentTab == 0 ? Colors.blue : Colors.grey,),
                      Text('Dashboard', style: TextStyle(color: currentTab == 0 ? Colors.blue : Colors.grey,),
                      )
                    ],),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                       currentScreen = Chat();
                       currentTab = 1; 
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Icon(Icons.chat, color: currentTab == 1 ? Colors.blue : Colors.grey,),
                      Text('Chat', style: TextStyle(color: currentTab == 1 ? Colors.blue : Colors.grey,),
                      )
                    ],),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                       currentScreen = Profile();
                       currentTab = 2; 
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Icon(Icons.person, color: currentTab == 2 ? Colors.blue : Colors.grey,),
                      Text('Profile', style: TextStyle(color: currentTab == 2 ? Colors.blue : Colors.grey,),
                      )
                    ],),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                       currentScreen = Settings();
                       currentTab = 3; 
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Icon(Icons.settings, color: currentTab == 3 ? Colors.blue : Colors.grey,),
                      Text('Settings', style: TextStyle(color: currentTab == 3 ? Colors.blue : Colors.grey,),
                      )
                    ],),
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}