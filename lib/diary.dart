import 'package:flutter/material.dart';
import 'style.dart';

class Diary extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        theme: MaesilTheme.light,
        //darkTheme: MaesilTheme.dark,
        //themeMode: theme, //TODO: 추후 theme 상태 관리하는 객체? 추가해야함
        home: Scaffold(
            appBar: PreferredSize ( //앱바, 제목이 바뀌어야함
              preferredSize: const Size.fromHeight(50.0),
              child: AppBar(
                title: Text('일기'),
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
              child: Text('매실이가 쓴 일기 모가지가 너무 아프다 폼롤러로 뒷목을 조지고 나왔어야했는데 못했다. 고개를 숙이면 모가지 아프다 내일 수영 어케가지 쨲',
              style: TextStyle(
                fontFamily: 'NanumPen', fontSize: 24.0
              ))
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
