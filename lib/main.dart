import 'package:flutter/material.dart';
import 'package:vpn_app/utils.dart';
import 'custom_clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: bgColor,
        body: ListView(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                upperCurvedContainer(context),
                circularButtonWidget(context, screenWidth),
              ],
            ),
            SizedBox(height: screenWidth * 0.40),
            connectedStatusText(),
            SizedBox(height: 20),
            // We need to pass parameters to this widget
            locationCard('Random Location',Colors.transparent,kenyaFlagUrl,'Kenya'),

            SizedBox(height: 20),

            locationCard('Select Location', Colors.indigo[100], ugandaFlagUrl, 'Uganda'),

          ],
        ));
  }
}

Widget upperCurvedContainer(BuildContext context) {
  return ClipPath(
    clipper: MyCustomClipper(),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 36),
      height: 320,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: curveGradient,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topRow(),
          Text('Satelite VPN', style: vpnStyle),
          _bottomRow(),
        ],
      ),
    ),
  );
}

Widget _topRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            Image.asset('assets/premiumcrown.png', height: 36),
            SizedBox(width: 12),
            Text(
              'Go Premium',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.tune,
            size: 26,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}

Widget _bottomRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        'Upload\n546 kb/s',
        style: txtSpeedStyle,
      ),
      Text(
        'Download\n32 mb/s',
        style: txtSpeedStyle,
      ),
    ],
  );
}

Widget circularButtonWidget(BuildContext context, width) {
  return Positioned(
    bottom: -width * 0.36,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: width * 0.51,
          width: width * 0.51,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: curveGradient,
            // color: Colors.red,
          ),
          child: Center(
            child: Container(
              height: width * 0.4,
              width: width * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
              child: Center(
                child: Container(
                  height: width * 0.3,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: greenGradient,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0XFF00D58D).withOpacity(.2),
                          spreadRadius: 15,
                          blurRadius: 15,
                        ),
                      ]),
                  child: Center(
                    child: Icon(Icons.wifi_lock, color: Colors.white, size: 50),
                  ),
                ),
              ),
            ),
          ),
        ),

        //top left widget
        Positioned(
          left: 8,
          top: 30,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 60,
            width: 60,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(kenyaFlagUrl),
                radius: 40,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget connectedStatusText() {
  return Align(
    alignment: Alignment.center,
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(text: 'Status :', style: connectedStyle, children: [
        TextSpan(text: ' connected\n', style: connectedGreenStyle),
        TextSpan(text: '00:22:45', style: connectedSubtitle),
      ]),
    ),
  );
}

Widget locationCard(title,cardBgColor,flag,country) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: locationTitleStyle),
        SizedBox(height: 14.0),
        Container(
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cardBgColor,
            border: Border.all(
              color: Color(0XFF9BB1BD),
              style: BorderStyle.solid,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20,
                backgroundImage: NetworkImage(flag),
              ),
              title: Text(
                country,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                Icons.refresh,
                size: 28,
                color: Colors.white70,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
