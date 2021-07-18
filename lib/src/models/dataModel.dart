class DataModel {
  String admin_locale;
  String tournament_url;
  String name;
  String registration_url;
  String game_format;
  String game_name;
  String country;
  String status;
  String game_icon_url;
  String cover_url;

  DataModel(
      {this.admin_locale,
      this.tournament_url,
      this.name,
      this.registration_url,
      this.game_format,
      this.game_name,
      this.country,
      this.status,
      this.game_icon_url,
      this.cover_url});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      admin_locale: json["admin_locale"],
      tournament_url: json["tournament_url"],
      name: json["name"],
      registration_url: json["registration_url"],
      game_format: json["game_format"],
      game_name: json["game_name"],
      country: json["country"],
      status: json["status"],
      game_icon_url: json["game_icon_url"],
      cover_url: json["cover_url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "admin_locale": this.admin_locale,
      "tournament_url": this.tournament_url,
      "name": this.name,
      "registration_url": this.registration_url,
      "game_format": this.game_format,
      "game_name": this.game_name,
      "country": this.country,
      "status": this.status,
      "game_icon_url": this.game_icon_url,
      "cover_url": this.cover_url,
    };
  }
//

}
