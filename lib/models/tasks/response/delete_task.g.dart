// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteTaskResponse _$DeleteTaskResponseFromJson(Map<String, dynamic> json) =>
    DeleteTaskResponse(
      status: json['status'] as bool,
      text: json['text'] as String,
      data: json['data'] as List<dynamic>,
      time: json['time'] as String,
      method: json['method'] as String,
      endpoint: json['endpoint'] as String,
      error: json['error'] as List<dynamic>,
    );

Map<String, dynamic> _$DeleteTaskResponseToJson(DeleteTaskResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
      'error': instance.error,
    };
