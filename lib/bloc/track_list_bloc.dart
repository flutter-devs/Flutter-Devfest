import 'dart:async';

import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/track_list_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/api_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/devfest_repository.dart';

class TrackListBloc {
  bool connectionState = false;
  DevfestRepository _devFestRepository;

  StreamController _trackListController;

  StreamSink<ApiResponse<TrackListResponse>> get trackListSink =>
      _trackListController.sink;

  Stream<ApiResponse<TrackListResponse>> get trackListStream =>
      _trackListController.stream;

  TrackListBloc() {
    _trackListController = StreamController<ApiResponse<TrackListResponse>>();
    _devFestRepository = DevfestRepository();
    fetchTrackList();
  }

  fetchTrackList() async {
    trackListSink.add(ApiResponse.loading('Fetching track list'));
    try {
      TrackListResponse trackListResponse =
          await _devFestRepository.fetchTrackList();
      trackListSink.add(ApiResponse.completed(trackListResponse));
    } catch (e) {
      trackListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _trackListController?.close();
  }
}
