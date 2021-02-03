import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(

home:Home(),
  ),
  );
}


  class Home extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Tile Clicker'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(120.0, 0.0, 0.0, 0.0),
              child: Text('Tile Clicker',
              style: TextStyle(
                fontSize: (40.0),
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(120.0, 0.0, 0.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Vis()),
                  );
                },
                child: Text('Start'),
            ),
            ),
          ],
        ),
      );
    }
  }







class Vis extends StatefulWidget {
  final String title;

  Vis({Key key, this.title}) : super(key: key);

  @override
  _Vis createState() => _Vis();
}

bool widgetVisible = true ;
class ChildWidget extends StatefulWidget {
  @override
  StateChildWidget createState() => StateChildWidget();
}


class StateChildWidget extends State<ChildWidget> {

  int wrongcounter = 0;
  int rightcounter = 0;

  List colors = [Colors.red, Colors.blue];
  Random random = new Random();
  int index = 0;

  void Wrong(){
    wrongcounter = wrongcounter + 1;
  }

  void Right(){
    rightcounter = rightcounter + 1;
  }
  void Over(){
    if (wrongcounter == 3){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameOver()
    ),
      );
    }
  }
  void changeIndex() {
    setState(() => index = random.nextInt(2));
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Expanded(child: Container(
              height: 200,
              width: 400,
              color: colors[index],
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Center(child: Text('X',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,
                      fontSize: 24)))
          ),
          ),



        RaisedButton(
          child: Text('Blue'),
          onPressed: (){
            if(colors[index] == Colors.blue){
              Right();
            }
            else{
              Wrong();
              Over();
            }
            changeIndex();
          },
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(200, 10, 200, 10),
        ),
        RaisedButton(
          child: Text('Red'),
          onPressed: (){
            if(colors[index] == Colors.red){
              Right();
            }
            else{
              Wrong();
              Over();
            }
            changeIndex();
            },
          color: Colors.red,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(200, 10, 200, 10),
        ),

      ],
    );
  }
}



class _Vis extends State<Vis> {


  @override
  Widget build(BuildContext context) {
    // The green box goes here with some other Widgets.
    final title = 'Tile Clicker';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: Center(

        child: ChildWidget(),
          ),
        ),

      ),
    );
  }
  }

class GameOver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Over'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Game Over',
          style: TextStyle(fontSize: 50),
          ),
          RaisedButton(
              child: Text('Return to Home'),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              padding: new EdgeInsets.all(25.0),
              onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
          )
        ],
        ),
      ));
  }
}
//class Game extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {

//  }
 // }




