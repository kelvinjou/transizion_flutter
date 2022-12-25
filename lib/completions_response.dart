import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:transizion_flutter/response_factory_constructor.dart';

class CompletionsResponse {
  final int? created;
  final String? id;
  final String? model;
  final String object;
  final Map<String, dynamic>? usage;
  final int? completionTokens;
  final int? promptTokens;
  final int? totalTokens;

  final List<dynamic>? choices;

  final String? firstCompletion;

  const CompletionsResponse({
    required this.created,   
    required this.id,    
    required this.model,
    required this.object,
    required this.usage,
    required this.completionTokens,
    required this.promptTokens,
    required this.totalTokens,

    required this.choices,

// this is third party
    required this.firstCompletion,

  });

  // convert the response JSON String into a CompletionsResponse object
  factory CompletionsResponse.fromResponse(Response response) {
  // Get the response body in JSON format
  Map<String, dynamic> responseBody = json.decode(response.body);

  // Parse out information from the response
  Map<String, dynamic> usage = responseBody['usage'];

  // Parse out the choices
  List<dynamic> choices = responseBody['choices'];

  // Get the text of the first completion
  String firstCompletion = choices[0]['text'];

  return CompletionsResponse(
    id: responseBody['userId'],
    object: responseBody['id'],
    created: responseBody['title'],
    model: responseBody['model'],
    choices: choices,
    usage: usage,
    promptTokens: usage['prompt_tokens'],
    completionTokens: usage['completion_tokens'],
    totalTokens: usage['total_tokens'],
    firstCompletion: firstCompletion,
  );
}
}