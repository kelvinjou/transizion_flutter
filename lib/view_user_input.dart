// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:transizion_flutter/all_careers_mapped.dart';
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
  static String specificCareerPath = "";
  static String socialIssue = "";

  String? selectedValue;

  String? subCategory;
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 204, 204, 1.0),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            // _buildTransizionIcon(),
            _buildRhombusDesign(),
            // _buildInfoHover(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // _buildTransizionIcon(),
                  SizedBox(height: 35),
                  SizedBox(
                    width: 300,
                    child: Image.asset(
                      "assets/images/transparent_transizion.png",
                      filterQuality: FilterQuality.high,
                      // width: 135,
                      // height: 135,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Passion Project Generator",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: const Color.fromRGBO(62, 105, 178, 1.0))),
                      // _buildInfoHover(),
                    ],
                  ),
                  SizedBox(height: 40),
                  
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1.5,
                                offset: Offset(0, 2))
                          ],
                        ),
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
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(62, 105, 178, 0.85),
                                    width: 2.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Colors.grey)),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                            hintText: "List passions (separated by commas)",
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: RichText(
                          text: TextSpan(
                            text: "*",
                            style: DefaultTextStyle.of(context).style.copyWith(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10.0),
                          child: _buildCareerPathDropdown()),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: RichText(
                          text: TextSpan(
                            text: "*",
                            style: DefaultTextStyle.of(context).style.copyWith(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Container(
                      margin: const EdgeInsets.all(10.0),
                      child: _buildMultiSelectDropdown()),

                  SizedBox(height: 10),

                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1.5,
                                offset: Offset(0, 2))
                          ],
                        ),
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
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(62, 105, 178, 0.85),
                                      width: 2.2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                              hintText: "List social issues you care about (separated by commas)",
                              fillColor: Colors.white),
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
                          careerPathFilledOut == true && 
                          passionsFilledOut == true) {
                        setState(() {
                          ModelStateManagement.hobbies = hobbies;
                          ModelStateManagement.passions = passions;
                          ModelStateManagement.socialIssue = socialIssue;
                          ModelStateManagement.careerPath = careerPath;
                          ModelStateManagement.specificCareerPath =
                              specificCareerPath;
                          Provider.of<ModelStateManagement>(context,
                              listen: false);
                          context.read<ModelStateManagement>().submitted();
                        });
                      }
                    },
                    text: "  Generate Passion Project!  ",
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Oswald"
                        // color: hobbiesFilledOut == true &&
                        //         passionsFilledOut == true
                        //     ? Colors.white70
                        //     : Colors.black,
                        //     letterSpacing: 0.7
                        ),
                    textColor:
                        careerPathFilledOut == true && passionsFilledOut == true
                            ? Colors.white
                            : Colors.black87,
                    shape: GFButtonShape.pills,
                    color:
                        careerPathFilledOut == true && passionsFilledOut == true
                            ? const Color.fromRGBO(62, 105, 178, 0.9)
                            : const Color.fromRGBO(157, 191, 252, 0.7),
                    hoverColor:
                        careerPathFilledOut == true && passionsFilledOut == true
                            ? const Color.fromRGBO(62, 105, 178, 0.98)
                            : const Color.fromRGBO(157, 191, 252, 0.7),
                    size: 60,
                  ),
                  Spacer(),
                  SizedBox(height: 100)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransizionIcon() {
    // debugPrint("PPP ${MediaQuery.of(context).size.width}");
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Tooltip(
          margin: EdgeInsets.only(right: 50),
          // height: 200,
          richMessage: WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Text(
              "Welcome to the Passion Project Generator! \n \n This tool helps high school students discover \n numerous of potential passion project ideas that \n match their passions and interests. ",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          child: Wrap(
            textDirection: TextDirection.ltr,
            children: [
              Image.asset(
                "assets/images/transparent_transizion.png",
                filterQuality: FilterQuality.high,
                width: 135,
                height: 135,
              ),
              SizedBox(width: 20),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width > 822 ? 50.0 : 0.0),
                child: Text("Passion Project Generator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: const Color.fromRGBO(62, 105, 178, 1.0))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRhombusDesign() {
    return Positioned(
        bottom: 0.0,
        left: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 700
                ? MediaQuery.of(context).size.width
                : 600,
            child: FittedBox(
              fit: BoxFit.fill,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                child: Image.asset(
                  "assets/images/rhombus.png",
                  // width: MediaQuery.of(context).size.width * 0.5
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildCareerPathDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                'Choose a career path',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: generalPaths
            .map((item) => DropdownMenuItem<String>(
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
            selectedItems = [];
            selectedValue = value as String;

            careerPathFilledOut = true;
            careerPathController.text = selectedValue!;
            formKey.currentState?.validate();

            debugPrint("376 ${careerPathController.text}");

            if (value.isNotEmpty) {
              careerPathFilledOut = true;
              careerPath = selectedValue!;
            } else {
              careerPathFilledOut = false;
            }
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
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(
          //   color: Colors.black26,
          // ),
          color: Colors.white,
        ),
        buttonElevation: 4,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 275,
        dropdownWidth: 350,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.redAccent,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: false,
        // offset: const Offset(20, 0),
      ),
    );
  }

  Widget _buildMultiSelectDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                'Select up to 3 specific fields (optional)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: getMapped()?.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final _isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    _isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {
                      specificCareerPath = selectedItems.join(', ');
                      debugPrint(specificCareerPath);
                    });
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        _isSelected
                            ? const Icon(Icons.check_box_rounded,
                                color: Color.fromRGBO(62, 105, 178, 1.0))
                            : const Icon(Icons.check_box_outline_blank_rounded),
                        const SizedBox(width: 16),
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        value: selectedItems.isEmpty ? null : selectedItems.last,
        onChanged: (value) {},
        buttonHeight: 50,
        buttonWidth: 400,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonElevation: 4,
        buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        itemHeight: 40,
        itemPadding: EdgeInsets.zero,
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        iconSize: 14,
        iconEnabledColor: Colors.black,
        dropdownMaxHeight: 275,
        dropdownWidth: 350,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.redAccent,
        ),
        selectedItemBuilder: (context) {
          return business.map(
            (item) {
              return Row(
                children: [
                  Expanded(
                    // alignment: AlignmentDirectional.center,
                    // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      selectedItems.join(', '),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              );
            },
          ).toList();
        },
      ),
    );
  }

  List<String>? getMapped() {
    // debugPrint(mapCategories[careerPathController.text);
    return mapCategories[careerPathController.text];
  }
}

Widget _buildInfoHover() {
  return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Align(
          alignment: Alignment.bottomRight,
          child: Tooltip(
            margin: EdgeInsets.only(right: 50),
            // height: 200,
            richMessage: WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: Text(
                "Welcome to the Passion Project Generator! \n \n This tool helps high school students discover \n numerous of potential passion project ideas that \n match their passions and interests. ",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            child: Icon(
              Icons.info_outline_rounded,
              color: Color.fromRGBO(62, 105, 178, 1.0),
              size: 20,
            ),
          )));
}
