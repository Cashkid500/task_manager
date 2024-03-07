import 'package:json_annotation/json_annotation.dart';

part 'update_task.g.dart';

@JsonSerializable()
class UpdateTaskResponse {
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

    UpdateTaskResponse({
        required this.status,
        required this.text,
        required this.data,
        required this.time,
        required this.method,
        required this.endpoint,
        required this.error,
    });

    factory UpdateTaskResponse.fromJson(Map<String, dynamic> json) => _$UpdateTaskResponseFromJson(json);

    Map<String, dynamic> toJson() => _$UpdateTaskResponseToJson(this);
}
