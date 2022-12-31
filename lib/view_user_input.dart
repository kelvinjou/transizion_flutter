// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:transizion_flutter/view_output_connector.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// ignore: unused_import
class ViewUserInput extends StatefulWidget {
  const ViewUserInput({Key, key}) : super(key: key);

  @override
  State<ViewUserInput> createState() => ViewUserInputState();
}

class ViewUserInputState extends State<ViewUserInput> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController hobbiesController = TextEditingController();
  static TextEditingController passionController = TextEditingController();
  static TextEditingController careerPathController = TextEditingController();
  static TextEditingController socialIssueController = TextEditingController();
  bool hobbiesFilledOut = false;
  bool passionsFilledOut = false;
  bool careerPathFilledOut = false;
  bool socialIssueFilledOut = false;

  static String hobbies = "";
  static String passions = "";
  static String careerPath = "";
  static String socialIssue = "";

  String? selectedValue;


  final List<String> paths = [
    "Business and finance",
    "Education",
    "Health care",
    "Technology",
    "Art and design",
    "Communications and media",
    "Law and criminal justice",
    "Science, engineering, and math",
    "Social services",
    "Hospitality and tourism",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 204, 204, 1.0),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            _buildTransizionIcon(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(62, 105, 178, 0.85),
                                  width: 2.2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(color: Colors.grey)),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Hobbies",
                          fillColor: Colors.white70),
                    ),
                  ),

                  SizedBox(height: 10),

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
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(62, 105, 178, 0.85),
                                  width: 2.2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(color: Colors.grey)),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Passions",
                          fillColor: Colors.white70),
                    ),
                  ),

                  SizedBox(height: 10),

                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: careerPathController,
                      onChanged: (value) {
                        socialIssue = careerPathController.text;
                        setState(() {
                          formKey.currentState?.validate();

                          if (passionController.text.isNotEmpty) {
                            careerPathFilledOut = true;
                          } else {
                            careerPathFilledOut = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(62, 105, 178, 0.85),
                                  width: 2.2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(color: Colors.grey)),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Career path (Optional)",
                          fillColor: Colors.white70),
                    ),
                  ),

                  SizedBox(height: 10),

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
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(62, 105, 178, 0.85),
                                      width: 2.2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Social Issues (Optional)",
                              fillColor: Colors.white70),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 400,
                          child: Text(
                              "Ex. overpopulation, global warming, gender inequality",
                              style: TextStyle(fontSize: 12.5)),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 50),

                  GFButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() == true &&
                          hobbiesController.text.isNotEmpty &&
                          passionController.text.isNotEmpty) {
                        setState(() {
                          ModelStateManagement.hobbies = hobbies;
                          ModelStateManagement.passions = passions;
                          ModelStateManagement.socialIssue = socialIssue;
                          ModelStateManagement.careerPath = careerPath;
                          context.read<ModelStateManagement>().submitted();
                        });
                      }
                    },
                    text: "Generate Passion Project",
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: hobbiesFilledOut == true &&
                      //         passionsFilledOut == true
                      //     ? Colors.white70
                      //     : Colors.black,
                      //     letterSpacing: 0.7
                    ),
                    textColor:
                        hobbiesFilledOut == true && passionsFilledOut == true
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

                  // testing multi-select dropdown
                  // Container(
                  //   width: 300,
                  //   height: 200,
                  //   child: GFMultiSelect(
                  //     items: const [
                  //       "Business and finance",
                  //       "Education",
                  //       "Health care",
                  //       "Technology",
                  //       "Art and design",
                  //       "Communications and media",
                  //       "Law and criminal justice",
                  //       "Science, engineering, and math",
                  //       "Social services",
                  //       "Hospitality and tourism",
                  //     ],
                  //     onSelect: (value) {
                  //       debugPrint('selected $value ');
                  //     },
                  //     dropdownTitleTileText: 'Messi, Griezmann, Coutinho ',
                  //     dropdownTitleTileBorder: Border.all(color: Colors.grey, width: 1),
                  //     dropdownTitleTileTextStyle:
                  //         const TextStyle(fontSize: 14, color: Colors.black54),
                  //     padding: const EdgeInsets.all(6),
                  //     dropdownTitleTileBorderRadius: BorderRadius.circular(20),
                  //     margin: const EdgeInsets.all(6),
                  //     type: GFCheckboxType.circle,
                  //     activeBgColor: Colors.green.withOpacity(0.5),
                  //   ),
                  // )

                  DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: const [
              Expanded(
                child: Text(
                  'Select Item',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: paths
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          // iconDisabledColor: Colors.grey,
          buttonHeight: 50,
          buttonWidth: 400,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            // border: Border.all(
            //   color: Colors.black26,
            // ),
            color: Colors.white,
          ),
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 275,
          dropdownWidth: 350,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            // color: Colors.redAccent,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: false,
          offset: const Offset(20, 0),
        ),
      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransizionIcon() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/transparent_transizion.png",
              width: 135,
              height: 135,
            ),
            SizedBox(width: 20),
            Text("Passion Project Generator",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: const Color.fromRGBO(62, 105, 178, 1.0))),
          ],
        ),
      ),
    );
  }
}
