import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'msgmenu.dart';
import 'msgType.dart';
import 'connection.dart';

class msgmenus {
  //this is the set color widget
  msgType colorselect = new msgType('2', []);

  //this functions is used in the change color widget
  //this function gets a list of string s and creates buttons out of them where the test sent to server is
  //A. and then their own text's first word
  List<Container> stringtobutton(
      List<String> Stringlist, connection thisconnection) {
    List<Container> IconList = [];
    for (int i = 0; i < Stringlist.length; i++) {
      IconList.add(Container(
        color: Colors.grey[200],
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              thisconnection.sendServer("A." + Stringlist[i][0]);
            },
            child: SizedBox(
              height: 40,
              width: 80,
              child: Container(
                  color: Colors.blue[100],
                  child: Center(
                      child: Text(
                    Stringlist[i],
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ))),
            ),
          ),
        ),
      ));
    }
    return IconList;
  }

  List<Container> stringtoColor(
      List<String> Stringlist, connection thisconnection) {
    List<Container> IconList = [];
    for (int i = 0; i < Stringlist.length; i++) {
      Color newColor = Colors.blue;
      switch (Stringlist[i]) {
        case "Blue":
          {
            newColor = Colors.blue;
          }
          break;
        case "Red":
          {
            newColor = Colors.red;
          }
          break;
        case "Green":
          {
            newColor = Colors.green;
          }
          break;
        case "Yellow":
          {
            newColor = Colors.yellow;
          }
          break;
        case "Cyan":
          {
            newColor = Colors.cyan;
          }
          break;
        case "Purple":
          {
            newColor = Colors.purple;
          }
          break;
        case "pink":
          {
            newColor = Colors.pink;
          }
          break;
        case "Magneta":
          {
            newColor = Colors.purpleAccent;
          }
          break;
        case "White":
          {
            newColor = Colors.white;
          }
          break;
        case "Orange":
          {
            newColor = Colors.orange;
          }
          break;
      }
      IconList.add(Container(
        color: Colors.grey[200],
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              thisconnection.sendServer("A." + Stringlist[i][0]);
            },
            child: SizedBox(
              height: 40,
              width: 40,
              child: Container(
                  color: Colors.blue[100],
                  child: Center(
                      child: Container(
                    color: newColor,
                  ))),
            ),
          ),
        ),
      ));
    }
    return IconList;
  }

//this one sets the color of the Led Strip
  Widget setColor(connection thisconnection) {
    return msgMenu("Set color", [
      SizedBox(
        height: 60,
        child: Container(
            color: Colors.grey[200],
            child: Center(
                child: Text("Change color:",
                    style: TextStyle(color: Colors.cyan, fontSize: 16)))),
      ),
      Expanded(
        child: SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: stringtoColor(colorselect.range, thisconnection),
          ),
        ),
      ),
    ]);
  }

//this is the turn off widget
  Widget turnoff(connection thisconnection) {
    return TextButton(
      onPressed: () {
        thisconnection.sendServer('F');
      },
      child: Container(
          color: Colors.blue[100],
          child: Center(
              child: Text(
            "Lights off",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ))),
    );
  }

  // set brightnss widget

//make snake widget
  //this one has to call an statefull widget (because of freaking dropdownmenus)
  Widget makeSnake(connection myConnection) {
    msgType colors = msgType('2', []);
    List<String> snaketype = ["Color"];
    List<String> snakecolor = colors.range;

    return msgmenu2(
        Height: 200,
        header: 'Make Snake',
        widgeta: snake(
          snaketype: snaketype,
          snakecolor: snakecolor,
          myconnection: myConnection,
        ));
  }

//sets sanke speed
  Widget setSnakeSpeed(connection myconnection) {
    return msgmenu2(
        Height: 0,
        header: "Set snake speed",
        widgeta: snakeSpeed(
          myconnection: myconnection,
        ));
  }

