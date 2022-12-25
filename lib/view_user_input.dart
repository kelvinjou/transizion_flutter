// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:transizion_flutter/view_output_connector.dart';

// ignore: unused_import
class ViewUserInput extends StatefulWidget {
  const ViewUserInput({Key, key}) : super(key: key);

  @override
  State<ViewUserInput> createState() => ViewUserInputState();
}

class ViewUserInputState extends State<ViewUserInput> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController hobbiesController = TextEditingController();
  final TextEditingController passionController = TextEditingController();
  final TextEditingController socialIssueController = TextEditingController();
  bool hobbiesFilledOut = false;
  bool passionsFilledOut = false;
  bool socialIssueFilledOut = false;

  static String hobbies = "";
  static String passions = "";
  static String socialIssue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // MARK: hobbies
              Container(
                margin: const EdgeInsets.all(10.0),
                width: 400,
                child: TextField(
                  controller: hobbiesController,
                  onChanged: (value) {
                    setState(() {
                      hobbies = hobbiesController.text;
                      formKey.currentState?.validate();

                      if (hobbiesController.text.isNotEmpty) {
                        hobbiesFilledOut = true;
                      } else {
                        hobbiesFilledOut = false;
                      }
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Hobbies",
                      fillColor: Colors.white70),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                width: 400,
                height: 50,
                child: TextField(
                  controller: passionController,
                  onChanged: (value) {
                    passions = passionController.text;
                    setState(() {
                      formKey.currentState?.validate();

                      if (passionController.text.isNotEmpty) {
                        passionsFilledOut = true;
                      } else {
                        hobbiesFilledOut = false;
                      }
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Passions",
                      fillColor: Colors.white70),
                ),
              ),

              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: socialIssueController,
                      onChanged: (value) {
                        socialIssue = socialIssueController.text;
                        setState(() {
                          formKey.currentState?.validate();

                          if (passionController.text.isNotEmpty) {
                            socialIssueFilledOut = true;
                          } else {
                            socialIssueFilledOut = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Social Issues (Optional)",
                          fillColor: Colors.white70),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Text(
                      "Ex. overpopulation, global warming, gender inequality",
                      style: TextStyle(fontSize: 12.5)
                    ),
                  )
                ],
              ),
              GFButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true &&
                      hobbiesController.text.isNotEmpty &&
                      passionController.text.isNotEmpty) {
                    setState(() {
                      Counter.hobbies = hobbies;
                      Counter.passions = passions;
                      Counter.socialIssue = socialIssue;
                      context.read<Counter>().submitted();
                    });
                  }
                },
                text: "Generate Passion Project",
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                textColor: hobbiesFilledOut == true && passionsFilledOut == true
                    ? Colors.white
                    : Colors.black87,
                shape: GFButtonShape.pills,
                color: hobbiesFilledOut == true && passionsFilledOut == true
                    ? const Color.fromRGBO(62, 105, 178, 0.7)
                    : const Color.fromRGBO(157, 191, 252, 0.7),
                hoverColor:
                    hobbiesFilledOut == true && passionsFilledOut == true
                        ? const Color.fromRGBO(62, 105, 178, 0.85)
                        : const Color.fromRGBO(157, 191, 252, 0.7),
                size: GFSize.LARGE,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
