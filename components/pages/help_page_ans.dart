import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({Key? key, required this.helpItem}) : super(key: key);
  final HelpItem helpItem;

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  bool isDropDownOpened = true;

  late TextEditingController controller;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const MyAppBar(appBarName: "CONTACTO"),
        //body: SizedBox(
        body: Container(
          //height: MediaQuery.of(context).size.height,
          color: Colors.white,
          //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.helpItem.title,
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          "\nCaso cerrado ${(context.watch<MenuProvider>().allHelp.indexOf(widget.helpItem) + 1).toString()}/${context.watch<MenuProvider>().allHelp.length}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(widget.helpItem.description),

                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Respuesta",
                        style: TextStyle(fontSize: 18),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                          "Buenos días, Un gusto atenderte  texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto"),
                      // TODO: MAKE THE CUPPERTINO FIELD TO GET THE NEW ANS AND ADD THE BUTTONS
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Responder",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CupertinoTextField(
                        cursorColor: const Color(0xFF154579),
                        controller: controller,
                        keyboardType: TextInputType.text,
                        decoration: BoxDecoration(
                            //color        : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              width: 2.0,
                              color: const Color(0xFF0C4F83),
                            )),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        maxLines: 3,
                        //prefix: CupertinoButton(
                        //  child: const Icon(
                        //      CupertinoIcons.text_bubble),
                        //  onPressed: () {},
                        //),
                        suffix: CupertinoButton(
                          child: const Icon(
                            Icons.send_sharp,
                            color: Color(0xFF154579),
                          ),
                          //onPressed: () => controller.clear(),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF1A477C),
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                          ),
                          child: const Text(
                            'RESUELTO',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            // context.read<MenuProvider>().addHelpItem(
                            //       accountAdd: HelpItem(
                            //         title: context.read<MenuItems>().hintName,
                            //         description: controller.text,
                            //         date: DateTime.now(),
                            //       ),
                            //     );
                            //context.
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
