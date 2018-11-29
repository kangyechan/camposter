import 'package:camposter/css/colors.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_picker/Picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final buttonActiveColor = CamPosterRed;
  final buttonDeActiveColor = CamPosterRed200;

  GlobalKey<AutoCompleteTextFieldState<String>> autoTextTitleFieldKey = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> autoTextTagFieldKey = new GlobalKey();

  bool categoryClicked = false;
  Color popularButtonColor, popularButtonBorderColor, categoryButtonColor, categoryButtonBorderColor;

  Widget currentBody;
  Widget currentAutoTextField;

  int posterNumber = 0;
  String currentSearchMethod = "제목";
  String queryPosterName, queryPosterCategory, queryTagName;
  String userId = "";
  String userName = "";

  List<String> categoryList = ["공모전", "취업", "신앙", "동아리", "학회", "공연"];
  List<String> searchMethodList = ["제목", "태그"];
  List<Color> categoryListColor = [
    CamPosterRed,
    CamPosterRed200,
    CamPosterRed200,
    CamPosterRed200,
    CamPosterRed200,
    CamPosterRed200
  ];
  List<Color> categoryListBorderColor = [
    CamPosterRed,
    CamPosterWhite,
    CamPosterWhite,
    CamPosterWhite,
    CamPosterWhite,
    CamPosterWhite
  ];

  List<String> titleSuggestions = [];
  List<String> tagSuggestions = [];

  List<String> myTags = [];
  double spinKitState = 0.0;

  @override
  void initState() {
    super.initState();
    print("debug schoolName");
    _showSpinKit();
    queryPosterName = null;
    queryPosterCategory = null;
    categoryButtonColor = buttonDeActiveColor;
    categoryButtonBorderColor = CamPosterWhite;
    popularButtonColor = buttonActiveColor;
    popularButtonBorderColor = buttonActiveColor;
    currentBody = _buildPopularBody();


  }

  Widget _buildTitleAutoCompleteTextField() {
    return AutoCompleteTextField<String>(
      key: autoTextTagFieldKey,
      submitOnSuggestionTap: true,
      suggestions: titleSuggestions,
      textChanged: (item) {
        queryPosterName = item;
      },
      textInputAction: TextInputAction.go,
      textSubmitted: (item) {
        setState(() {
          queryPosterName = item;
          currentBody = _buildPopularBody();
        });
      },
      itemBuilder: (context, item) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: new Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
        );
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildTagAutoCompleteTextField() {
    return AutoCompleteTextField<String>(
      key: autoTextTagFieldKey,
      submitOnSuggestionTap: true,
      suggestions: tagSuggestions,
      textChanged: (item) {
        queryTagName = item;
      },
      textInputAction: TextInputAction.go,
      textSubmitted: (item) {
        setState(() {
          queryTagName = item;
          if(myTags.length ==0) {
            myTags.add(item);
          } else {
            myTags.removeAt(0);
            myTags.add(item);
          }
          currentBody = _buildPopularBody();
        });
      },
      itemBuilder: (context, item) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
        );
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            _buildAppBar(),
            _buildButtonRow(),
            currentBody,
          ],
        ),
        Opacity(
          opacity: spinKitState,
          child: SpinKitCircle(
            color: Theme.of(context).primaryColor,
            size: 50.0,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/homelogo.png',
            height: 35.0,
          ),
          Flexible(
            child: Container(
              height: 50.0,
              margin: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          print("선택다이얼로그");
                          _showPickerDialog();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Text(
                              currentSearchMethod,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: currentAutoTextField,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.autorenew,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              setState(() {
                myTags.clear();
                currentBody = _buildPopularBody();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 36.0, 36.0, 26.0),
      child: Row(
        children: <Widget>[
          FlatButton(
            child: Container(
              padding: EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: popularButtonBorderColor, width: 3.0,
                  ),
                ),
              ),
              child: Text(
                '인기있는',
                style: TextStyle(
                  color: popularButtonColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            onPressed: () {
              popularButtonClicked();
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: FlatButton(
              child: Container(
                padding: EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: categoryButtonBorderColor, width: 3.0,
                    ),
                  ),
                ),
                child: Text(
                  '카테고리',
                  style: TextStyle(
                    color: categoryButtonColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              onPressed: () {
                categoryButtonClicked();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularBody() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _buildPopularHomeLeftView(),
                    _buildPopularPosterListView(),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildPopularHomeLeftView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 400.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '인기있는\n'
                  "포스터",
                  style: TextStyle(
                    color: CamPosterRed,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 35.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CamPosterRed200, width: 2.0
                        ),
                      ),
                    ),
                    child: Text(
                      '모든 카테고리',
                      style: TextStyle(
                        color: CamPosterRed200,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Text(
                '검색 태그',
                style: TextStyle(
                  color: CamPosterRed200,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildMyTagList(myTags),
              ),
            ),
            Text('검색된 포스터 : $posterNumber',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularPosterListView() {
    return Center(
      child: Text('buildPopularPosterListView'),
    );
  }

  Widget _buildPopularList() {
    return Center(
      child: Text("buildPopularList"),
    );
  }

  Widget _biuildPopularListItem(BuildContext context) {
    return Center(
      child: Text('_biuildPopularListItem'),
    );
  }

  Widget _buildCategoryBody() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _buildCategoryHomeLeftView(),
                    _buildCategoryPosterListView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildCategoryHomeLeftViewCategories(BuildContext context, List<String> categoryList, List<Color> categoryListColor) {
    List<Container> categories = [];
    for (var i = 0; i < categoryList.length; i++) {
      categories.add(
        Container(
          margin: EdgeInsets.only(bottom: 12.0),
          width: 100.0,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: categoryListBorderColor[i],
                  width: 2.0
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              categoryToggle(i, categoryList.length);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('#${categoryList[i]}',
                  style: TextStyle(
                    color: categoryListColor[i],
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return categories;
  }

  Widget _buildCategoryHomeLeftView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 400.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 30.0),
              margin: EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: CamPosterRed200,
                    width: 2.0,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    '카테고리\n'
                    '포스터',
                    style: TextStyle(
                      color: CamPosterRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildCategoryHomeLeftViewCategories(
                context, categoryList, categoryListColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryPosterListView() {
    return Center(
      child: Text("_buildCategoryPosterListView")
    );
  }

  var emptyCard = Container(
    width: 300.0,
    height: 350.0,
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 13 / 11,
            child: Image.asset(
              'images/logo.png',
              width: 500.0,
              height: 300.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.0, 20.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '해당 카테고리에 게시된 포스터가 없습니다.',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: <Widget>[],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );

  Widget _buildCategoryList() {
    return Center(
      child: Text("_buildCategoryList"),
    );
  }

  ///
  /// 인기있는 탭 선택
  ///

  void popularButtonClicked() {
    categoryClicked = false;
    if (!categoryClicked) {
      setState(() {
        popularButtonColor = buttonActiveColor;
        popularButtonBorderColor = buttonActiveColor;
        categoryButtonColor = buttonDeActiveColor;
        categoryButtonBorderColor = Colors.white;
        currentBody = _buildPopularBody();
        queryPosterName = null;
      });
    }
  }

  void categoryButtonClicked() {
    categoryClicked = true;
    if (categoryClicked) {
      setState(() {
        categoryButtonColor = buttonActiveColor;
        categoryButtonBorderColor = buttonActiveColor;
        popularButtonColor = buttonDeActiveColor;
        popularButtonBorderColor = Colors.white;
        currentBody = _buildCategoryBody();
        queryPosterName = null;
      });
    }
  }

  ///
  /// 카테고리 탭에서 토글기능
  ///

  void categoryToggle(int clickedCategory, int length) {
    setState(() {
      queryPosterCategory = categoryList[clickedCategory];
      categoryListColor[clickedCategory] = CamPosterRed;
      categoryListBorderColor[clickedCategory] = CamPosterRed;
      for (var i = 0; i < length; i++) {
        if (clickedCategory != i) {
          categoryListColor[i] = CamPosterRed200;
          categoryListBorderColor[i] = Colors.white;
        }
      }
      currentBody = _buildCategoryBody();
    });
  }

  ///
  /// 나의 태그 리스트
  ///

  List<Text> _buildMyTagList(List<String> myTagList) {
    List<Text> tagList = [
      Text('#포항시\n'
           '#한동대학교',
        style: TextStyle(
          color: CamPosterRed,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        )
      ),
    ];
    for (var i = 1; i < myTagList.length + 1; i++) {
      tagList.add(Text('#${myTagList[i - 1]}',
          style: TextStyle(
              color: CamPosterRed,
              fontSize: 16.0,
              fontWeight: FontWeight.bold)));
    }
    return tagList;
  }

  ///
  /// Search에 보여줄 Suggestion을 위해 모든 포스터 리스트를 DB에서 받아온다.
  ///



  ///

  _showPickerDialog() {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: ['제목', '태그']),
        hideHeader: true,
        title: new Text(
          "검색 방법",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        onConfirm: (Picker picker, List value) {
          setState(() {
            currentSearchMethod = picker.getSelectedValues()[0];
            if (currentSearchMethod == "태그") {

              currentAutoTextField = _buildTagAutoCompleteTextField();
            } else if (currentSearchMethod == "제목"){
              print(currentSearchMethod);
              currentAutoTextField = _buildTitleAutoCompleteTextField();
            }

          });
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  void _showSpinKit() {
    setState(() {
      spinKitState = 1.0;
    });
  }

  void _hideSpinKit() {
    setState(() {
      spinKitState = 0.0;
    });
  }
}
