class EventSessionListResponse {
  EventSessionListData data;
  String message;
  int status;

  EventSessionListResponse({this.data, this.message, this.status});

  EventSessionListResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new EventSessionListData.fromJson(json['data'])
        : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class EventSessionListData {
  List<TrackSlots> trackSlots;

  EventSessionListData({this.trackSlots});

  EventSessionListData.fromJson(Map<String, dynamic> json) {
    if (json['track_slots'] != null) {
      trackSlots = new List<TrackSlots>();
      json['track_slots'].forEach((v) {
        trackSlots.add(new TrackSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackSlots != null) {
      data['track_slots'] = this.trackSlots.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackSlots {
  TrackSlotsData data;
  List<Included> included;

  TrackSlots({this.data, this.included});

  TrackSlots.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new TrackSlotsData.fromJson(json['data']) : null;
    if (json['included'] != null) {
      included = new List<Included>();
      json['included'].forEach((v) {
        included.add(new Included.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.included != null) {
      data['included'] = this.included.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackSlotsData {
  String id;
  String type;
  SessionAttributes sessionAttributes;
  Relationships relationships;

  TrackSlotsData(
      {this.id, this.type, this.sessionAttributes, this.relationships});

  TrackSlotsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    sessionAttributes = json['attributes'] != null
        ? new SessionAttributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? new Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.sessionAttributes != null) {
      data['attributes'] = this.sessionAttributes.toJson();
    }
    if (this.relationships != null) {
      data['relationships'] = this.relationships.toJson();
    }
    return data;
  }
}

class SessionAttributes {
  String sessionTitle;
  int eventLocationTrackId;
  String tagsList;
  String startTime;
  String endTime;

  SessionAttributes.fromJson(Map<String, dynamic> json) {
    sessionTitle = json['session_title'];
    eventLocationTrackId = json['event_location_track_id'];
    tagsList = json['tags_list'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_title'] = this.sessionTitle;
    data['event_location_track_id'] = this.eventLocationTrackId;
    data['tags_list'] = this.tagsList;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class Relationships {
  SpeakerRegistration speakerRegistration;

  Relationships({this.speakerRegistration});

  Relationships.fromJson(Map<String, dynamic> json) {
    speakerRegistration = json['speaker_registration'] != null
        ? new SpeakerRegistration.fromJson(json['speaker_registration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.speakerRegistration != null) {
      data['speaker_registration'] = this.speakerRegistration.toJson();
    }
    return data;
  }
}

class SpeakerRegistration {
  SpeakerRegistrationData data;

  SpeakerRegistration({this.data});

  SpeakerRegistration.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new SpeakerRegistrationData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class SpeakerRegistrationData {
  String id;
  String type;

  SpeakerRegistrationData({this.id, this.type});

  SpeakerRegistrationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class Included {
  String id;
  String type;
  IncludedAttributes attributes;

  Included({this.id, this.type, this.attributes});

  Included.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ? new IncludedAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class IncludedAttributes {
  int id;
  String name;
  String designation;
  String aboutMe;
  String personalWebsite;
  String linkedin;
  String github;
  String twitter;
  String avatar;

  IncludedAttributes(
      {this.id,
      this.name,
      this.designation,
      this.aboutMe,
      this.personalWebsite,
      this.linkedin,
      this.github,
      this.twitter,
      this.avatar});

  IncludedAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    designation = json['designation'];
    aboutMe = json['about_me'];
    personalWebsite = json['personal_website'];
    linkedin = json['linkedin'];
    github = json['github'];
    twitter = json['twitter'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['about_me'] = this.aboutMe;
    data['personal_website'] = this.personalWebsite;
    data['linkedin'] = this.linkedin;
    data['github'] = this.github;
    data['twitter'] = this.twitter;
    data['avatar'] = this.avatar;
    return data;
  }
}
