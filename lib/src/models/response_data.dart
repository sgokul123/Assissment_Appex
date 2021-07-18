import 'package:appex_assignment/src/models/dataModel.dart';

class ResponseData {
  String cursor;
  int tournament_count;
  bool is_last_batch;
  List tournaments;

  ResponseData(
      {this.cursor,
      this.tournament_count,
      this.is_last_batch,
      this.tournaments});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      cursor: json["cursor"],
      tournament_count: json["tournament_count"],
      is_last_batch: json["is_last_batch"],
      tournaments: json['tournaments'] != null
          ? List<DataModel>.from(
              json['tournaments'].map((i) => DataModel.fromJson(i)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cursor": this.cursor,
      "tournament_count": this.tournament_count,
      "is_last_batch": this.is_last_batch,
      "tournaments": this.tournaments,
    };
  }
//

}
