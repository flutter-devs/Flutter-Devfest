import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest_gdg_newdelhi/notifiers/dark_theme_provider.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/agenda_screen.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/speaker_list.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/sponsors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> animation;
  bool cirAn = false;

  @override
  void initState() {
    super.initState();
//    upcomingEventBloc.loadScreenScreen();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
      // reverseCurve: Curves.easeInOut
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    var size = MediaQuery.of(context).size;
    return cirAn
        ? CircularRevealAnimation(
            center: Offset(size.height / 15, size.width / 3.5),
            animation: animation,
            child: homeBody(
              themeProvider,
            ),
          )
        : homeBody(themeProvider);

//      StreamBuilder<bool>(
//
//        stream: upcomingEventBloc.connectionStream,
//        builder: (context, connectivitySnapshot) {
//          print(connectivitySnapshot.data);
//
//          if (connectivitySnapshot.hasData) {
//            if (connectivitySnapshot.data) {
//              return StreamBuilder<UpComingEventsResponse>(
//                stream: upcomingEventBloc.upComingEventsStream,
//                builder:
//                    (context, AsyncSnapshot<UpComingEventsResponse> snapshot) {
//                  if (snapshot.hasData) {
//                    if (snapshot.data.status == 200) {
//                      print(snapshot.data);
//                      return cirAn
//                          ? CircularRevealAnimation(
//                        center:
//                        Offset(size.height / 15, size.width / 3.5),
//                        animation: animation,
//                        child: homeBody(themeProvider, upcomingEvent),
//                      )
//                          : homeBody(themeProvider, upcomingEvent);
//                    } else {
//                      return Container(
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Text(
//                              snapshot.data.message,
//                              textAlign: TextAlign.center,
//                              style: Styles.defaultTextStyle,
//                            ),
//                            SizedBox(
//                              height: 10,
//                            ),
//                            CustomPopUPButton(
//                              voidCallback: () {
//                                upcomingEventBloc.loadScreenScreen();
//                              },
//                              title: "Retry",
//                            ),
//                          ],
//                        ),
//                      );
//                    }
//                  } else if (snapshot.hasError || snapshot == null) {
//                    print("has error");
//
//                    return Container(
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Text(
//                              "Failed to load detail\nPlease try again!",
//                              textAlign: TextAlign.center,
//                              style: Styles.defaultTextStyle,
//                            ),
//                            SizedBox(
//                              height: 10,
//                            ),
//                            CustomPopUPButton(
//                              voidCallback: () {
//                                upcomingEventBloc.loadScreenScreen();
//                              },
//                              title: "Retry",
//                            ),
//                          ],
//                        ));
//                  }
//                  return SpinKitThreeBounce(color: Styles.purpleColor);
//                },
//              );
//            } else {
//              return Container(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Text(
//                      "you are not connected to internet",
//                      textAlign: TextAlign.center,
//                      style: Styles.defaultTextStyle,
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    CustomPopUPButton(
//                      voidCallback: () {
//                        upcomingEventBloc.loadScreenScreen();
//                      },
//                      title: "Retry",
//                    ),
//                  ],
//                ),
//              );
//            }
//          } else {
//            print("dusri wali");
//            return SpinKitThreeBounce(color: Styles.purpleColor);
//          }
//        });
  }

  Widget homeBody(DarkThemeProvider themeProvider) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              new Positioned(
                left: MediaQuery.of(context).size.width / 1.15, //230.0,
                bottom: MediaQuery.of(context).size.width / 1,

                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 5,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.2, //230.0,
                bottom: MediaQuery.of(context).size.width / 0.69, //40
                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 5,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              new Positioned(
                left: MediaQuery.of(context).size.width / 1.1, //230.0,
                top: MediaQuery.of(context).size.width / 0.8, //40.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height / 4,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.05, //230.0,
                bottom: MediaQuery.of(context).size.width / 1.3, //40.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 8,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).focusColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                left: MediaQuery.of(context).size.width / 1.1, //230.0,
                bottom: MediaQuery.of(context).size.width / 0.7, //40.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 8,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).hintColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.2, //230.0,
                top: MediaQuery.of(context).size.width / 2.5, //40.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.height / 12,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).indicatorColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.18, //230.0,
//              bottom: MediaQuery.of(context).size.width / 0.68, //40.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      cirAn = true;
                    });
                    themeProvider.darkTheme = !themeProvider.darkTheme;

                    if (animationController.status == AnimationStatus.forward ||
                        animationController.status ==
                            AnimationStatus.completed) {
                      animationController.reset();
                      animationController.forward();
                    } else {
                      animationController.forward();
                    }
                  },
                  child: new Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.height / 15,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).hoverColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, bottom: 28),
                      child: themeProvider.darkTheme
                          ? Image.asset(
                              "assets/bulb_off.png",
                              fit: BoxFit.fitHeight,
                            )
                          : Image.asset(
                              "assets/bulb_on.png",
                              fit: BoxFit.fitHeight,
                            ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.2, //230.0,
                top: MediaQuery.of(context).size.width / 0.69, //40
                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 5,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              ),
              new Column(
                children: <Widget>[
                  Flexible(
                    child: new Container(
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: Stack(
                        children: <Widget>[
                          _logo(themeProvider, context),
                        ],
                      ),
                    ),
                    flex: 3,
                  ),
                  Flexible(
                      flex: 6,
                      child: _description(
                        context,
                      )),
                  Flexible(
                    flex: 2,
                    child: _optionsScreen(context),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }
}

Widget _logo(DarkThemeProvider themeChangeProvider, context) {
  var size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.only(top: 40, bottom: 0.0, left: 25.0, right: 25.0),
    height: size.height / 6,
    width: size.width / 2,
    child: GestureDetector(
        onTap: () {},
        child: themeChangeProvider.darkTheme
            ? Image.asset("assets/logo_dark.png")
            : Image.asset("assets/logo-light.png")),
  );
}

