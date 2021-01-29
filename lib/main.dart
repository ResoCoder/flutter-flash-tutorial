import 'package:flash/flash.dart';
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
                builder: (context) => Overlay(
                  initialEntries: [
                    OverlayEntry(
                      builder: (context) => FlashPage(),
                    ),
                  ],
                ),
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
  bool _isToastShown = false;

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
                if (_isToastShown) {
                  return;
                }

                _isToastShown = true;

                await showFlash(
                  context: context,
                  duration: const Duration(seconds: 4),
                  builder: (context, controller) {
                    return Flash.dialog(
                      controller: controller,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      backgroundGradient: LinearGradient(
                        colors: [Colors.indigo, Colors.deepPurple],
                      ),
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(bottom: 48),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'This is a toast',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                );

                _isToastShown = false;
              },
            ),
            RaisedButton(
              child: Text('Show Snackbar'),
              onPressed: () {
                showFlash(
                  context: context,
                  duration: const Duration(seconds: 4),
                  persistent: false,
                  builder: (context, controller) {
                    return Flash.bar(
                      controller: controller,
                      backgroundGradient: LinearGradient(
                        colors: [Colors.yellow, Colors.amber],
                      ),
                      position: FlashPosition.bottom,
                      enableDrag: true,
                      horizontalDismissDirection:
                          HorizontalDismissDirection.startToEnd,
                      margin: const EdgeInsets.all(8),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      forwardAnimationCurve: Curves.easeOutBack,
                      reverseAnimationCurve: Curves.slowMiddle,
                      child: FlashBar(
                        title: Text(
                          'You are seeing a snackbar!',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        message: Text('This is something'),
                        primaryAction: IconButton(
                          icon: Icon(Icons.ac_unit),
                          onPressed: () {},
                        ),
                        icon: Icon(
                          Icons.info,
                          color: Colors.black,
                        ),
                        shouldIconPulse: false,
                        showProgressIndicator: true,
                      ),
                    );
                  },
                );
              },
            ),
            RaisedButton(
              child: Text('Show Dialog'),
              onPressed: () {
                showFlash(
                  context: context,
                  // A dialog cannot be persistent - must be poppable.
                  persistent: false,
                  builder: (context, controller) {
                    return Flash.dialog(
                      controller: controller,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      margin: const EdgeInsets.all(8),
                      // Again, FlashBar is a perfect candidate for the child widget.
                      child: FlashBar(
                        message:
                            Text('This FlashBar looks like an AlertDialog.'),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              controller.dismiss();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
