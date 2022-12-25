// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transizion_flutter/completions_api.dart';
import 'package:transizion_flutter/view_user_input.dart';
import 'package:lottie/lottie.dart';

class ViewOutputConnector extends StatelessWidget {
  const ViewOutputConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(flex: 1, child: ViewUserInput()),
            Expanded(flex: 1, child: Count())
          ],
        ),
      ),
    );
  }
}

/// As we have [context.watch] inside of our widget,
/// it will rebuild the entire widget.
/// Therefore we can create a standalone widget like the one below.
class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: context.watch<Counter>().hasSubmitted
            ? Counter().runGPTModel("h", "p")
            : null,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text(
                "Press button to start",
                style: TextStyle(fontWeight: FontWeight.bold),
                );
            case ConnectionState.waiting:
              return Center(
                child: Lottie.asset(
                  'assets/images/lottieCircularProgress.json',
                  height: 150,
                  width: 150
                  ),
              );
              // Text(
              //   'Awaiting result',
              //   style: TextStyle(fontWeight: FontWeight.bold),
              //   );
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    '${snapshot.data}',
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                    ),
                );
              }
          }
        },
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  bool _hasSubmitted = false;
  bool get hasSubmitted => _hasSubmitted;

  static String hobbies = "";
  static String passions = "";
  static String socialIssue = "";

  Future<String> runGPTModel(String hobbies, String passions) async {
    final res = await CompletionsAPI.generatePassionProjectIdea(hobbies, passions, socialIssue);
    return res.choices![0]['text'];
  }

  void submitted() {
    _hasSubmitted = true;
    notifyListeners();
  }

  void restart() {
    _count = 0;
    notifyListeners();
  }
}