Widget _description(
  context,
) {
//  var upcomingEventsData = upcomingEvent.data.attributes;
//  print(upcomingEventsData.name);

  var size = MediaQuery.of(context).size;
  return Container(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      // color: Colors.white,
      child: Container(
        height: size.height / 1,
        width: size.width / 1.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'GDG New Delhi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: size.width / 12 / 15,
                ),
                Text(
                  "DevFest",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3972CF)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  child: Text(
                "DevFest'19, our yearly fest, is a really special event for us. It describes both, 'The Community Spirit' and 'The Developer Spirit' to keep learning, sharing and developing solutions together.This year it's going to be shaped like a tech conference with experts from a number of domains including Web, Cloud, Android, Flutter, AR/VR, Security, Firebase, ML, Python, IoT, Design, UX, UI, Kotlin and the list continues.What's more? Obviously, goodies!There's going to be a number of activities in and around the event, be sure to participate!",
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
              )),
            ),
            Container(
              height: size.height / 16,
              width: size.width / 3.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: GestureDetector(
                onTap: () async {
                  if (await canLaunch(
                      "https://commudle.com/gdg-new-delhi/events/devfest-19")) {
                    await launch(
                        "https://commudle.com/gdg-new-delhi/events/devfest-19");
                  }
                },
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        "assets/button.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      height: size.height / 16,
                      width: size.width / 3.2,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch("https://twitter.com/gdg_nd?lang=en")) {
                      await launch("https://twitter.com/gdg_nd?lang=en");
                    }
                  },
                  child: Container(
                      height: size.width / 12,
                      width: size.width / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Theme.of(context).buttonColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/twitter loght theme.png",
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch("https://github.com/gdgnewdelhi")) {
                      await launch("https://github.com/gdgnewdelhi");
                    }
                  },
                  child: Container(
                      height: size.width / 12,
                      width: size.width / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Theme.of(context).buttonColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/github.png"),
                      )),
                ),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch(
                        "https://www.linkedin.com/company/gdgcloudnd/")) {
                      await launch(
                          "https://www.linkedin.com/company/gdgcloudnd/");
                    }
                  },
                  child: Container(
                      height: size.width / 12,
                      width: size.width / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Theme.of(context).buttonColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/linkdin light theme.png"),
                      )),
                ),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch(
                        "https://www.facebook.com/gdgnewdelhi/")) {
                      await launch("https://www.facebook.com/gdgnewdelhi/");
                    }
                  },
                  child: Container(
                      height: size.width / 12,
                      width: size.width / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Theme.of(context).buttonColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/facebook light theme.png",
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget _optionsScreen(context) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(left: 8, right: 8, top: 20),
    height: MediaQuery.of(context).size.height / 7,
    width: MediaQuery.of(context).size.width,
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgendaScreen(),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        "assets/agenda.png",
                        height: size.height / 30,
                      ),
                      Text(
                        'Agenda',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpeakersScreenList(),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        "assets/speaker.png",
                        height: size.height / 30,
                      ),
                      Text('Speakers', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sponsors(),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        "assets/sponsors.png",
                        height: size.height / 30,
                      ),
                      Text('Sponsors', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ),
//              InkWell(
//                highlightColor: Colors.transparent,
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => Team(),
//                    ),
//                  );
//                },
//                child: Container(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                    children: <Widget>[
//                      Image.asset(
//                        "assets/team.png",
//                        height: size.height / 30,
//                      ),
//                      Text('Team', style: TextStyle(fontSize: 11)),
//                    ],
//                  ),
//                ),
//              ),
            ],
          )),
    ),
  );
}
