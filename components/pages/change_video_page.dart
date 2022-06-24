import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:flutter/material.dart';

class ChangeVideoPage extends StatelessWidget {
  const ChangeVideoPage({ Key? key }) : super(key: key);

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
                      text : 'CAMBIAR VIDEO',
                      bell : true,
                      menu : true
                    ),
                  //),
                  Expanded(child: ChangeVideo()),
                ]),
            ),
        )
      )
    );
  }
}

class ChangeVideo extends StatelessWidget {
  const ChangeVideo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Para cambiar tu video, contáctate con nosotros.'),
          const SizedBox(height: 50,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary : const Color(0xFF1A477C),
              padding : const EdgeInsets.symmetric(horizontal: 20),
            ),
            child: const Text('INICIAR VIDEOLLAMADA',
            style: TextStyle(fontSize: 18),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}