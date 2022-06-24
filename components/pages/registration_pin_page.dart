import 'package:bank9780/components/widgets/header_widget.dart';
import 'package:bank9780/components/widgets/pin_board_widget.dart';
import 'package:bank9780/modules/general/enum.dart';

import 'package:flutter/material.dart';

class PinRegister extends StatefulWidget {
  ///  Pin Page
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const PinRegister({Key? key}) : super(key: key);

  @override
  _PinRegisterState createState() => _PinRegisterState();
}

class _PinRegisterState extends State<PinRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          const HeaderWidget(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Text(
              'Ingresa tu PIN para confirmar la transacción',
              // style: Skin.textStyle(1, true, 24),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: PinBoardWidget(process: Process.login),
          )
        ]
      )
    );
  }
}





// class RegistrationPin extends StatefulWidget {
//   const RegistrationPin({Key? key}) : super(key: key);

//   @override
//   _RegistrationPinState createState() => _RegistrationPinState();
// }

// class _RegistrationPinState extends State<RegistrationPin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xFF1A477C),
//         title: const Text('PIN'),
//         leading: Builder(builder: (BuildContext context) {
//           return IconButton(
//             icon: const Icon(Icons.arrow_back_outlined),
//             onPressed: () {},
//           );
//         }),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           //mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Text(
//               'Elegir 6 dígitos para la creación de su PIN:',
//               style: TextStyle(fontSize: 16),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '1',
//                     )),
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '2',
//                     )),
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '3',
//                     )),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '1',
//                     )),
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '2',
//                     )),
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '3',
//                     )),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '1',
//                     )),
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '2',
//                     )),
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '3',
//                     )),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         padding: const EdgeInsets.symmetric(horizontal: 40),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '1',
//                     )),
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         padding: const EdgeInsets.symmetric(horizontal: 40),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '2',
//                     )),
//                 OutlinedButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF1A477C),
//                         padding: const EdgeInsets.symmetric(horizontal: 40),
//                         textStyle: const TextStyle(
//                           decoration: TextDecoration.none,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         primary: Colors.white),
//                     onPressed: () {},
//                     child: const Text(
//                       '3',
//                     )),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
