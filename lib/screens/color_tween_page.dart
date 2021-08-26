import 'package:flutter/material.dart';

class ColorTweenPage extends StatefulWidget {
  const ColorTweenPage({Key? key}) : super(key: key);

  @override
  _ColorTweenPageState createState() => _ColorTweenPageState();
}

class _ColorTweenPageState extends State<ColorTweenPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;
  Animation? animationSize;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(animationController!);
    animationSize = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 30, end: 200), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 200, end: 30), weight: 50),
    ]).animate(animationController!);
    animationController!.forward();
    star = !star;
    super.initState();
  }

  bool star = true;

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: AnimatedBuilder(
                  builder: (context, _) {
                    return InkWell(
                        onTap: () {
                          if (star) {
                            animationController!.forward();
                          } else {
                            animationController!.reverse();
                          }
                          star = !star;
                        },
                        child: Icon(
                          Icons.star,
                          size: animationSize!.value,
                          color: animation!.value,
                        ));
                  },
                  animation: animationController!,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Hero(
              tag: "TweenColors",
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
