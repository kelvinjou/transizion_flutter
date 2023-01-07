// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:transizion_flutter/view_output_connector.dart';
import 'package:transizion_flutter/view_user_input.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({Key? key}) : super(key: key);

  @override
  State<SplitScreen> createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {

  @override
  Widget build(BuildContext context) {
    debugPrint("${context.watch<ModelStateManagement>().hasSubmitted}");
    return Scaffold(
      body: Row(
        children: [
          // Main view
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: ViewUserInput(),
              ),
            ),
          ),
          // Split screen view
          (context.watch<ModelStateManagement>().hasSubmitted)
              ? Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Color.fromRGBO(65, 105, 178, 1.0),
                      child: Count()
                      ),
                  ))
              : Container(),
        ],
      ),
    );
  }
}
