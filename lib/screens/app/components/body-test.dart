import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_project/components/rounded-button.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';
import 'input-field.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  String _message = '';
  var textFieldValue = TextEditingController();

  List<String> _gifs = [
    "https://media.giphy.com/media/iKAerRsyL5SeOgzXtq/giphy.gif",
    'https://media.giphy.com/media/9yQdyt0VHsRGjklNw4/giphy.gif',
  ];

  void _handleLinkChanged(String newValue) {
    setState(() {
      log('newValue');
      log(newValue);
      textFieldValue.text = newValue;
      log('textField');
      log(textFieldValue.text);
    });
  }

  void _handleAddLink(String newValue) {
    setState(() {
      log(_gifs.length.toString());
      if (!_gifs.contains(newValue) && newValue != null) {
        _message = 'Gif Added !';
        _gifs.add(newValue);
      } else {
        _message = 'Gif Already Added';
      }
    });
  }

  String _getMessage() {
    return _message;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(
          textFieldValue.text,
          height: 300,
          fit: BoxFit.fitHeight,
        ),
        Expanded(
            child: GridView.builder(
                itemCount: _gifs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      _handleLinkChanged(_gifs[index]);
                    },
                    child: Image.network(
                      _gifs[index],
                      fit: BoxFit.fitHeight,
                    )))),
        Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.04),
              TextFieldContainer(
                child: TextField(
                  controller: textFieldValue,
                  onChanged: (value) {
                    _handleLinkChanged(value);
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.link,
                      color: $PRIMARY_COLOR,
                    ),
                    hintText: "Gif link",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(
                            new ClipboardData(text: textFieldValue.text));
                      },
                      color: $PRIMARY_COLOR,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: "Ajouter le gif",
                press: () {
                  _handleAddLink(textFieldValue.text);
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(_getMessage())));
                },
              ),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        )
      ],
    );
  }
}
