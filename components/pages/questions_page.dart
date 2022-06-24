import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/button_list_route.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  bool isDropDownOpened = true;
  late TextEditingController controller;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(appBarName: "CONTACTO"),
        //body: SizedBox(
        body: Container(
          color: Colors.white,
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    //height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            '¿En qué te podemos Ayudar?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ButtonListRoute(
                              buttonName: context.watch<ItemMenus>().hintName,
                              menuListItems: ItemMenus.questionsPage,
                            ),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              //height: MediaQuery.of(context).size.height * 0.5,
                              child: Column(
                                children: [
                                  const Align(
                                    child: Text(
                                      'Escribenos tu problema:',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    alignment: Alignment.bottomLeft,
                                  ),
                                  CupertinoTextField(
                                    controller: controller,
                                    keyboardType: TextInputType.text,
                                    cursorColor: const Color(0xFF154579),
                                    decoration: BoxDecoration(
                                        //color        : Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                          width: 2.0,
                                          color: const Color(0xFF0C4F83),
                                        )),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    maxLines: 5,
                                    //prefix: CupertinoButton(
                                    //  child: const Icon(
                                    //      CupertinoIcons.text_bubble),
                                    //  onPressed: () {},
                                    //),
                                    //suffix: CupertinoButton(
                                    //  child: const Icon(CupertinoIcons.clear),
                                    //  onPressed: () => controller.clear(),
                                    //),
                                  )
                                ],
                              )),
                          const SizedBox(height: 150),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF1A477C),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                            ),
                            child: const Text(
                              'ENVIAR',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              context.read<MenuProvider>().addHelpItem(
                                    accountAdd: HelpItem(
                                      title: context.read<ItemMenus>().hintName,
                                      description: controller.text,
                                      date: DateTime.now(),
                                    ),
                                  );
                              Navigator.pop(context);
                            },
                          ),
                        ])),
              ]),
        ));
  }
}
