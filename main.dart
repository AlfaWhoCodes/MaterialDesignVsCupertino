import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return !Platform.isIOS
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter App',
            home: materialWidget(title: 'Material App'),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter App',
            home: cupertinoWidget(title: 'Cupertino App'));
  }
}

enum Overflow { OPTION_A, OPTION_B }

class cupertinoWidget extends StatefulWidget {
  const cupertinoWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<cupertinoWidget> createState() => _cupertinoWidgetState(title);
}

class _cupertinoWidgetState extends State<cupertinoWidget> {
  late String title;
  _cupertinoWidgetState(String title) {
    this.title = title;
  }

  bool light = false;
  final materialTheme = ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: CupertinoButton(
                      onPressed: () {
                        _confirmDeleteCupertinoAlertDialog();
                      },
                      child: const Text(
                        'Cupertino Dialog box',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Container(
                  child: CupertinoButton(
                      onPressed: () {
                        _getCupertinoBar();
                      },
                      child: const Text(
                        'Cupertino Bottom Sheet ',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Text('Cupertino Switch'),
                SizedBox(
                  height: 12,
                ),
                CupertinoSwitch(
                  value: light,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ],
            )),
      ),
    );
  }

  Future<void> confirmDeleteMaterialDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete File'),
          content: const Text('Are you sure you want to delete the file?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _confirmDeleteCupertinoAlertDialog() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("Delete File"),
            content: const Text("Are you sure you want to delete the file?"),
            actions: [
              CupertinoDialogAction(
                  child: const Text("Yes"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CupertinoDialogAction(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  _getCupertinoBar() {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  child: const Text('Option A'),
                  onPressed: () {
                    // Perform action.
                    Navigator.pop(context);
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text('Option B'),
                  onPressed: () {
                    // Perform action.
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}

class materialWidget extends StatefulWidget {
  const materialWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<materialWidget> createState() => _materialWidgetWidgetState(title);
}

class _materialWidgetWidgetState extends State<materialWidget> {
  late String title;
  _materialWidgetWidgetState(String title) {
    this.title = title;
  }

  bool light = false;
  final materialTheme = ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Material App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  //    _getMaterialBar();
                  _confirmDeleteMaterialDialog(context);
                },
                child: const Text(
                  'Show Material Dialog box',
                ),
              ),
              MaterialButton(
                onPressed: () {
                  //    _getMaterialBar();
                  _getMaterialBar();
                },
                child: const Text(
                  'Show Material Bottom Sheet',
                ),
              ),
              Text(
                'Material Switch',
                style: TextStyle(fontSize: 18),
              ),
              Switch(
                value: light,
                activeColor: Colors.red,
                onChanged: (bool value) {
                  setState(() {
                    light = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDeleteMaterialDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete File'),
          content: const Text('Are you sure you want to delete the file?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _getMaterialBar() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: const Color.fromARGB(255, 247, 247, 247),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                const ListTile(
                  title: Text('Option A'),
                ),
                const ListTile(
                  title: Text('Option B'),
                ),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
