import 'source.dart';

class SourceResponse {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourceResponse({this.status, this.sources});

  SourceResponse.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    sources = (data['sources'] as List<dynamic>?)
        ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