//sets moving pattern speed
  Widget setPatternSpeed(connection myconnection) {
    List<String> list = [];
    for (int i = 1; i < 100; i++) list.add(i.toString());
    return msgmenu2(
        Height: 0,
        header: "Set pattern speed",
        widgeta: patternSpeed(
          myconnection: myconnection,
        ));
  }

  Widget selectPattern(connection myconnection) {
    return msgMenu("Set Pattern", [
      SizedBox(
        height: 60,
        child: Container(
            color: Colors.grey[200],
            child: Center(
                child: Text("Set Pattern:",
                    style: TextStyle(color: Colors.cyan, fontSize: 16)))),
      ),
      Expanded(
        child: SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ////
              Container(
                color: Colors.grey[200],
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      myconnection.sendServer("B.A");
                    },
                    child: SizedBox(
                      height: 40,
                      width: 80,
                      child: Container(
                          color: Colors.blue[100],
                          child: Center(
                              child: Text(
                            "Rainbow",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ))),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey[200],
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      myconnection.sendServer("B.B");
                    },
                    child: SizedBox(
                      height: 40,
                      width: 80,
                      child: Container(
                          color: Colors.blue[100],
                          child: Center(
                              child: Text(
                            "Blue Rainbow",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ))),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  Widget setUpAnArea(connection myconnection) {
    List<String> range = [];
    for (int i = 0; i < 300; i++) range.add(i.toString());

    return msgmenu2(
        Height: 130,
        header: "Set Area",
        widgeta: setUpArea(
          myconnection: myconnection,
          colorrange: colorselect.range,
        ));
  }
}

class snake extends StatefulWidget {
  final connection myconnection;
  final List<String> snaketype;

  final List<String> snakecolor;

  const snake(
      {Key? key,
      required this.snaketype,
      required this.snakecolor,
      required this.myconnection})
      : super(key: key);

  @override
  _snakeState createState() =>
      _snakeState(this.snaketype, this.snakecolor, this.myconnection);
}

class _snakeState extends State<snake> {
  final connection myconnection;
  List<String> snaketype;

  List<String> snakecolor;

  _snakeState(this.snaketype, this.snakecolor, this.myconnection);

  String? valuea = 'Color';
  String? valueb = 'Red';
  String? valuec = '30';
  String? valued = '70';
  double Speed = 1.0;
  double Length = 1.0;

  @override
  Widget build(BuildContext context) {
    //drop down menu for the snake type selection
    return Container(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(color: Colors.cyan),
                      ),
                      DropdownButton<String>(
                        dropdownColor: Colors.blue[50],
                        value: valuea,
                        items: snaketype.map((buildmenuitem) {
                          return DropdownMenuItem<String>(
                              value: buildmenuitem, child: Text(buildmenuitem));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            valuea = value;
                          });
                        },
                      ),
                    ]),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      //drop down menu for the snake color selection
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Color",
                          style: TextStyle(color: Colors.cyan),
                        ),
                        DropdownButton<String>(
                          dropdownColor: Colors.blue[50],
                          value: valueb,
                          items: snakecolor.map((buildmenuitem) {
                            return DropdownMenuItem<String>(
                                value: buildmenuitem,
                                child: Text(buildmenuitem));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              valueb = value;
                            });
                          },
                        ),
                      ]),
                ),
                IconButton(
                    onPressed: () {
                      String msg = 'C.';
                      if (valuea == 'Color') msg = msg + "A";
                      msg = msg + "." + valueb![0] + ".";
                      if (Length.toInt() < 10) msg = msg + "0";
                      msg = msg + Length.toInt().toString();
                      msg = msg + '.';
                      if (Speed.toInt() < 10) msg = msg + "0";
                      msg = msg + Speed.toInt().toString();
                      myconnection.sendServer(msg);
                    },
                    icon: Icon(
                      Icons.upload_outlined,
                      color: Colors.deepPurple[700],
                    )),
              ]),
          Row(
            children: [
              Text("speed: "),
              Slider(
                value: Speed,
                min: 1,
                max: 99,
                activeColor: Colors.deepPurple,
                inactiveColor: Colors.deepPurple[100],
                onChanged: (double val) {
                  setState(() {
                    Speed = val;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("length: "),
              Slider(
                value: Length,
                min: 1,
                max: 49,
                activeColor: Colors.deepPurple,
                inactiveColor: Colors.deepPurple[100],
                onChanged: (double val) {
                  setState(() {
                    Length = val;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class snakeSpeed extends StatefulWidget {
  final connection myconnection;

  const snakeSpeed({Key? key, required this.myconnection}) : super(key: key);

  @override
  _snakeSpeedState createState() => _snakeSpeedState(this.myconnection);
}

class _snakeSpeedState extends State<snakeSpeed> {
  final connection myconnection;

  _snakeSpeedState(this.myconnection);

  @override
  double currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Slider(
            value: currentValue,
            min: 1,
            max: 99,
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.deepPurple[100],
            onChanged: (double val) {
              setState(() {
                currentValue = val;
              });
            },
            onChangeEnd: (val) {
              int intVal = currentValue.toInt();
              String msg = intVal.toString();
              if (intVal < 10) msg = "0" + msg;
              myconnection.sendServer("G." + msg);
            },
          ),
        ),
      ],
    );
  }
}

class patternSpeed extends StatefulWidget {
  final connection myconnection;

  const patternSpeed({Key? key, required this.myconnection}) : super(key: key);

  @override
  _patternSpeedState createState() => _patternSpeedState(this.myconnection);
}

class _patternSpeedState extends State<patternSpeed> {
  connection myconnection;

  _patternSpeedState(this.myconnection);

  double currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Slider(
            value: currentValue,
            min: 1,
            max: 99,
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.deepPurple[100],
            onChanged: (double val) {
              setState(() {
                currentValue = val;
              });
            },
            onChangeEnd: (val) {
              int intVal = currentValue.toInt();
              String msg = intVal.toString();
              if (intVal < 10) msg = "0" + msg;
              myconnection.sendServer("D." + msg);
            },
          ),
        ),
      ],
    );
  }
}

class setUpArea extends StatefulWidget {
  final connection myconnection;

  final List<String> colorrange;

  const setUpArea(
      {Key? key, required this.myconnection, required this.colorrange})
      : super(key: key);

  @override
  _setUpAreaState createState() =>
      _setUpAreaState(this.myconnection, this.colorrange);
}

class _setUpAreaState extends State<setUpArea> {
  connection myconnection;

  List<String> colorrange;

  _setUpAreaState(this.myconnection, this.colorrange);

  String? valuec = 'White';
  var selectedRange = RangeValues(0.0, 299.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          dropdownColor: Colors.blue[50],
                          value: valuec,
                          items: colorrange.map((buildmenuitem) {
                            return DropdownMenuItem<String>(
                                value: buildmenuitem,
                                child: Text(buildmenuitem));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              valuec = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: RangeSlider(
                    values: selectedRange,
                    min: 0.0,
                    max: 299.0,
                    activeColor: Colors.deepPurple,
                    inactiveColor: Colors.deepPurple[100],
                    onChanged: (RangeValues newRange) {
                      setState(() {
                        selectedRange = newRange;
                      });
                    },
                    onChangeEnd: (val) {
                      String msg = "H.";
                      int Start = selectedRange.start.toInt();
                      int End = selectedRange.end.toInt();
                      if (Start < 100) msg += "0";
                      if (Start < 10) msg += "0";
                      msg += Start.toString();
                      msg += "-";
                      if (End < 100) msg += "0";
                      if (End < 10) msg += "0";
                      msg += End.toString();
                      msg += ",";
                      msg += valuec![0];
                      myconnection.sendServer(msg);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class setBrightness extends StatefulWidget {
  final connection myconnection;

  const setBrightness({Key? key, required this.myconnection}) : super(key: key);

  @override
  _setBrightnessState createState() => _setBrightnessState(this.myconnection);
}

// ignore: camel_case_types
class _setBrightnessState extends State<setBrightness> {
  final connection myconnection;

  _setBrightnessState(this.myconnection);

  double currentBrightness = 50.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: currentBrightness,
      min: 1,
      max: 55,
      activeColor: Colors.deepPurple,
      inactiveColor: Colors.deepPurple[100],
      onChanged: (double val) {
        setState(() {
          currentBrightness = val;
        });
      },
      onChangeEnd: (double val) {
        int intVal = val.toInt();
        String msg = intVal.toString();
        if (intVal < 10) msg = "0" + msg;
        myconnection.sendServer("E." + msg);
      },
    );
  }
}
