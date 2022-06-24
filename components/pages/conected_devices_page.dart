import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:flutter/material.dart';

class ConectedDevicesPage extends StatelessWidget {
  const ConectedDevicesPage({Key? key}) : super(key: key);

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
                      text : 'DISPOSITIVOS',
                      bell : true,
                      menu : true
                    ),
                  //),
                    Devices()
                ]),
            ),
        )
      )
    );
  }
}

class Devices extends StatelessWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Container(
      padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
      //height  : MediaQuery.of(context).size.height * 0.82,
      //width   : MediaQuery.of(context).size.width,
      color   : Colors.white,
      child   : Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment : CrossAxisAlignment.center,
            mainAxisAlignment  : MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.phone_android_sharp,
                size: 60,
              ),
              Column(
                children: [
                  Row(children : const [Text('data')]),
                  Row(children : const [Text('data')])
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete_sharp,
                  size: 30,
                ),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.monitor,
                size: 60,
              ),
              Column(
                children: [
                  Row(children: const [Text('data')]),
                  Row(children: const [Text('data')])
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete_sharp,
                size: 30,
                ),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.tablet_mac,
              size: 60,
              ),
              Column(
                children: [
                  Row(children : const [Text('data')]),
                  Row(children : const [Text('data')])
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete_sharp,
                size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          const Text('Tiene 3 dispositivos vinculados')
        ],
      ),

    );
  }
}