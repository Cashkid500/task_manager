// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTaskResponse _$GetTaskResponseFromJson(Map<String, dynamic> json) =>
    GetTaskResponse(
      status: json['status'] as bool,
      text: json['text'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      time: json['time'] as String,
      method: json['method'] as String,
      endpoint: json['endpoint'] as String,
      error: json['error'] as List<dynamic>,
    );

Map<String, dynamic> _$GetTaskResponseToJson(GetTaskResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      totalData: json['total_data'] as int,
      totalPage: json['totalPage'] as int,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_data': instance.totalData,
      'totalPage': instance.totalPage,
      'tasks': instance.tasks,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as int,
      trackid: json['trackid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      statusValue: json['status_value'] as String,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'trackid': instance.trackid,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'status_value': instance.statusValue,
    };
