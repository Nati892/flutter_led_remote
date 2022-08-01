import 'package:flutter/material.dart';

//this one gets a list to put in a row of widgets
class msgMenu extends StatelessWidget {
  List<Widget> list = [];
  String LabelText = '';

  msgMenu(String labelText, this.list) {
    LabelText = labelText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: InputDecorator(
                decoration: InputDecoration(
                    labelText: this.LabelText,
                    labelStyle: TextStyle(color: Colors.lightBlue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: Row(
                  children: list,
                )),
            height: 120,
            width: 400,
          ),
        ),
      ),
    );
  }
}

//this one get a Widget
class msgmenu2 extends StatefulWidget {
  final String header;
  final Widget widgeta;
  final int Height;

  const msgmenu2(
      {Key? key,
      required this.header,
      required this.widgeta,
      required this.Height})
      : super(key: key);

  @override
  _msgmenu2State createState() =>
      _msgmenu2State(this.header, this.widgeta, this.Height);
}

class _msgmenu2State extends State<msgmenu2> {
  String header;
  Widget widgeta;
  int Height;

  _msgmenu2State(this.header, this.widgeta, this.Height);

  @override
  Widget build(BuildContext context) {
    if (Height == 0) Height = 120;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: InputDecorator(
                decoration: InputDecoration(
                    labelText: this.header,
                    labelStyle: TextStyle(color: Colors.lightBlue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: widgeta),
            height: Height.toDouble(),
            width: 400,
          ),
        ),
      ),
    );
  }
}
