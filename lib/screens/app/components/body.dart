import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_project/components/Background.dart';
import 'package:test_project/components/rounded-button.dart';
import 'package:test_project/screens/app/app-screen.dart';

import 'input-field.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  String _gifLink = '';
  String _message = '';

  List<String> _gifs = [
    "https://media.giphy.com/media/iKAerRsyL5SeOgzXtq/giphy.gif",
    'https://media.giphy.com/media/9yQdyt0VHsRGjklNw4/giphy.gif',
  ];

  void _handleLinkChanged(String newValue) {
    setState(() {
      log(newValue);
      _gifLink = newValue;
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
          _gifLink,
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
        GifInputSectionState(
          gifLink: _gifLink,
          onChanged: _handleLinkChanged,
          addLink: _handleAddLink,
          message: _message,
          getMessage: _getMessage,
        ),
      ],
    );
  }
}

class GifInputSectionState extends StatefulWidget {
  GifInputSectionState(
      {Key key,
      this.gifLink: '',
      this.message,
      @required this.onChanged,
      @required this.getMessage,
      @required this.addLink})
      : super(key: key);

  final String gifLink;
  final String message;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> addLink;
  final Function getMessage;

  _GifInputSectionState createState() => _GifInputSectionState();
}

class _GifInputSectionState extends State<GifInputSectionState> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _handleInputChange(gifLink) {
    widget.onChanged(gifLink);
  }

  void _handleAddLink(gifLink) {
    widget.addLink(gifLink);
  }

  String getMessage() {
    return widget.getMessage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.04),
          TextFieldContainer(
            child: GifInputField(
              onChanged: (value) {
                _handleInputChange(value);
              },
              myController: myController,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
            text: "Ajouter le gif",
            press: () {
              _handleAddLink(widget.gifLink);

              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(getMessage())));
            },
          ),
          SizedBox(height: size.height * 0.04),
        ],
      ),
    );
  }
}
