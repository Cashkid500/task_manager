// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskResponse _$CreateTaskResponseFromJson(Map<String, dynamic> json) =>
    CreateTaskResponse(
      status: json['status'] as bool,
      text: json['text'] as String,
      data: json['data'] as List<dynamic>,
      time: json['time'] as String,
      method: json['method'] as String,
      endpoint: json['endpoint'] as String,
      error: json['error'] as List<dynamic>,
    );

Map<String, dynamic> _$CreateTaskResponseToJson(CreateTaskResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
      'error': instance.error,
    };
