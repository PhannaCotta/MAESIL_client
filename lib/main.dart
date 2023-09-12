import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'todolist.dart';
import 'diary.dart';
import 'record.dart';
import 'accountbook.dart';
import 'menstruation.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp())); // 요일 한국어로 바꾸기(Sun, Mon, ... => 일, 월, ...)
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/calendar',
      routes: {
        '/calendar': (context) => MyHomePage(title: '매일, 실속있는'),
        '/todolist': (context) => ToDoList(),
        '/diary': (context) => Diary(),
        '/record': (context) => Record(),
        '/accountbook': (context) => AccountBook(),
        '/menstruation': (context) => Menstruation(),
        //'/settings': (context) => MyHomePage(title: '매일, 실속있는'),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Maesil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // 사용자가 다른 날짜 선택 시 해당 날짜 표시를 위한 데이터
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  Color ggongjiBlue = Color.fromARGB(255, 18, 115, 180);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),

            Expanded( // 캘린더의 높이가 디바이스의 화면 크기에 맞춰서 설정되도록 Expanded 위젯 추가
              child: TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2023, 12, 31),
                focusedDay: DateTime.now(),
                // Customize calendar properties here
                locale: 'ko-KR', // 한국어로 설정
                daysOfWeekHeight: 30, // 요일 줄 높이 설정
                shouldFillViewport: true, // 세로로 화면에 꽉 차게 하는 설정
                // 선택된 날짜의 상태를 갱신
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  setState((){
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                // selectedDay 와 동일한 날짜의 모양을 바꿔줌
                selectedDayPredicate: (DateTime day) {
                  // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                  return isSameDay(selectedDay, day);
                },
                calendarStyle: const CalendarStyle(
                  cellMargin : EdgeInsets.all(2.0), // cell의 margin
                  cellPadding : EdgeInsets.all(2.0), // cell의 padding
                  cellAlignment : Alignment.topLeft, // cell 내부 정렬 설정 (좌측 상단)
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false, // 2 weeks 버튼 뜨는 거 안 보이게(무슨 기능인지 모르겠음)
                  titleCentered: true, // 'n월' 글자 가운데로
                  //titleTextFormatter: , // title 의 날짜 형태 (ex : titleTextFormatter: (date, locale) => DateFormat.yM(locale).format(date),)
                  titleTextStyle: TextStyle(fontSize: 30.0),
                ),
                // 각 날짜 셀에 대한 스타일을 지정하는 부분
                calendarBuilders: CalendarBuilders(
                  // 선택된 날짜 스타일 설정
                  selectedBuilder: (context, date, events) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.topLeft, // 셀 내부 정렬
                      // 테두리에 네모 모양으로 설정
                      decoration: BoxDecoration(
                        color: Colors.transparent, // 사용자가 선택한 날짜의 배경 색상 (네모 안, 투명으로 설정)
                        border: Border.all(color: Colors.red, width: 0.5), // 네모 테두리 스타일
                        borderRadius: BorderRadius.circular(5.0), // 코너 둥근 정도
                      ),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                  // 오늘 날짜 스타일 설정
                  todayBuilder: (context, date, events) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.transparent, // 사용자가 선택한 날짜의 배경 색상 (네모 안, 투명으로 설정)
                        border: Border.all(color: ggongjiBlue, width: 0.5), // 네모 테두리 스타일
                        borderRadius: BorderRadius.circular(5.0), // 코너 둥근 정도
                      ),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
            ),


          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
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
    );
  }
}
