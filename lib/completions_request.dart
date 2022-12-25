import 'dart:convert';

class CompletionsRequest {
  final String model;
  final String prompt;
  final double? temperature;
  final int maxTokens;
  final double? topP;
  final double? frequencyPenalty;
  final double? presencePenalty;

  CompletionsRequest({
    required this.model,
    required this.prompt,
    required this.maxTokens,

    this.temperature,
    this.topP,
    this.frequencyPenalty,
    this.presencePenalty
  });
  // final int? n;
  // final bool? stream;
  // final int? longprobs;
  // final String? stop;

  String toJson() {
    Map<String, dynamic> jsonBody = {
      'model': model,
      'prompt': prompt,
      'max_tokens': maxTokens,
    };

    if (temperature != null) {
      jsonBody.addAll({'temperature': temperature});
    }
    if (topP != null) {
      jsonBody.addAll({'top_p': topP});
    }
    if (frequencyPenalty != null) {
      jsonBody.addAll({'frequency_penalty': frequencyPenalty});
    }
    if (presencePenalty != null) {
      jsonBody.addAll({'presence_penalty': presencePenalty});
    }

    return json.encode(jsonBody);
  }
}

// {
//   "model": "text-davinci-003",
//   "prompt": "come up with 3 detailed specific ideas for a high school programming passion project \n\n\n1. Develop an Android App to Assist High Schoolers with Time Management: Create a mobile application that helps high schoolers organize their daily tasks and schedules, including reminders for upcoming tests, deadlines, and other activities. The app should also include features such as the ability to create to-do lists, set alarms, track progress on tasks, and allow users to share tasks with others. \n\n2. Create an Online Platform for Students to Learn About Different Careers: Design an online platform where high schoolers can explore different career paths and learn about educational requirements, salary expectations, job opportunities, and other relevant information. The platform should include a variety of interactive tools such as quizzes, video tutorials, interviews with professionals in various fields, and more. \n\n3. Build a Website to Help High Schoolers Find Volunteering Opportunities: Create a website that connects high schoolers with volunteer organizations in their area. The website should have a searchable database of local volunteering opportunities, contact information for organizations, and a rating system so students can leave feedback about their experiences. Additionally, it should include resources such as tips on how to find the right opportunity and advice on how to make the most out of volunteering.",
//   "temperature": 0.8,
//   "max_tokens": 3354,
//   "top_p": 0.77,
//   "frequency_penalty": 0,
//   "presence_penalty": 1.6
// }