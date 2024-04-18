class ResultItem {
  int? count;
  String? date;

  ResultItem({this.count, this.date});
  factory ResultItem.fromJson(Map<String, dynamic> parsedJson) {
    return ResultItem(
      count: parsedJson['count'] ?? "",
      date: parsedJson['date'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "count": count,
      "date": date,
    };
  }
}
