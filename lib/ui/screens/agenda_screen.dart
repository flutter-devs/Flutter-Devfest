import 'dart:io' show Platform;

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest_gdg_newdelhi/bloc/track_list_bloc.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/shared/custom_button.dart';
import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/track_list_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/api_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/notifiers/dark_theme_provider.dart';

import 'package:flutter_devfest_gdg_newdelhi/utils/styles.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/agenda_item.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  TrackListBloc trackListBloc;

  @override
  void initState() {
    super.initState();

    trackListBloc = TrackListBloc();
  }

  @override
  void dispose() {
    super.dispose();
    trackListBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: StreamBuilder<ApiResponse<TrackListResponse>>(
          stream: trackListBloc.trackListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return FlareActor("assets/loader2.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "Untitled");
                  break;
                case Status.COMPLETED:
                  return _agenda(snapshot.data.apiResponseData, context);
                  break;
                case Status.ERROR:
                  return SafeArea(
                    child: Scaffold(
                      body: Container(
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Failed to load agenda\nPlease try again!",
                              textAlign: TextAlign.center,
                              style: Styles.defaultTextStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomPopUPButton(
                              voidCallback: () {
                                trackListBloc.fetchTrackList();
                              },
                              title: "Retry",
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
    );

    //    backgroundColor: Color(0xffF1F5FB),
  }

  Widget _agenda(TrackListResponse response, BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: response.data.eventLocationTracks.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
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
                actions: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      if (Platform.isAndroid) {
                        Share.share(
                            'Download DevFest 19 app at https://play.google.com/store/apps/details?id=com.flutterdevs.devfest');
                      } else if (Platform.isIOS) {
                        if (await canLaunch(
                            "https://apps.apple.com/us/app/bull-horns-panic-button/id879073850?ls=1")) {
                          await launch(
                              "https://apps.apple.com/us/app/bull-horns-panic-button/id879073850?ls=1");
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Theme.of(context).cardColor,
                          ),
                          height: size.height / 12 / 8,
                          width: size.width / 9,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: themeChange.darkTheme
                                ? Image.asset("assets/share-dark-theme.png")
                                : Image.asset("assets/share light theme.png"),
                          )),
                    ),
                  ),
                ],
                backgroundColor: Theme.of(context).backgroundColor,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 55,
                    ),
                    child: Text(
                      'Agenda',
                      style: TextStyle(
                          color: Theme.of(context).textSelectionColor,
                          fontSize: 18),
                    ),
                  ),
                ),
                expandedHeight: size.height / 4,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: TabBar(
                        labelColor: Theme.of(context).textSelectionColor,
                        isScrollable: true,
                        indicatorColor: Colors.blue,
                        labelStyle: TextStyle(
                            color: Theme.of(context).textSelectionColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        unselectedLabelColor:
                            Theme.of(context).textSelectionColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: List<Tab>.generate(
                            response.data.eventLocationTracks.length,
                            (int index) {
                          return Tab(
                            text: response.data.eventLocationTracks[index].data
                                .attributes.name,
                          );
                        }))),
              ),
            ];
          },
          body: TabBarView(
            children: List<Widget>.generate(
                response.data.eventLocationTracks.length, (int index) {
              return AgendaItem(response
                  .data.eventLocationTracks[index].data.links.trackSlots);
            }),
          ),
        ),
      ),
    );
  }
}
