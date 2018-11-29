import 'package:camposter/calendarpage/calender.dart';
import 'package:camposter/chatpage/chat.dart';
import 'package:camposter/homepage/home.dart';
import 'package:camposter/likepage/like.dart';
import 'package:camposter/mypage/mypage.dart';
import 'package:flutter/material.dart';

class HomeBarPage extends StatefulWidget {
//  String schoolName;
//  HomeBarPage({Key key, @required this.schoolName}) : super(key: key);
  @override
  _HomeBarPageState createState() => _HomeBarPageState();
}

class _HomeBarPageState extends State<HomeBarPage> {
//  _HomeBarPageState({Key key, @required this.schoolName});

  String schoolName;
  int currentTab = 0;

  HomePage homePage;
  CalendarPage calendarPage;
  LikePage likePage;
  ChatPage chatPage;
  MyPage myPage;

  Widget currentPage;

  List<Widget> pages;
  List<String> pageTitles;

  @override
  void initState() {
    super.initState();

    homePage = HomePage();
    calendarPage = CalendarPage();
    likePage = LikePage();
    chatPage = ChatPage();
    myPage = MyPage();

    pages = [homePage, calendarPage, likePage, chatPage, myPage];
    pageTitles = ["Home", "Calendar", "Like", "Chat", "MyPage"];
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(icon: Icon(Icons.date_range), title: Text("Calendar", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(icon: Icon(Icons.grade), title: Text("Like", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), title: Text("Message", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(icon: Icon(Icons.face), title: Text("Mypage", style: TextStyle(fontSize: 12.0))),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}