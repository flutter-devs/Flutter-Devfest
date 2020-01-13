import 'package:flutter/material.dart';
import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/speaker_list_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/notifiers/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerDetailsScreen extends StatefulWidget {
  final Attributes speakerData;

  SpeakerDetailsScreen(
    this.speakerData,
  );

  @override
  _SpeakerDetailsScreenState createState() => _SpeakerDetailsScreenState();
}

class _SpeakerDetailsScreenState extends State<SpeakerDetailsScreen> {
  var twitterUrl = "https://twitter.com/";

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
        actions: <Widget>[],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: 20, right: 20, top: size.height / 9),
                  height: MediaQuery.of(context).size.height / 1.74,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12),
                                              child: Container(
                                                width: size.width / 1.9,
                                                child: Text(
                                                  widget.speakerData.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width / 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Container(
                                          width: size.width / 1.9,
                                          child: Text(
                                            widget.speakerData.designation,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Divider(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Text(
                                  widget.speakerData.aboutMe,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                widget.speakerData.twitter != null
                                    ? GestureDetector(
                                        onTap: () async {
                                          if (await canLaunch(twitterUrl +
                                              widget.speakerData.twitter)) {
                                            await launch(twitterUrl +
                                                widget.speakerData.twitter
                                                    .replaceAll('@', ''));
                                          }
                                        },
                                        child: Container(
                                            height: size.width / 12,
                                            width: size.width / 12,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                color: Theme.of(context)
                                                    .buttonColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                "assets/twitter loght theme.png",
                                              ),
                                            )),
                                      )
                                    : Container(),
                                SizedBox(
                                  width: size.width / 50,
                                ),
                                widget.speakerData.github != null
                                    ? GestureDetector(
                                        onTap: () async {
                                          if (await canLaunch(
                                              widget.speakerData.github)) {
                                            await launch(
                                                widget.speakerData.github);
                                          }
                                        },
                                        child: Container(
                                            height: size.width / 12,
                                            width: size.width / 12,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                color: Theme.of(context)
                                                    .buttonColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                  "assets/github.png"),
                                            )),
                                      )
                                    : Container(),
                                SizedBox(
                                  width: size.width / 50,
                                ),
                                widget.speakerData.linkedin != null
                                    ? GestureDetector(
                                        onTap: () async {
                                          if (await canLaunch(
                                              widget.speakerData.linkedin)) {
                                            await launch(
                                                widget.speakerData.linkedin);
                                          }
                                        },
                                        child: Container(
                                            height: size.width / 12,
                                            width: size.width / 12,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                color: Theme.of(context)
                                                    .buttonColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                  "assets/linkdin light theme.png"),
                                            )),
                                      )
                                    : Container(),
                                SizedBox(
                                  width: size.width / 50,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height / 1.7,
                  left: size.width / 5,
                  child: Text(
                    "Speaker",
                    style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0, top: 25),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5.5,
                      width: MediaQuery.of(context).size.width / 3.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Hero(
                          tag: widget.speakerData.name,
                          child: widget.speakerData.avatar != null
                              ? FadeInImage.assetNetwork(
                                  placeholder: "assets/noprofileuser.png",
                                  image: widget.speakerData.avatar,
                                  fit: BoxFit.cover,
                                )
                              : AssetImage("assets/noprofileuser.png"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
