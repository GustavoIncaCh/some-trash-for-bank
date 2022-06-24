import 'package:bank9780/components/widgets/valorization_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


/// This is the stateful widget that the main application instantiates.
class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _IntroductionPageState extends State<IntroductionPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A477C),
          elevation      : 0,
          leading        : Builder(builder: (BuildContext context) {
            return IconButton(
              //padding: const EdgeInsets.symmetric(horizontal: 2.0),
              icon: const Icon(Icons.arrow_back_outlined,
              size: 32,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }),
          title  : const Text('9780BANKLOGO'),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              icon   : const Icon(Icons.notifications_none_outlined,
              size   : 32,
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              icon   : const Icon(Icons.menu,
              size   : 30,
              ),
              onPressed: () {},
            )
          ],
        ),
        //extendBody: true,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin : Alignment.topCenter,
                    end   : Alignment.bottomCenter,
                    colors: <Color>[
                  Color(0xFF1A477C),
                  Color(0xFF33639C),
                  ]
                )
              ),
              height : MediaQuery.of(context).size.height * 0.835,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            Positioned(
              right : 1,
              left  : 1,
              top   : 1,
              bottom: 365,
              // width: 550,
              // height: 350,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 5),
                margin : const EdgeInsets.symmetric(vertical: 10),
                height : 220,
                width  : 400,
                //color: Color(0x00ffffff),
                child : const Balance(),
              )
            ),
            Positioned(
              right : 1,
              left  : 1,
              top   : 270,
              bottom: -92,
              // width: 550,
              // height: 350,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
                margin : const EdgeInsets.symmetric(vertical: 95),
                height : 220,
                width  : 400,
                color  : Colors.grey[50],
                child  : const ValueWidget(),
              )
            )
          ],
        ),

        // body: Column(children: <Widget>[
        //   Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        //       //color: Colors.black,
        //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //       height: 250,
        //       child: const Balance()
        //       //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //       //color: Colors.blue,
        //   ),
        //   Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        //       //color: Colors.black,
        //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //       height: 325,
        //       child: const ValueWidget()
        //       //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //       //color: Colors.blue,
        //   ),
        // ]),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.blue.shade100,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF154579),
              tooltip:
                  ("Realiza envios y recepciones en Criptomendas, Soles y Dólares."),
              icon: Icon(Icons.sync_alt),
              label: 'Operación',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF154579),
              tooltip:
                  ("Realiza Intercambios entre 2 diferentes Criptomonedas."),
              icon: Icon(Icons.attach_money),
              label: 'Intercambio',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF154579),
              tooltip:
                  ("Realiza Pagos de diferentes Servicios básicos desde tu App."),
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: 'Pago de Servicios',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF154579),
              tooltip: ("Compra y vende Criptomonedas, Soles y Dólares."),
              icon: Icon(Icons.real_estate_agent_outlined),
              label: 'Comprar - Vender',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ));
  }
}

class Balance extends StatelessWidget {
  const Balance({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        width : MediaQuery.of(context).size.width * 0.90,
        //color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          mainAxisSize      : MainAxisSize.max,
          children          : <Widget>[
            Container(
              height : MediaQuery.of(context).size.height * 0.30,
              //width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20),
              // color: Colors.grey,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border      : Border.all(
                  width: 2.0,
                  color: Colors.blue.shade100,
                )
              ),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children         : [
                  Text(('availableBalance'.tr()),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      //height: 1.5,
                      letterSpacing: 0.5,
                      fontSize     : 16,
                      fontWeight   : FontWeight.bold,
                      color        : Color(0xFF6BAFC6),
                      //textScaleFactor: ,
                    )),
                    Row(mainAxisSize: MainAxisSize.max,
                      //alignment: Alignment.topCenter,
                      children: const [
                        Expanded(
                          child    : Text('BTC',
                          textAlign: TextAlign.left,
                          style    : TextStyle(
                            //height: 2.6,
                            fontSize  : 20,
                            fontWeight: FontWeight.bold,
                            color     : Color(0xFF0A557A),
                          )),
                        ),
                        Expanded(
                          child    : Text('0.00000255',
                          textAlign: TextAlign.right,
                          style    : TextStyle(
                            //height: 2.6,
                            fontSize  : 20,
                            fontWeight: FontWeight.bold,
                            color     : Color(0xFF0A557A),
                          ),
                        ))
                      ]),
                  Row(mainAxisSize: MainAxisSize.max,
                    //alignment: Alignment.topCenter,
                    children: const [
                      Expanded(
                        child    : Text('S/.',
                        textAlign: TextAlign.left,
                        style    : TextStyle(
                          //height: 2.2,
                          fontSize  : 20,
                          fontWeight: FontWeight.bold,
                          color     : Color(0xFF0A557A),
                        ),
                      )),
                      Expanded(
                        child    : Text('1500.00',
                        textAlign: TextAlign.right,
                        style    : TextStyle(
                          //height: 1.5,
                          fontSize  : 20,
                          fontWeight: FontWeight.bold,
                          color     : Color(0xFF0A557A),
                        ),
                      ))
                    ]),
                  Row(mainAxisSize: MainAxisSize.max,
                    //alignment: Alignment.topCenter,
                    children: const [
                      Expanded(
                          child  : Text('USD',
                        textAlign: TextAlign.left,
                        style    : TextStyle(
                          //height: 1.5,
                          fontSize  : 20,
                          fontWeight: FontWeight.bold,
                          color     : Color(0xFF0A557A),
                        ),
                      )),
                      Expanded(
                        child    : Text('1500.00',
                        textAlign: TextAlign.right,
                        style    : TextStyle(
                          //height: 1.5,
                          fontSize  : 20,
                          fontWeight: FontWeight.bold,
                          color     : Color(0xFF0A557A),
                        ),
                      ))
                    ]),
                  Row(mainAxisSize: MainAxisSize.max,
                    //alignment: Alignment.topCenter,
                    children: const [
                      Expanded(
                        child    : Text('Altcoins Valorizadas',
                        textAlign: TextAlign.left,
                        style    : TextStyle(
                          //height: 1.5,
                          fontSize  : 18,
                          fontWeight: FontWeight.bold,
                          color     : Color(0xFF0A557A),
                        ),
                      )),
                      Expanded(
                        child    : Text('1500.00',
                        textAlign: TextAlign.right,
                        style    : TextStyle(
                          //height: 1.5,
                          fontSize  : 20,
                          fontWeight: FontWeight.bold,
                          color     : Color(0xFF0A557A),
                        ),
                      ))
                    ]
                  )
                ],
              ),
            ),
          ],
          )));
  }
}

// void showToast() => Fluttertoast.showToast(
//       msg: "HELLO BABY",
//       fontSize: 15,
//     );

// void cancelToast() {}
