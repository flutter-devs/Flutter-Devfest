// To parse this JSON data, do
//
//     final trackListResponse = trackListResponseFromJson(jsonString);

import 'dart:convert';

TrackListResponse trackListResponseFromJson(String str) =>
    TrackListResponse.fromJson(json.decode(str));

String trackListResponseToJson(TrackListResponse data) =>
    json.encode(data.toJson());

class TrackListResponse {
  TrackListResponseData data;
  String message;
  int status;

  TrackListResponse({
    this.data,
    this.message,
    this.status,
  });

  factory TrackListResponse.fromJson(Map<String, dynamic> json) =>
      TrackListResponse(
        data: TrackListResponseData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class TrackListResponseData {
  List<EventLocationTrack> eventLocationTracks;

  TrackListResponseData({
    this.eventLocationTracks,
  });

  factory TrackListResponseData.fromJson(Map<String, dynamic> json) =>
      TrackListResponseData(
        eventLocationTracks: List<EventLocationTrack>.from(
            json["event_location_tracks"]
                .map((x) => EventLocationTrack.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "event_location_tracks":
            List<dynamic>.from(eventLocationTracks.map((x) => x.toJson())),
      };
}

class EventLocationTrack {
  EventLocationTrackData data;

  EventLocationTrack({
    this.data,
  });

  factory EventLocationTrack.fromJson(Map<String, dynamic> json) =>
      EventLocationTrack(
        data: EventLocationTrackData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class EventLocationTrackData {
  String id;
  String type;
  Attributes attributes;
  Links links;

  EventLocationTrackData({
    this.id,
    this.type,
    this.attributes,
    this.links,
  });

  factory EventLocationTrackData.fromJson(Map<String, dynamic> json) =>
      EventLocationTrackData(
        id: json["id"],
        type: json["type"],
        attributes: Attributes.fromJson(json["attributes"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
        "links": links.toJson(),
      };
}

class Attributes {
  String name;
  int eventId;

  Attributes({
    this.name,
    this.eventId,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        eventId: json["event_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "event_id": eventId,
      };
}

class Links {
  String trackSlots;

  Links({
    this.trackSlots,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        trackSlots: json["track_slots"],
      );

  Map<String, dynamic> toJson() => {
        "track_slots": trackSlots,
      };
}
