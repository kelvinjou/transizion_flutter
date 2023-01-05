// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/alert/gf_alert.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/shape/gf_icon_button_shape.dart';
import 'package:provider/provider.dart';
import 'package:transizion_flutter/completions_api.dart';
import 'package:transizion_flutter/view_user_input.dart';
import 'package:lottie/lottie.dart';

class ViewOutputConnector extends StatelessWidget {
  const ViewOutputConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(65, 105, 178, 1.0),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(flex: 1, child: ViewUserInput()),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Count(),
                ))
          ],
        ),
      ),
    );
  }

  // void showAlert(BuildContext context) {

  //         GFAlert(
  //           width: 150,
  //           // height: 75,
  //           alignment: Alignment.center,
  //           backgroundColor: Colors.white,
  //           title: "Welcome!",
  //           content: 'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
  //           type: GFAlertType.rounded,
  //                         bottombar: Row(
  //                           mainAxisAlignment: MainAxisAlignment.end,
  //                           children: <Widget>[
  //                             GFButton(
  //                               onPressed: () {
  //                                 // setState(() {
  //                                 //   // alertWidget = null;
  //                                 //   // showBlur = false;
  //                                 // });
  //                               },
  //                               color: GFColors.LIGHT,
  //                               child: const Text(
  //                                 'Close',
  //                                 style: TextStyle(color: Colors.black),
  //                               ),
  //                             ),
  //                           ],
  //                         ),

  //       );
  // }
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
  Future<List<String>>? future;
  // cuz initState only runs on startup, won't run when it setState
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.watch<ModelStateManagement>().hasSubmitted) {
        // Provider.of<ModelStateManagement>(context, listen: false);
        future = Provider.of<ModelStateManagement>(context, listen: false)
            .runGPTModel();
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (context.watch<ModelStateManagement>().hasSubmitted) {
      future = ModelStateManagement().runGPTModel();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<String>>(
            future: future,
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text(
                    "Results Shown Here",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                            'assets/images/lottieCircularProgress.json',
                            height: 225,
                            width: 225),
                        Text("Generating Ideas",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(241, 241, 241, 1.0)))
                      ],
                    ),
                  );
                // Text(
                //   'Awaiting result',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                //   );
                default:
                  Future.delayed(const Duration(seconds: 5), () {
                    setState(() {
                      context.read<ModelStateManagement>().canRestart = true;
                    });
                  });

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Stack(children: [
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var item in snapshot.data!)
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(45, 20, 40, 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(209, 219, 237, 1.0),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(17.0),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            )
                        ],
                      )
                      // Center(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(25.0),
                      //     child: Text(
                      //       '${snapshot.data}',
                      //       style: TextStyle(
                      //         fontSize: 16.0,
                      //         height: 1.5,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ]);
                  }
              }
            }));
  }
}

class ModelStateManagement with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  bool _hasSubmitted = false;
  bool get hasSubmitted => _hasSubmitted;

  bool _canRestart = false;
  bool get canRestart => _canRestart;
  set canRestart(bool value) {
    _canRestart = value;
  }

  static String hobbies = "";
  static String passions = "";
  static String socialIssue = "";
  static String careerPath = "";
  static String specificCareerPath = "";

  Future<List<String>> runGPTModel() async {
    final res = await CompletionsAPI.generatePassionProjectIdea(
        hobbies, passions, socialIssue, careerPath, specificCareerPath);

    final String text = res.choices![0]['text'];

    final split = text.split("\n");
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };

    Map<int, String> modifiedValues = values.map((key, value) =>
        MapEntry(key, value.replaceAll(RegExp(r"^\d\.\s"), "")));

    values.removeWhere((key, value) => value.startsWith(RegExp(r"^\d\.\s")));

    values.addAll(modifiedValues);

    final value1 = values[2];
    final value2 = values[4];
    final value3 = values[6];

    return [value1!, value2!, value3!];
  }

  void submitted() {
    _hasSubmitted = true;
    notifyListeners();
  }

  void restart() {
    _canRestart = !_canRestart;
    notifyListeners();
  }
}
