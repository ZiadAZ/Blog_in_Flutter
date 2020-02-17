import 'package:ahmed_alsodani/scteens/home.dart';
import 'package:ahmed_alsodani/models//sliderModel.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBording extends StatefulWidget {
  @override
  _OnBordingState createState() {
    return _OnBordingState();
  }
}

class _OnBordingState extends State<OnBording> {


  List<Sliders> slidersList;
  ValueNotifier<int> _valueNotifier = ValueNotifier(0);



  void addPages() {
    slidersList = List<Sliders>();
    slidersList.add(Sliders(
        Icons.ac_unit,
        "Hello!",
        "Most apps contain several screens for displaying different types of information.",
        "img/1.jpg"));
    slidersList.add(Sliders(
        Icons.camera,
        "Hello!",
        "Most apps contain several screens for displaying different types of information. For example, an app might have a screen that displays products",
        "img/2.jpg"));
    slidersList.add(Sliders(
        Icons.account_balance,
        "Hello!",
        "Ziad  For example, an app might have a screen that displays products",
        "img/3.jpg"));
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    addPages();
    print("_OnBordingState build ");
    return Scaffold(
        body: Stack(children: <Widget>[
      PageView.builder(
        itemCount: slidersList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(slidersList[index].imgPath),
                        // child: Image.asset("img/1.jpg"),
                        fit: BoxFit.fill)),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(70.0),
                      child: Icon(
                        slidersList[index].icon,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      slidersList[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(slidersList[index].descripton,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        onPageChanged: (i) {
          _valueNotifier.value = i;
          print("onPageChanged");
        },
      ),
      Transform.translate(
        offset: Offset(0, 475),
        child: getPageViewIndicator(slidersList
            .length), //  بدلا من الموؤشرات التي سويتها لانها لا تعمل اعادة رسم
      ),
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Card(
              color: Colors.red.shade900,
              child: FlatButton(
                child: Text(
                  "GET STARTED ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    _seen();
                    return homePage();
                  }));
                },
              ),
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
      )
    ]));
  }
  Widget _drawCircle(Color color) {
    return Container(
      margin: EdgeInsets.all(4),
      width: 15,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget handIndecatorsZiad(int c) {
    List<Widget> list = List<Widget>();
    for (int i = 0; i < slidersList.length; i++)
      list.add(_drawCircle(i == c ? Colors.red : Colors.grey));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }

  PageViewIndicator getPageViewIndicator(int length) {
    print("getPageViewIndicator");
    return PageViewIndicator(
      pageIndexNotifier: _valueNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 16.0,
          color: Colors.red,
        ),
      ),
    );
  }



  _seen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("SEEN", true);
  }
}
