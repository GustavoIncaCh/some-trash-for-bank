import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/modals/help_list_modal.dart';
import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final listKey = GlobalKey<AnimatedListState>();

  List<DateTime> currentDate = [
    DateTime.now(),
    DateTime.now(),
  ];

  DateFormat dateFormat = DateFormat("dd/MM/yy");
  //late List<HelpItem> helpItems;

  @override
  void initState() {
    super.initState();
    //helpItems = allHelp;
  }

  Future<void> _selectDate(BuildContext context, int dateState) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        builder: (context, child) => Theme(
            data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
              primary: Color(0xFF1A477C),
            )),
            child: child!),
        initialDate: currentDate[dateState],
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate[dateState]) {
      setState(
        () {
          currentDate[dateState] = pickedDate;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: const MyAppBar(
          appBarName: 'CONTACTO',
        ),
        body: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.email_outlined,
                        size: 40,
                      ),
                      Text(' soporte@9780bank.com',
                          style: TextStyle(
                            fontSize: 15,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/logos/whatsapp.png',
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(' +51 986587456',
                          style: TextStyle(
                            fontSize: 15,
                          ))
                    ],
                  ),
                  Title(
                    color: Colors.black,
                    child: const Text(
                      'MENSAJERÍA',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF1A477C),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: const Text(
                      'NECESITO AYUDA',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Routes.questions(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Desde:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          dateFormat.format(currentDate[0]),
                        ),
                        IconButton(
                          onPressed: () => _selectDate(context, 0),
                          icon: const Icon(
                            Icons.calendar_today_rounded,
                            color: Color(0xFF1A477C),
                          ),
                        ),
                        const Text(
                          "Hasta:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          dateFormat.format(currentDate[1]),
                        ),
                        IconButton(
                          onPressed: () => _selectDate(context, 1),
                          icon: const Icon(
                            Icons.calendar_today_rounded,
                            color: Color(0xFF1A477C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.9,
                    //child: ListView.builder(
                    //  itemCount: helpItems.length,
                    //  itemBuilder: (context, index) {
                    //    final help = helpItems[index];
                    //    return HelpButton(
                    //        context: context,
                    //        dateFormat: dateFormat,
                    //        historyItems: help,
                    //    onClicked: () => removeItem(index),);
                    //  },
                    //),
                    child: AnimatedList(
                      key: listKey,
                      initialItemCount: context.watch<MenuProvider>().allHelp.length,
                      itemBuilder: (context, index, animation) =>

                          /// create the items of the list
                          HelpButton(
                        context: context,
                        dateFormat: dateFormat,
                        historyItems: context.watch<MenuProvider>().allHelp[index],
                        //listAccount: context.watch<MenuProvider>().allAccountProvider,
                        //ver esta wea
                        //onClicked: () => removeItem(index),
                        onClicked: () => removeItem(index),
                        animation: animation,
                      ),
                      //},
                      //),
                    ),
                  ),
                ],
              ),
            ),),);
  }
  void removeItem(int index) {
    int i=0;
    final removedItem = context.read<MenuProvider>().allHelp[index];
    context.read<MenuProvider>().allHelp.removeAt(index);
    if (listKey.currentState != null) {
      listKey.currentState!.removeItem(
        index,
        (context, animation) => HelpButton(
                            context: context,
                            dateFormat: dateFormat,
                            historyItems: removedItem,
                        onClicked: () => removeItem(index),
                        animation: animation,),
        duration: const Duration(milliseconds: 800),
      );
      //Navigator.of(context).pop;
      Navigator.of(context).popUntil((route) => i++>=1);
    }
  }
}