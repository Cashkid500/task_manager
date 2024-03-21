import 'package:json_annotation/json_annotation.dart';

part 'get_task.g.dart';

@JsonSerializable()
class GetTaskResponse {
  @JsonKey(name: "status")
  final bool status;
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "data")
  final Data data;
  @JsonKey(name: "time")
  final String time;
  @JsonKey(name: "method")
  final String method;
  @JsonKey(name: "endpoint")
  final String endpoint;
  @JsonKey(name: "error")
  final List<dynamic> error;

  GetTaskResponse({
    required this.status,
    required this.text,
    required this.data,
    required this.time,
    required this.method,
    required this.endpoint,
    required this.error,
  });

  factory GetTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTaskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTaskResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "page")
  final int page;
  @JsonKey(name: "per_page")
  final int perPage;
  @JsonKey(name: "total_data")
  final int totalData;
  @JsonKey(name: "totalPage")
  final int totalPage;
  @JsonKey(name: "tasks")
  final List<Task> tasks;

  Data({
    required this.page,
    required this.perPage,
    required this.totalData,
    required this.totalPage,
    required this.tasks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Task {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "trackid")
  final String trackid;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "status_value")
  final String statusValue;

  Task({
    required this.id,
    required this.trackid,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.statusValue,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
