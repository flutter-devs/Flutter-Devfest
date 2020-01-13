// To parse this JSON data, do
//
//     final upComingEventsResponse = upComingEventsResponseFromJson(jsonString);

import 'dart:convert';

UpComingEventsResponse upComingEventsResponseFromJson(String str) =>
    UpComingEventsResponse.fromJson(json.decode(str));

String upComingEventsResponseToJson(UpComingEventsResponse data) =>
    json.encode(data.toJson());

class UpComingEventsResponse {
  UpComingEventsResponseData data;
  String message;
  int status;

  UpComingEventsResponse({
    this.data,
    this.message,
    this.status,
  });

  factory UpComingEventsResponse.fromJson(Map<String, dynamic> json) =>
      UpComingEventsResponse(
        data: UpComingEventsResponseData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class UpComingEventsResponseData {
  List<UpcomingEvent> upcomingEvents;

  UpComingEventsResponseData({
    this.upcomingEvents,
  });

  factory UpComingEventsResponseData.fromJson(Map<String, dynamic> json) =>
      UpComingEventsResponseData(
        upcomingEvents: List<UpcomingEvent>.from(
            json["upcoming_events"].map((x) => UpcomingEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "upcoming_events":
            List<dynamic>.from(upcomingEvents.map((x) => x.toJson())),
      };
}

class UpcomingEvent {
  UpcomingEventData data;

  UpcomingEvent({
    this.data,
  });

  factory UpcomingEvent.fromJson(Map<String, dynamic> json) => UpcomingEvent(
        data: UpcomingEventData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class UpcomingEventData {
  String id;
  String type;
  Attributes attributes;
  Links links;

  UpcomingEventData({
    this.id,
    this.type,
    this.attributes,
    this.links,
  });

  factory UpcomingEventData.fromJson(Map<String, dynamic> json) =>
      UpcomingEventData(
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
  String description;
  String headerImagePath;
  DateTime startTime;
  DateTime endTime;
  int kommunityId;
  String status;

  Attributes({
    this.name,
    this.description,
    this.headerImagePath,
    this.startTime,
    this.endTime,
    this.kommunityId,
    this.status,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        description: json["description"],
        headerImagePath: json["header_image_path"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        kommunityId: json["kommunity_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "header_image_path": headerImagePath,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "kommunity_id": kommunityId,
        "status": status,
      };
}

class Links {
  String publicUrl;
  String webUrl;
  AvailableFormsWebLinks availableFormsWebLinks;
  String speakers;
  String locationsSchedule;

  Links({
    this.publicUrl,
    this.webUrl,
    this.availableFormsWebLinks,
    this.speakers,
    this.locationsSchedule,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        publicUrl: json["public_url"],
        webUrl: json["web_url"],
        availableFormsWebLinks:
            AvailableFormsWebLinks.fromJson(json["available_forms_web_links"]),
        speakers: json["speakers"],
        locationsSchedule: json["locations_schedule"],
      );

  Map<String, dynamic> toJson() => {
        "public_url": publicUrl,
        "web_url": webUrl,
        "available_forms_web_links": availableFormsWebLinks.toJson(),
        "speakers": speakers,
        "locations_schedule": locationsSchedule,
      };
}

class AvailableFormsWebLinks {
  String registration;

  AvailableFormsWebLinks({
    this.registration,
  });

  factory AvailableFormsWebLinks.fromJson(Map<String, dynamic> json) =>
      AvailableFormsWebLinks(
        registration: json["Registration"],
      );

  Map<String, dynamic> toJson() => {
        "Registration": registration,
      };
}
