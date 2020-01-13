import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest_gdg_newdelhi/notifiers/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  bool isLoadingDisabled = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(new Duration(seconds: 3)).then((v) {
      setState(() {
        isLoadingDisabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).cardColor,
                ),
                height: size.height / 12 / 8,
                width: size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: themeChange.darkTheme
                      ? Image.asset("assets/arrowdarktheme.png")
                      : Image.asset("assets/Arrow light theme.png"),
                )),
          ),
        ),
      ),
      body: isLoadingDisabled
          ? FlareActor("assets/loader2.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "Untitled")
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 65, bottom: 20),
                  child: Text(
                    'Sponsors',
                    style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch(
                        "https://commudle.com/gcdc-new-delhi")) {
                      await launch("https://commudle.com/gcdc-new-delhi");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).cardColor,
                        ),
                        height: size.height / 5,
                        width: size.width,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/gdg.png",
                              height: size.height / 8,
                              width: size.width / 4,
                            ),
                            Text(
                              "GDG Cloud New Delhi",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch("https://commudle.com/gdg-new-delhi")) {
                      await launch("https://commudle.com/gdg-new-delhi");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).cardColor,
                        ),
                        height: size.height / 5,
                        width: size.width,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/gdg.png",
                              height: size.height / 8,
                              width: size.width / 4,
                            ),
                            Text(
                              "GDG New Delhi",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch("https://commudle.com/wtm-new-delhi")) {
                      await launch("https://commudle.com/wtm-new-delhi");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).cardColor,
                        ),
                        height: size.height / 5,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Image.asset("assets/WTM-Delhi.png"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
