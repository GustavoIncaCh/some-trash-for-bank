import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding : MediaQuery.of(context).padding * 1.2,
          //EdgeInsets.symmetric(vertical: 40),
          height  : MediaQuery.of(context).size.height * 0.104,
          width   : MediaQuery.of(context).size.width * 1,
          color   : const Color(0xFF1A477C),
      //decoration:
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Container(),
          Row(
            crossAxisAlignment : CrossAxisAlignment.center,
            mainAxisAlignment  : MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                //padding: EdgeInsets.symmetric(horizontal: 5),
                icon: const Icon(Icons.arrow_back_outlined,
                  color : Colors.white,
                  size  : 32,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                //padding: EdgeInsets.symmetric(horizontal: 15),
                height : MediaQuery.of(context).size.height * 0.06,
                width  : MediaQuery.of(context).size.width * 0.650,
                //color: Colors.black,
                // child: Image.asset(
                //   'lib/assets/img/Flag-of-Brazil-256.png',
                //   height: -255,
                //   width: -255,
                // ),
              ),
              IconButton(
                //padding: EdgeInsets.symmetric(horizontal: 35),
                icon: const Icon(Icons.notifications_none_outlined,
                  color : Colors.white,
                  size  : 32,
                ),
                onPressed: () {},
              ),
              IconButton(
                //padding: EdgeInsets.symmetric(horizontal: 16),
                icon: const Icon(Icons.menu_rounded,
                  color : Colors.white,
                  size  : 32,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
    elevation: 0,
    backgroundColor: const Color(0xFF154579),
    //Colors.lightBlue.shade900,
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
        //padding: const EdgeInsets.symmetric(horizontal: 2.0),
        icon: const Icon(
          Icons.arrow_back_outlined,
          size: 32,
        ),
        onPressed: () {},
      );
    }),
    title: const Text('9780BANKLOGO'),
    actions: <Widget>[
      IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        icon: const Icon(
          Icons.notifications_none_outlined,
          size: 32,
        ),
        onPressed: () {},
      ),
      IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        icon: const Icon(
          Icons.menu,
          size: 30,
        ),
        onPressed: () {},
      )
    ],
  ));
}
