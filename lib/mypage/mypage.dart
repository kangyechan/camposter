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
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
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
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '포항시',
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
                        Text(
                          '한동대학교',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
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
                    "알림 태그",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  child: Text(
                    "수정",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12.0,
                    ),
                  ),
                  onTap: () {
                    print("태그 수정 기능");
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        child: Text(
                          '#한동대학교',
                          style: TextStyle(
                            color: CamPosterRed, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 30.0,
                        child: Text(
                          '#공모전',
                          style: TextStyle(
                            color: CamPosterRed, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 30.0,
                        child: Text(
                          '#전산전자공학부',
                          style: TextStyle(
                            color: CamPosterRed, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 30.0,
                        child: Text(
                          '#포항시',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        child: Text(
                          '#모바일 앱 개발',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 30.0,
                        child: Text(
                          '',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 30.0,
                        child: Text(
                          '',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 30.0,
                        child: Text(
                          '',
                          style: TextStyle(
                              color: CamPosterRed, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
                    "내 포스터",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  child: Text(
                    "수정",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12.0,
                    ),
                  ),
                  onTap: () {
                    print("포스터페이지 이동");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
