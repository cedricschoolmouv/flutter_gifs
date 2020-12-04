import 'package:flutter/material.dart';
import 'package:test_project/constants.dart';

import 'components/body-test.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Body(),
    );
  }
}
