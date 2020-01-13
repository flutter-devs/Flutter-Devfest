import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest_gdg_newdelhi/bloc/speaker_bloc.dart';
import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/speaker_list_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/api_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/notifiers/dark_theme_provider.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/speakers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/custom_button.dart';
import '../../utils/styles.dart';

class SpeakersScreenList extends StatefulWidget {
  @override
  _SpeakersScreenListState createState() => _SpeakersScreenListState();
}

class _SpeakersScreenListState extends State<SpeakersScreenList> {
  // List<SpeakersModel> items;

  var twitterUrl = "https://twitter.com/";

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blueAccent
  ];

  SpeakerBloc speakerBloc = SpeakerBloc();

  @override
  void initState() {
    super.initState();

    speakerBloc.updateList();
  }

  Widget buildItem(BuildContext context, int index, Speakers speaker) {
    Random random = new Random();
    int randomIndex = 0;
    randomIndex = random.nextInt(3);

    var speakerData = speaker.data.attributes;
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SpeakerDetailsScreen(speakerData)));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                //  color: Colors.white,
              ),
              height: size.height / 5.5,
              width: size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    height: size.height,
                    width: size.width / 4,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            topLeft: Radius.circular(12)),
                        child: Hero(
                          tag: speakerData.name,
                          child: speakerData.avatar != null
                              ? FadeInImage.assetNetwork(
                                  placeholder: "assets/noprofileuser.png",
                                  image: speakerData.avatar,
                                  fit: BoxFit.cover,
                                )
                              : AssetImage("assets/noprofileuser.png"),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      height: size.height / 6,
                      width: size.width / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                speakerData.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: size.width / 120,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: colors[randomIndex],
                                ),
                                height: size.height / 40,
                                width: size.width / 33,
                              ),
                            ],
                          ),
                          Text(
                            speakerData.designation ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "",
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  speakerData.twitter != null
                                      ? GestureDetector(
                                          onTap: () async {
                                            if (await canLaunch(twitterUrl +
                                                speakerData.twitter)) {
                                              await launch(twitterUrl +
                                                  speakerData.twitter
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
                                  speakerData.github != null
                                      ? GestureDetector(
                                          onTap: () async {
                                            if (await canLaunch(
                                                speakerData.github)) {
                                              await launch(speakerData.github);
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
                                  speakerData.linkedin != null
                                      ? GestureDetector(
                                          onTap: () async {
                                            if (await canLaunch(
                                                speakerData.linkedin)) {
                                              await launch(
                                                  speakerData.linkedin);
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
                                  SizedBox(
                                    width: size.width / 8,
                                  ),
                                ],
                              ),
                              Container(
                                  height: size.width / 12,
                                  width: size.width / 12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Theme.of(context).buttonColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/arrow-blue.png",
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themechange = Provider.of<DarkThemeProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () async {
          if (await canLaunch(
              "https://commudle.com/gdg-new-delhi/events/devfest-19")) {
            await launch(
                "https://commudle.com/gdg-new-delhi/events/devfest-19");
          }
        },
        child: Container(
          height: size.height / 18,
          width: size.width / 3.2,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 400 / 139,
                  child: Image.asset(
                    "assets/button.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Register Now",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
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
                        child: themechange.darkTheme
                            ? Image.asset("assets/arrowdarktheme.png")
                            : Image.asset("assets/Arrow light theme.png"),
                      )),
                ),
              ),

              //  backgroundColor: Theme.of(context).buttonColor,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Speakers',
                  style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 18),
                ),
                collapseMode: CollapseMode.pin,
              ),
              expandedHeight: size.height / 6,
              //      backgroundColor: Theme.of(context).buttonColor,
              actions: <Widget>[],
            ),
          ];
        },
        body: speakerList(),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget speakerList() {
    return StreamBuilder<ApiResponse<SpeakerListResponse>>(
        stream: speakerBloc.quotationStream,
        builder: (context,
            AsyncSnapshot<ApiResponse<SpeakerListResponse>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.apiResponseData.status == 200) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot
                      .data.apiResponseData.speakersData.speakers.length,
                  itemBuilder: (context, index) {
                    return buildItem(
                        context,
                        index,
                        snapshot
                            .data.apiResponseData.speakersData.speakers[index]);
                  });
            } else {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.data.message,
                      textAlign: TextAlign.center,
                      style: Styles.defaultTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomPopUPButton(
                      voidCallback: () {
                        speakerBloc.updateList();
                      },
                      title: "Retry",
                    ),
                  ],
                ),
              );
            }
          } else if (snapshot.hasError || snapshot == null) {
            print("has error");
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Failed to load detail\nPlease try again!",
                    textAlign: TextAlign.center,
                    style: Styles.defaultTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomPopUPButton(
                    voidCallback: () {
                      speakerBloc.updateList();
                    },
                    title: "Retry",
                  ),
                ],
              ),
            );
          }
          return Center(
            child: FlareActor("assets/loader2.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Untitled"),
          );
        });
  }
}
