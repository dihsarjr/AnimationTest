import 'package:flutter/material.dart';

class AnimationList extends StatefulWidget {
  const AnimationList({Key? key}) : super(key: key);

  @override
  _AnimationListState createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList>
    with TickerProviderStateMixin {
  Tween<Offset> tweenOffset = Tween(begin: Offset(1, 1), end: Offset(0, 0));
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List list = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    158,
    19,
    20,
    2,
    1,
    23,
    2,
    2,
    1,
    455,
    5,
    5,
    5,
    5,
    58,
  ];
  List listOne = [];
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      for (int i = 0; i < list.length; i++) {
        await Future.delayed(Duration(milliseconds: 150)).then((value) {
          listOne.add(list[i]);
          listKey.currentState!.insertItem(listOne.length - 1);
        });
        print(i);
      }
    });

    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedList(
        key: listKey,
        initialItemCount: 0,
        itemBuilder: (BuildContext context, i, Animation<double> animation) {
          return SlideTransition(
            position: animation.drive(tweenOffset),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 50,
                color: Colors.red,
                margin: EdgeInsets.only(top: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
