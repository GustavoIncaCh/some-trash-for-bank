import 'dart:async';

import 'package:bank9780/assets/data_list/list_record_page.dart';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/modals/record_list_modal.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  DateTime dayToday = DateTime.now();
  List<DateTime> currentDate = [
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  ];
  late List<HistoryItem> historysItems;
  late List<HistoryItem> historysItemsHelper;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  String? selectedValue;
  String query = '';
  //final  _textFieldController = StreamController<String>();

  @override
  void initState() {
    super.initState();
    historysItems = allHistory;
    historysItemsHelper = allHistory;
  }

  void getMinMax() {
    DateTime dateCompare = historysItemsHelper.first.date;
    for (var element in historysItemsHelper) {
      if (element.date.isBefore(dateCompare)) dateCompare = element.date;
    }
    currentDate[0] = dateCompare;

    dateCompare = historysItemsHelper.first.date;
    for (var element in historysItemsHelper) {
      if (element.date.isAfter(dateCompare)) dateCompare = element.date;
    }
    currentDate[1] = dateCompare;
  }

  Future<void> searchhistory(String query) async {
    final historys = allHistory.where((history) {
      final titleLower = history.type.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower.toLowerCase());
    }).toList();
    setState(() {
      this.query = query;
      historysItems = historys;
    });
  }

  Future<void> searchdate(DateTime since, DateTime until) async {
    final historys = historysItemsHelper.where((history) {
      DateTime compare =
          DateTime(history.date.year, history.date.month, history.date.day);
      debugPrint(compare.toString());
      print("since  "+compare.isAtSameMomentAs(since).toString() );
      print("until  "+compare.isAtSameMomentAs(until).toString() );
      return (history.date.isAfter(since) && history.date.isBefore(until)) ||
          compare.isAtSameMomentAs(since) ||
          compare.isAtSameMomentAs(until);
    }).toList();
    setState(() {
      historysItems = historys;
    });
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
      if (dateState == 0 && pickedDate.isBefore(currentDate[1])) {
        setState(
          () {
            currentDate[dateState] = pickedDate;
            if (dateState == 0) {
              searchdate(currentDate[dateState], currentDate[1]);
            } else {
              searchdate(currentDate[0], currentDate[dateState]);
            }
          },
        );
      } else if (dateState == 1 && pickedDate.isAfter(currentDate[0])) {
        setState(
          () {
            currentDate[dateState] = pickedDate;
            if (dateState == 0) {
              searchdate(currentDate[dateState], currentDate[1]);
            } else {
              searchdate(currentDate[0], currentDate[dateState]);
            }
          },
        );
      }
    }
  }

  // ignore: todo
  // TODO: CHANGE THE STREAM - IT MUST BE CALLED FROM THE API
  Stream<HistoryItem> generateNumbers = (() async* {
    await Future<void>.delayed(const Duration(seconds: 2));

    for (int i = 1; i <= 10; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield allHistory[i];
    }
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        appBarName: 'HISTORIAL',
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
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
                  iconEnabledColor: Colors.white,
                  buttonPadding: const EdgeInsets.only(right: 14, left: 14),
                  disabledHint: null,
                  //autofocus: false,
                  hint: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Tipo",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  dropdownElevation: 4,
                  items: ItemMenus.historialPageButtons
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
                  onChanged: (value) {
                    /// Call the function to compare the type of the historyItem
                    /// with the DropButton item to filter the boxes of the list
                    value as ItemMenu;
                    //searchhistory(value.text);
                    // ignore: todo
                    // TODO: LOOK FOR A WAY TO CALL ASYNC FUNCT WITH setState
                    final historys = allHistory.where((history) {
                      final titleLower = history.type.toLowerCase();
                      final searchLower = value.text.toLowerCase();
                      return titleLower.contains(searchLower.toLowerCase());
                    }).toList();
                    setState(() {
                      query = value.text;
                      historysItems = historys;
                      historysItemsHelper = historys;
                    });
                    getMinMax();
                  },
                  selectedItemBuilder: (BuildContext context) =>
                      ItemMenus.historialPageButtons
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Row(
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
                    onPressed: () {
                      _selectDate(context, 0);
                    },
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
                    onPressed: () {
                      _selectDate(context, 1);
                      //searchdate(currentDate[0], currentDate[1]);
                    },
                    icon: const Icon(
                      Icons.calendar_today_rounded,
                      color: Color(0xFF1A477C),
                    ),
                  ),
                ],
              ),
            ),
            // StreamVuilder, get condition from the API to call the actions to do
            StreamBuilder<HistoryItem>(
              stream: generateNumbers,
              //initialData: historysItems[0],
              builder: (
                BuildContext context,
                AsyncSnapshot<HistoryItem> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width * 0.925,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xFF154579),
                    )),
                  );
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 0.925,
                      child: ListView.builder(
                        itemCount: historysItems.length,
                        /// here we have the list of HistoryItems called allHistory
                        /// and its list index we can acces all the list here
                        /// List of historyItems is placed in "list_record_page.dart"
                        itemBuilder: (context, index) {
                          final history = historysItems[index];
                          /// create the items of the list
                          return ExpandableNotifier(
                            child: ScrollOnExpand(
                              child: Column(
                                children: [
                                  Builder(
                                    builder: (context) {
                                      var controller = ExpandableController.of(
                                          context,
                                          required: true)!;
                                      return Expandable(
                                        //controller: ExpandableController(initialExpanded: true),
                                        collapsed: HistoryButton(
                                          context: context,
                                          dateFormat: dateFormat,
                                          historyItems: history,
                                          controller: controller,
                                        ),
                                        expanded: Column(
                                          children: [
                                            HistoryButtonExpanded(
                                              context: context,
                                              dateFormat: dateFormat,
                                              historyItems: history,
                                              controller: controller,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
