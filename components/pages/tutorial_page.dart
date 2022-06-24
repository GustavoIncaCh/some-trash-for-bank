import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  late VideoPlayerController _controller;
  late Future<void> _video;

  bool isDropDownOpened = true;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _video = _controller.initialize();
    //_list = ["¿Cómo comprar criptomonedas?", "¿Cómo comprar criptomonedas?", "¿Cómo comprar criptomonedas?", "¿Cómo comprar criptomonedas?"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(appBarName: "TUTORIALES"),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(
              width: 325,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  buttonDecoration: BoxDecoration(
                    color: const Color(0xFF1A477C),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  dropdownDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    border: Border(),
                  ),
                  isExpanded: true,
                  //scrollbarThickness: 6,
                  iconEnabledColor: Colors.white,
                  buttonPadding: const EdgeInsets.only(right: 14, left: 14),
                  disabledHint: null,
                  //autofocus: false,
                  hint: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Seleccionar video",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  dropdownElevation: 4,
                  items: ItemMenus.agenciesPage
                      .map(
                        (item) => DropdownMenuItem<ItemMenu>(
                          value: item,
                          child: Text(
                            item.text,
                            style: const TextStyle(
                                backgroundColor: Colors.transparent,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) async {
                    value as ItemMenu;
                  },
                  selectedItemBuilder: (BuildContext context) =>
                      ItemMenus.agenciesPage
                          .map(
                            (e) => Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e.text,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(
              color: Color(0xFF0C4F83),
              height: 2,
              thickness: 2,
            ),
            FutureBuilder(
                future: _video,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            VideoProgressIndicator(_controller, allowScrubbing: true),
            const Divider(
              color: Color(0xFF0C4F83),
              height: 4,
              thickness: 2,
            ),
            IconButton(
                icon: const Icon(
                  Icons.play_circle_filled_outlined,
                  size: 35,
                ),
                onPressed: () {
                  if (_controller.value.isPlaying) {
                    setState(() {
                      _controller.pause();
                    });
                  } else {
                    setState(() {
                      _controller.play();
                    });
                  }
                }),
            const Divider(
              color: Color(0xFF0C4F83),
              height: 5,
              thickness: 2,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      decoration: TextDecoration.none, fontSize: 16),
                  primary: const Color(0xFF0A557A),
                ),
                child: const Text(
                  'Preguntas Frecuentes',
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  //Routes.referralsRec(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
