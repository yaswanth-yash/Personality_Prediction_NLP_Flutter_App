// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class PredictionAPIs {
  static Future<Map<String, dynamic>> get_personality_type(String joinedQuestions) async {
    var url = 'https://predictpersonality.herokuapp.com/personality/type';
    Map data = {'answer': joinedQuestions};
    var body = json.encode(data);
    var response = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"}, body: body);
    Map <String, dynamic> result = {};
    result['personality'] = jsonDecode(response.body)['personality'];
    return result;
  }
}
