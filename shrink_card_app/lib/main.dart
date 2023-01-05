import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                card1(),
                SizedBox(height: 50),
                card2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack card1() {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth / 0.4,
              height: 200,
              child: Card(
                shadowColor: Colors.grey.shade700,
                elevation: 7.0,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: constraints.maxWidth / 2,
                        height: 50,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 80),
                      Container(
                        width: constraints.maxWidth / 0.9,
                        height: 40,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Stack card2() {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth / 0.4,
              height: 200,
              child: Stack(
                children: [
                  Card(
                    shadowColor: Colors.grey.shade700,
                    elevation: 7.0,
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 80),
                          Container(
                            width: constraints.maxWidth / 0.9,
                            height: 40,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 38.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 200,
                        height: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
