import 'package:flutter/material.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DropSwitch(),
      ),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue  : 'Panel $index',
      expandedValue: 'VALORIZAR EN',
    );
  });
}

// /// This is the stateful widget that the main application instantiates.
class DropSwitch extends StatefulWidget {
  const DropSwitch({Key? key}) : super(key: key);
  @override
  State<DropSwitch> createState() => _DropSwitchState();
}

// This is the private State class that goes with MyStatefulWidget.
class _DropSwitchState extends State<DropSwitch> {
  final List<Item> _data = generateItems(1);
  var _value = true;
  var _value1 = false;
  var _value2 = false;
  // widget that contains the space from listtile
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  // widget controller of expansion header
  Widget _buildPanel() {
    return ExpansionPanelList(
      expandedHeaderPadding:
          const EdgeInsets.symmetric(vertical: 2, horizontal: 22),
      dividerColor: Colors.black,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: const Color(0xFF0C4F83),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.expandedValue,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            );
          },
          body: Center(
            //AQUI SE MODIFICA EL DESPLEGABLE
            child: Column(
                verticalDirection: VerticalDirection.down,

                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SwitchListTile(
                    //contentPadding: MediaQuery.of(context).padding * 0.1,
                    activeColor: Colors.green,
                    tileColor: Colors.blue.shade100,
                    value: _value,
                    title: const Text('BTC',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: const Text('Bitcoin'),
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    //leading: Icon(Icons.account_balance_wallet),
                    //trailing: Icon(Icons.keyboard_arrow_down), onChanged: (bool value) {  },
                  ),
                  SwitchListTile(
                    activeColor: Colors.green,
                    tileColor: Colors.blue.shade100,
                    value: _value1,
                    title: const Text('S/.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: const Text('Soles'),
                    onChanged: (value) {
                      setState(() {
                        _value1 = value;
                      });
                    },
                    //leading: Icon(Icons.account_balance_wallet),
                    //trailing: Icon(Icons.keyboard_arrow_down), onChanged: (bool value) {  },
                  ),
                  SwitchListTile(
                    activeColor: Colors.green,
                    tileColor: Colors.blue.shade100,
                    value: _value2,
                    title: const Text('USD',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: const Text('Dólares'),
                    onChanged: (value) {
                      setState(() {
                        _value2 = value;
                      });
                    },
                    //leading: Icon(Icons.account_balance_wallet),
                    //trailing: Icon(Icons.keyboard_arrow_down), onChanged: (bool value) {  },
                  ),
                ]),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
