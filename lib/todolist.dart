import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('투두리스트'),
        ),
        body: Container(
          color: Colors.cyan,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('투두리스트으으으',
                style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('뒤로가기이'),
                ),
              ],
            )
          )
        ),
          drawer: Drawer(
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Text('매실'),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      title: Text('캘린더'),
                      onTap: () {
                        Navigator.pushNamed(context, '/calendar');
                      },
                    ),
                    ListTile(
                      title: Text('투두리스트'),
                      onTap: () {
                        Navigator.pushNamed(context, '/todolist');
                      },
                    ), ListTile(
                      title: Text('일기'),
                      onTap: () {
                        Navigator.pushNamed(context, '/diary');
                      },
                    ), ListTile(
                      title: Text('기록'),
                      onTap: () {
                        Navigator.pushNamed(context, '/record');
                      },
                    ), ListTile(
                      title: Text('가계부'),
                      onTap: () {
                        Navigator.pushNamed(context, '/accountbook');
                      },
                    ), ListTile(
                      title: Text('월경주기관리'),
                      onTap: () {
                        Navigator.pushNamed(context, '/menstruation');
                      },
                    ),
                    ListTile(
                      title: Text('설정'),
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                    ),
                  ]
              )
          )
      )
    );
  }
}
