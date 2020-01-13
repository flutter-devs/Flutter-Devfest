import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/event_session_list.dart';
import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/speaker_list_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/track_list_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/api_base_helper.dart';

class DevfestRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  final String _baseUrl = "https://commudle.com/api/v1/";

  Future<TrackListResponse> fetchTrackList() async {
    final response = await _helper.get(
        _baseUrl + "events/devfest-19/location_tracks?event_location=96",
        params: {
          'event_location': '96',
        });
    return TrackListResponse.fromJson(response);
  }

  Future<EventSessionListResponse> fetchEventSessionList(String url) async {
    print(url);
    final response = await _helper.get(url);
    return EventSessionListResponse.fromJson(response);
  }

  Future<SpeakerListResponse> fetchDevFestSpeakers() async {
    final response = await _helper.get(_baseUrl + "events/devfest-19/speakers");
    return SpeakerListResponse.fromJson(response);
  }
}
