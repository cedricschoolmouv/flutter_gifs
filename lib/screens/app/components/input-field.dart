import 'package:flutter/material.dart';

import '../../../constants.dart';

class GifInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController myController;

  const GifInputField({Key key, this.onChanged, this.myController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: myController,
      decoration: InputDecoration(
        icon: Icon(
          Icons.link,
          color: $PRIMARY_COLOR,
        ),
        hintText: "Gif link",
        border: InputBorder.none,
        suffixIcon: Icon(
          //onPressed: () => () {},
          Icons.copy,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: $PRIMARY_COLOR_2, borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
