import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:garage/helper.dart';
import 'package:garage/status.dart';
import 'apiData.dart';
import 'constants.dart';
import 'slot.dart';
import 'package:garage/gist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garage ',
      theme: ThemeData(
        colorScheme:ColorScheme.light().copyWith(
          primary: Colors.white12,
        ) ,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),

      home: MyHomePage(title: 'garageKom'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final databaseReferenceTest = FirebaseDatabase.instance.reference();
  final databaseReferenceTest1 = FirebaseDatabase.instance.reference();
  final databaseReferenceTest2 = FirebaseDatabase.instance.reference();

  Status s = new Status();
  bool emptyRouteNameField = false;


  @override
  void initState() {
    s.state=[0,0,0,0,0,0];
    databaseReferenceTest
        .child('status')
        .onValue
        .listen((event) {
      var snapshot = event.snapshot;
      setState(() {
        s.splitData(snapshot.value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                Helper(color: Colors.red,),
                Text("  busy"),
                SizedBox(width: 30),
                Helper(color: Colors.green),
                Text("  free"),
                SizedBox(width: 30),
                Helper(color: Colors.blue),
                Text("  reserved"),


              ],
            ),
            SizedBox(height: 40,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                //----------------->slot 0
                InkWell(
                  onTap: () {
                    if(s.state[0]>15||s.state[0]==0)//free to be reserved
                    changeState(0);
                    },
                  child: Slot(c: s.state[0] > 15 ? Colors.green
                      : s.state[0] == 0 ? Colors.blue : Colors.red,
                    t: "P1",),
                ),
                SizedBox(width: 40),
                //-----------------> slot 1
                InkWell(
                  onTap: () {
                    if(s.state[1]>15||s.state[1]==0)//free to be reserved
                      changeState(1);
                  },
                  child: Slot(c: s.state[1] > 15 ? Colors.green
                      : s.state[1] == 0 ? Colors.blue : Colors.red,
                    t: "P2",),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                //------------------> slot 2
                InkWell(
                  onTap: () {
                    if(s.state[2]>15||s.state[2]==0)//free to be reserved
                      changeState(2);
                  },
                  child: Slot(c: s.state[2] > 15 ? Colors.green
                      : s.state[2] == 0 ? Colors.blue : Colors.red,
                    t: "P3",),
                ),
                SizedBox(width: 40),
                //----------------> slot 3
                InkWell(
                  onTap: () {
                    if(s.state[3]>15||s.state[3]==0)//free to be reserved
                      changeState(3);
                  },
                  child: Slot(c: s.state[3] > 15 ? Colors.green
                      : s.state[3] == 0 ? Colors.blue : Colors.red,
                    t: "P4",),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                //-------------------> slot 4
                InkWell(
                  onTap: () {
                    if(s.state[4]>15||s.state[4]==0)//free to be reserved
                      changeState(4);
                  },
                  child: Slot(c: s.state[4] > 15 ? Colors.green
                      : s.state[4] == 0 ? Colors.blue : Colors.red,
                    t: "P5",),
                ),
                SizedBox(width: 40),
                //-------------> slot 5
                InkWell(
                  onTap: () {
                    if(s.state[5]>15||s.state[5]==0)//free to be reserved
                      changeState(5);
                  },
                  child: Slot(c: s.state[5] > 15 ? Colors.green
                      : s.state[5] == 0 ? Colors.blue : Colors.red,
                    t: "P6",),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: 100.0,
              width: 415.0,
              decoration: BoxDecoration(
                image: DecorationImage(

                  fit: BoxFit.fill,
                  image: AssetImage('road.jpg'),
                ),
                //shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }

   changeState(int p ) {
    TextEditingController routeName = TextEditingController();
    bool emptyRouteNameField = false;

     {
      showDialog(
          context: context,
          child:       CustomAlertDialog(
            content: Container(
              width: 200,
              height: 150,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Enter car number:"),
                  TextField(
                    //initialValue: "Hotel route",
                    controller: routeName,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: emptyRouteNameField ? Colors.red : Colors.black,
                        ),
                      ),
                      labelText: "Number",
                      labelStyle: TextStyle(
                        color: emptyRouteNameField ? Colors.red : Colors.black,
                      ),
                      hintStyle: TextStyle(
                        color: emptyRouteNameField ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.deepOrangeAccent,
                      child: MaterialButton(
                        minWidth: 20,

                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        onPressed: () async {
                          routeName.text.isEmpty? makeErrorBrder(): s.state[p]!=0?
                          makeChange(p,
                          routeName.text):confirmRes(p,routeName.text);
                          if (routeName.text.isNotEmpty) Navigator.pop(context);
                        },
                        child: Text(
                          s.state[p]!=0?"Book now!":"confirm",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )

      );
    }


  }
  makeErrorBrder() {
    setState(() {
      emptyRouteNameField = true;
    });
  }

  makeChange(int p,String number) {
    setState(() {
      s.state[p]=0;
      databaseReferenceTest
          .child('status').set(
        s.toString(),

      );

    });

    databaseReferenceTest1
        .child('s'+p.toString()).set(
      number);


    }

  void confirmRes(int p, String carNum) {
    databaseReferenceTest
        .child('s'+p.toString()).once().then((value) {
          if(value.value==carNum)
            setState(() {
              s.state[p]=5;
              databaseReferenceTest
                  .child('status').set(
                s.toString(),
              );
            });
    });
  }

}


