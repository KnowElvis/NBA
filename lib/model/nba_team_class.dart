class TeamClass {
  List<Team>? data;

  TeamClass({this.data});

  TeamClass.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Team>[];
      json['data'].forEach((v) {
        data!.add(Team.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
