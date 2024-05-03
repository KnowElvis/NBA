class Players {
  List<Data>? data;
  Meta? meta;

  Players({this.data, this.meta});

  Players.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? position;
  String? height;
  String? weight;
  String? jerseyNumber;
  String? college;
  String? country;
  int? draftYear;
  int? draftRound;
  int? draftNumber;
  Team? team;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.position,
        this.height,
        this.weight,
        this.jerseyNumber,
        this.college,
        this.country,
        this.draftYear,
        this.draftRound,
        this.draftNumber,
        this.team});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    position = json['position'];
    height = json['height'];
    weight = json['weight'];
    jerseyNumber = json['jersey_number'];
    college = json['college'];
    country = json['country'];
    draftYear = json['draft_year'];
    draftRound = json['draft_round'];
    draftNumber = json['draft_number'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['position'] = position;
    data['height'] = height;
    data['weight'] = weight;
    data['jersey_number'] = jerseyNumber;
    data['college'] = college;
    data['country'] = country;
    data['draft_year'] = draftYear;
    data['draft_round'] = draftRound;
    data['draft_number'] = draftNumber;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    return data;
  }
}

class Team {
  int? id;
  String? conference;
  String? division;
  String? city;
  String? name;
  String? fullName;
  String? abbreviation;

  Team(
      {this.id,
        this.conference,
        this.division,
        this.city,
        this.name,
        this.fullName,
        this.abbreviation});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conference = json['conference'];
    division = json['division'];
    city = json['city'];
    name = json['name'];
    fullName = json['full_name'];
    abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['conference'] = conference;
    data['division'] = division;
    data['city'] = city;
    data['name'] = name;
    data['full_name'] = fullName;
    data['abbreviation'] = abbreviation;
    return data;
  }
}

class Meta {
  int? nextCursor;
  int? perPage;

  Meta({this.nextCursor, this.perPage});

  Meta.fromJson(Map<String, dynamic> json) {
    nextCursor = json['next_cursor'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next_cursor'] = nextCursor;
    data['per_page'] = perPage;
    return data;
  }
}