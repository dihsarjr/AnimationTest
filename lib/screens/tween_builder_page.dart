import 'package:flutter/material.dart';

class TweenBuilderPage extends StatefulWidget {
  const TweenBuilderPage({Key? key}) : super(key: key);

  @override
  _TweenBuilderPageState createState() => _TweenBuilderPageState();
}

class _TweenBuilderPageState extends State<TweenBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(seconds: 1),
                    child: Text(
                      "Tween Animation",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Opacity(
                        opacity: value,
                        child: Container(
                            height: 100,
                            width: value == 1 ? 100 : value * 200,
                            child: FittedBox(child: child!)),
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Hero(
              tag: "Tween",
              child: Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Go Back"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
