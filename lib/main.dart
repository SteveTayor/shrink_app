// ignore_for_file: deprecated_member_use
// import 'dart:ui';

import 'package:dummy_app/pages/home.dart';
import 'package:dummy_app/pages/new_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Budget UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orangeAccent,
        textTheme: const TextTheme(
          caption: TextStyle(
            color: Colors.black87,
            decoration: TextDecoration.none,
          ),
          button: TextStyle(
            color: Colors.teal,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _pressedOrNot = 'You have not pressed the button';

  void _changeText() {
    setState(() {
      _getNewText();
    });
  }

  void _getNewText() {
    _pressedOrNot = 'You have pressed a button';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            child: imageShow(),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(_pressedOrNot),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => const NewHomePage(),
              //   ),
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePage(),
                ),
              );
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text(
                  'Let\'s start our bugdet',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        tooltip: 'change Text',
        onPressed: _changeText,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

Image imageShow() {
  return Image.asset(
    'assets/images/positive.png',
  );
}
