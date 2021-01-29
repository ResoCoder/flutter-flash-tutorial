import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Go to the Flash page'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FlashPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FlashPage extends StatefulWidget {
  @override
  _FlashPageState createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              child: Text('Show Toast'),
              onPressed: () async {
                // TODO: Show toast
              },
            ),
            RaisedButton(
              child: Text('Show Snackbar'),
              onPressed: () {
                // TODO: Show snackbar
              },
            ),
            RaisedButton(
              child: Text('Show Dialog'),
              onPressed: () {
                // TODO: Show dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}
