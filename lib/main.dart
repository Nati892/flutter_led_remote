import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'msgmenus.dart';
import 'connection.dart';
import 'global_Data.dart' as globalData;
import 'network_scan.dart';

var prefs = null;
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  globalData.targetIp = "192.168.18.233"; //initialize global variables
  globalData.targetPort = "80"; //initialize global variables
  prefs = await SharedPreferences.getInstance();
  runApp(const MaterialApp(home: basepage()));
}

class basepage extends StatefulWidget {
  const basepage({Key? key}) : super(key: key);

  @override
  State<basepage> createState() => _basepageState();
}

class _basepageState extends State<basepage> {
  msgmenus myWidgets = msgmenus();

  TextEditingController iptextcontroller =
      new TextEditingController(text: "192.168.18.233");

  TextEditingController porttextcontroller =
      new TextEditingController(text: "80");

  Icon presentedIcon = Icon(Icons.search);

  /****************************************/
  /***************************************/
  //this is where many objects and functions are stored

  /****************************************/
  /***************************************/

  @override
  Widget build(BuildContext context) {
    connection thisConnection = new connection();
//these widgets are called
    List<Widget> displayedWidgets = [
      myWidgets.setColor(thisConnection),
      myWidgets.selectPattern(thisConnection),

      //   myWidgets.setBrightnessSlider(thisConnection),
      myWidgets.makeSnake(thisConnection),
      myWidgets.setSnakeSpeed(thisConnection),
      myWidgets.setPatternSpeed(thisConnection),
      myWidgets.setUpAnArea(thisConnection),
    ];
    String? ip = "";
    ip = prefs.getString("IP");
    if (ip != null && ip != "") iptextcontroller.text = ip;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Leds controller'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20.0, 20.0, 20.0),
              child: Row(children: <Widget>[
                IconButton(
                    onPressed: () async {
                      setState(() {
                        presentedIcon = Icon(Icons.hourglass_top_rounded);
                      });
                      await prefs.setString("IP", iptextcontroller.text);
                      String res = await NetworkScanner().ScanNetworkForLeds();
                      if (res != "")
                        setState(() {
                          globalData.targetIp = res.trim();
                          iptextcontroller.text = res;
                        });
                      if (res != "") {
                        await prefs.setString(res);
                      }
                      setState(() {
                        presentedIcon = Icon(Icons.search);
                      });
                    },
                    icon: presentedIcon),
                SizedBox(
                  height: 30,
                  width: 200,
                  child: TextField(
                    onChanged: (text) {
                      globalData.targetIp = text;
                    },
                    controller: iptextcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      hintText: 'LEDSs server IP',
                      hintStyle: TextStyle(fontSize: 18),
                      labelText: "Ip address/ Net id",
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: TextField(
                    onChanged: (text) {
                      globalData.targetPort = text;
                    },
                    controller: porttextcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        hintText: 'Port',
                        hintStyle: TextStyle(fontSize: 18),
                        labelText: "Port"),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: setBrightness(myconnection: thisConnection)),
                  SizedBox(width: 80, child: myWidgets.turnoff(thisConnection)),
                ],
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.blueGrey[100],
                child: Scrollbar(
                  interactive: true,
                  isAlwaysShown: true,
                  thickness: 5,
                  child: ListView.builder(
                    cacheExtent: 750,
                    itemCount: displayedWidgets.length,
                    itemBuilder: (context, index) {
                      return displayedWidgets[index];
                    },

                    //msg menu list creation
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
