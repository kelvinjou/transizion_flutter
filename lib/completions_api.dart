// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:transizion_flutter/completions_response.dart';
import 'package:transizion_flutter/completions_request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert' show utf8;


class CompletionsAPI {
  static final Uri completionsEndpoint =
      Uri.parse('https://api.openai.com/v1/completions');

  

  

  static Future<CompletionsResponse> generatePassionProjectIdea(String hobbies, String passions, String socialIssue, String careerPath, String specificCareerPath) async {
    await dotenv.load(fileName: "dotenv");
    // final apiKeyENV =  DotEnv().env['API_KEY'];

    final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
  };

    String prompt = '3 detailed specific ideas for my high school $passions passion project that would make an impact to my community';

    if (socialIssue.isNotEmpty) {
      prompt = '3 detailed specific ideas for my high school $passions passion project that would make an impact to my community. I am is concerned about $socialIssue';
    }

    if (careerPath.isNotEmpty) {
      prompt = '3 detailed specific ideas for my high school $passions passion project that would make an impact to my community. I am concerned about $socialIssue. As a potential career path, I would like to go into $careerPath';
    }

    if (specificCareerPath.isNotEmpty) {
            prompt = '3 detailed specific ideas for my high school $passions passion project that would make an impact to my community. I am concerned about $socialIssue. As a potential career path, I would like to go into $careerPath, specifically $specificCareerPath';

    }
    prompt += "Use second person.";
    
    CompletionsRequest request = CompletionsRequest(
        model: 'text-davinci-003',
        prompt: prompt,
        temperature: 0.6,
        maxTokens: 3354,
        topP: 0.77,
        frequencyPenalty: 0,
        presencePenalty: 1.6);

    http.Response response = await http.post(completionsEndpoint,
    headers: headers, body: utf8.encode(request.toJson()));
    debugPrint("BODY! ${response.body}");
    var jsonResponse = jsonDecode(response.body);
    debugPrint("Using model: ${jsonResponse['choices'][0]['text']}");

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


