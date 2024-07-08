import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required String description,
    required bool completed,
  }) = _Todo;

  /// JSON 객체를 [Activity] 인스턴스로 변환합니다.
  /// 이렇게 하면 API 응답을 유형 안전하게 읽을 수 있습니다.
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
