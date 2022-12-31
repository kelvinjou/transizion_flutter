// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:transizion_flutter/api_key.dart';
import 'package:transizion_flutter/completions_response.dart';
import 'package:transizion_flutter/completions_request.dart';

class CompletionsAPI {
  static final Uri completionsEndpoint =
      Uri.parse('https://api.openai.com/v1/completions');

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $openAIApiKey',
  };

  static Future<CompletionsResponse> generatePassionProjectIdea(String hobbies, String passions, String socialIssue, String careerPath) async {

    String prompt = 'Come up with 3 detailed specific ideas for a high school $passions passion project that would make an impact on your community';

    if (socialIssue.isNotEmpty) {
      prompt = 'Come up with 3 detailed specific ideas for a high school $passions passion project that would make an impact to their community. This high school student is concerned about $socialIssue';
    }

    if (careerPath.isNotEmpty) {
      prompt = 'Come up with 3 detailed specific ideas for a high school $passions passion project that would make an impact to their community. This high school student is concerned about $socialIssue. As a potential career path, he would like to go into $careerPath';
    }

    CompletionsRequest request = CompletionsRequest(
        model: 'text-davinci-003',
        prompt: prompt,
        temperature: 0.6,
        maxTokens: 3354,
        topP: 0.77,
        frequencyPenalty: 0,
        presencePenalty: 1.6);

    http.Response response = await http.post(completionsEndpoint,
        headers: headers, body: request.toJson());
    // debugPrint('Received OpenAI API response: ${response.body}');

    var jsonResponse = jsonDecode(response.body);
    // print("Using model: ${jsonResponse['choices'][0]['text']}");

    // final prettyString =
    //     const JsonEncoder.withIndent('  ').convert(jsonResponse);


    // Check to see if there was an error
    if (response.statusCode != 200) {
      debugPrint(
          'Failed to get a forecast with status code, ${response.statusCode}');
    }
    CompletionsResponse completionsResponse =
        CompletionsResponse.fromResponse(response);
    return completionsResponse;
  }
}

Future<bool> myTypedFuture(int id, int duration) async {
  await Future.delayed(Duration(seconds: duration));
  debugPrint("delay complete for future $id");
  return true;
}


