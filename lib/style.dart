import 'package:flutter/material.dart';

class MaesilColor { //색상 정의
  static const Color msBlue = Color(0xff1273B4); //메인 색상, 아이콘, 버튼, 선택 시 색상
  static const Color msLightBlue = Color(0xffB4E2FF); //목록 상자 색깔
  static const Color msRed = Color(0xffC6362B);
  static const Color msCoral = Color(0xffE58262);
  static const Color msGreen = Color(0xff96C250);
  static const Color msBlack = Color(0xff181015);
  static const Color msDarkGray = Color(0xff494c53);
  static const Color msWhite = Color(0xffCBC9D3);
}

class MaesilText { //텍스트 스타일 정의
  static final TextTheme msLightDefault = TextTheme(
    //headline1: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
  );
  static final TextTheme msDarkDefault = TextTheme(
    //headline1: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
  );
}

class MaesilTheme { //매실이 앱 기본 테마
  static final ThemeData light = ThemeData( //기본 테마
    textTheme: MaesilText.msLightDefault,

    appBarTheme: AppBarTheme( //앱바 테마
      backgroundColor: Colors.white,//앱바 배경색
      elevation: 0, //shadow? 박스다 떠있는 느낌주는 속성
      centerTitle: true,
      titleTextStyle: TextStyle(color: MaesilColor.msBlue),
      actionsIconTheme: IconThemeData(color: MaesilColor.msBlue),
      iconTheme: IconThemeData(color: MaesilColor.msBlue),
    ),

    drawerTheme: DrawerThemeData( //drawer 테마
      backgroundColor: Colors.white,
      width: 252.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15)),
      ),
    ),

    listTileTheme: ListTileThemeData(
      textColor: MaesilColor.msBlack,
      titleTextStyle: TextStyle(fontSize: 16),
      selectedTileColor: MaesilColor.msBlue,
      selectedColor: MaesilColor.msLightBlue,
    ),

  );
  static final ThemeData dark = ThemeData( //다크모드
    textTheme: MaesilText.msLightDefault,
    appBarTheme: AppBarTheme( //앱바 테마
    backgroundColor: MaesilColor.msBlack,//앱바 배경색
    titleTextStyle: TextStyle(color: MaesilColor.msBlue),
    actionsIconTheme: IconThemeData(color: MaesilColor.msBlue),
    iconTheme: IconThemeData(color: MaesilColor.msBlue),
    )
  );
}