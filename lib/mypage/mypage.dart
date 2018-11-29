import 'package:flutter/material.dart';
import 'package:camposter/css/colors.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: CamPosterRed200,
      title: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          "마이 페이지",
          style: TextStyle(
            color: CamPosterWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(context, '/setting');
          }
        )
      ],
    );
  }

  Widget _buildBody() {
    return Center(
      child: ListView(
        children: [
          _buildTopContainer(),
          _buildBottomContainer(),
        ]
      )
    );
  }

  Widget _buildTopContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 40.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'images/logo.png',
                      ),
                    ),
                    color: CamPosterBackgroundWhite,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "이름",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '21300765',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            '내 포스터',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          onTap: () {
                            print("내가 게시한 포스터");
//                          Navigator.pushNamed(context, '/mypage_poster_iposted');
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      color: CamPosterRed200,
    );
  }

  Widget _buildBottomContainer() {
    return Container(
      padding: const EdgeInsets.only(left:30.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0),
                    ),
                  ),
                  child: Text(
                    "태그 수정",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  '나의 태그',
                  style: TextStyle(
                      color: CamPosterRed200, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 140.0),
                  child: Text(
                    '알림 태그',
                    style: TextStyle(
                        color: CamPosterRed200, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 170.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        child: Text(
                          '#나의 태그ㅇㅇㅇ',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        child: Text(
                          '#나의 태그ㅇㅇㅇ',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        child: Text(
                          '#나의 태그ㅇㅇㅇ',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        child: Text(
                          '#나의 태그ㅇㅇㅇ',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        child: Text(
                          '#나의 태그ㅇㅇㅇ',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        child: Text(
                          '#나의 태그ㅇㅇㅇ',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
