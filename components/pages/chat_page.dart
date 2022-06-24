import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //body: SizedBox(
        body: SafeArea(
          child: ClipRRect(
            borderRadius : const BorderRadius.all(Radius.circular(20)),
            child        : Container(
              color : Colors.white,
              child : Column(
                children: const [
                  // Container(
                  //   color: const Color(0xFF154579),
                  //   height : MediaQuery.of(context).size.height * 0.1,
                  //   width  : MediaQuery.of(context).size.width,
                  //   child  :
                    NavigatorWidget(
                      body : true,
                      logo : false,
                      text : 'COBROS',
                      bell : true,
                      menu : true
                    ),
                  //),
                  Expanded(child: Chat())
                ]),
            ),
        )
      )
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}