import 'package:animation_test/screens/color_tween_page.dart';
import 'package:animation_test/screens/tween_builder_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "Tween",
              child: Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (ctx) => TweenBuilderPage(),
                      ),
                    );
                  },
                  child: Text("Tween Builder Animation"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Hero(
              tag: "TweenColors",
              child: Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (ctx) => ColorTweenPage(),
                      ),
                    );
                  },
                  child: Text("Tween Colors Animation"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
