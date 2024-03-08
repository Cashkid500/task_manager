import 'package:json_annotation/json_annotation.dart';

part 'delete_task.g.dart';

@JsonSerializable()
class DeleteTaskResponse {
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

    DeleteTaskResponse({
        required this.status,
        required this.text,
        required this.data,
        required this.time,
        required this.method,
        required this.endpoint,
        required this.error,
    });

    factory DeleteTaskResponse.fromJson(Map<String, dynamic> json) => _$DeleteTaskResponseFromJson(json);

    Map<String, dynamic> toJson() => _$DeleteTaskResponseToJson(this);
}
