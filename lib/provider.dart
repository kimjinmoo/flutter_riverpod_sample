import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'activity.dart';

part 'provider.g.dart';

@riverpod
Future<Activity> activity(ActivityRef ref, String p1) async {
  final response = await http.get(Uri(
      scheme: 'https',
      host: 'naver.com',
      path: '/api/activity',
      queryParameters: {'p1': p1}));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
}
