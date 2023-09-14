import 'package:flutter/material.dart';
import 'style.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: MaesilTheme.light,
      //darkTheme: MaesilTheme.dark,
      //themeMode: theme, //TODO: 추후 theme 상태 관리하는 객체? 추가해야함
      home: Scaffold( //기본 구조 TODO: 추후 Scaffold 코드 따로 빼는 리팩토링하기
        appBar: PreferredSize ( //앱바, 제목이 바뀌어야함
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            title: Text('투두리스트'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.filter_alt), // 필터 아이콘
                onPressed: () {
                  // 아이콘 버튼 실행
                  print('필터링 아이콘 눌림');
                },
              ),
            ],
          ),
        ),
        body: Container(
          //앱 컨텐츠
          margin: EdgeInsets.fromLTRB(12, 25, 12, 0),
          color: MaesilColor.msLightBlue,
        ),
          drawer: Container(
            height: 605.0,
              child: Drawer(
                  child: ListView(
                      children: <Widget>[
                        DrawerHeader(child: Text('매실',
                            style: TextStyle(
                          fontSize: 24,
                        ))),
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
      )
    );
  }
}
