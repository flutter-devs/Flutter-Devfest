import 'dart:async';

import 'package:flutter_devfest_gdg_newdelhi/model/response%20model/speaker_list_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/api_response.dart';
import 'package:flutter_devfest_gdg_newdelhi/network/devfest_repository.dart';

class SpeakerBloc {
  bool connectionState = false;
  List<Speakers> speakerList = List<Speakers>();
  DevfestRepository devfestRepository = DevfestRepository();

  StreamController<ApiResponse<SpeakerListResponse>>
      eventQuotationDetailsBlocController =
      new StreamController<ApiResponse<SpeakerListResponse>>();
  StreamController connectionBlocController = new StreamController<bool>();

  Stream get quotationStream => eventQuotationDetailsBlocController.stream;

  void updateList() async {
    try {
      SpeakerListResponse speakerListResponse =
          await devfestRepository.fetchDevFestSpeakers();
      speakerList.addAll(speakerListResponse.speakersData.speakers);
      eventQuotationDetailsBlocController.sink
          .add(ApiResponse.completed(speakerListResponse));
    } catch (e) {
      eventQuotationDetailsBlocController.sink
          .add(ApiResponse.error(e.toString()));
    }
  }

  void dispose() {
    eventQuotationDetailsBlocController.close();
    connectionBlocController.close();
  }
}
