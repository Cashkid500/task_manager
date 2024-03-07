import 'package:json_annotation/json_annotation.dart';

part 'create_task.g.dart';

@JsonSerializable()
class CreateTaskResponse {
    @JsonKey(name: "status")
    final bool status;
    @JsonKey(name: "text")
    final String text;
    @JsonKey(name: "data")
    final List<dynamic> data;
    @JsonKey(name: "time")
    final String time;
    @JsonKey(name: "method")
    final String method;
    @JsonKey(name: "endpoint")
    final String endpoint;
    @JsonKey(name: "error")
    final List<dynamic> error;

    CreateTaskResponse({
        required this.status,
        required this.text,
        required this.data,
        required this.time,
        required this.method,
        required this.endpoint,
        required this.error,
    });

    factory CreateTaskResponse.fromJson(Map<String, dynamic> json) => _$CreateTaskResponseFromJson(json);

    Map<String, dynamic> toJson() => _$CreateTaskResponseToJson(this);
}
