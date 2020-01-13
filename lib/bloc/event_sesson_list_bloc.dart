import 'dart:async';

import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/event_session_list.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/api_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/devfest_repository.dart';

class EventSessionListBloc {
  bool connectionState = false;
  DevfestRepository _devFestRepository;

  StreamController _eventSessionTrackListController;

  StreamSink<ApiResponse<EventSessionListResponse>> get trackListSink =>
      _eventSessionTrackListController.sink;

  Stream<ApiResponse<EventSessionListResponse>> get trackListStream =>
      _eventSessionTrackListController.stream;

  EventSessionListBloc(String url) {
    _eventSessionTrackListController =
        StreamController<ApiResponse<EventSessionListResponse>>();
    _devFestRepository = DevfestRepository();
    fetchTrackList(url);
  }

  fetchTrackList(String url) async {
    trackListSink.add(ApiResponse.loading('Fetching track list'));
    try {
      EventSessionListResponse trackListResponse =
          await _devFestRepository.fetchEventSessionList(url);

      print(trackListResponse.data);
      trackListSink.add(ApiResponse.completed(trackListResponse));
    } catch (e) {
      trackListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _eventSessionTrackListController?.close();
  }
}
