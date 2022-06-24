import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class FingerprintTermsPage extends StatefulWidget {
  const FingerprintTermsPage({Key? key}) : super(key: key);

  @override
  State<FingerprintTermsPage> createState() => _FingerprintTermsPageState();
}

class _FingerprintTermsPageState extends State<FingerprintTermsPage> {
  bool showTemrs = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //body: SizedBox(
      appBar: const MyAppBar(appBarName: "HUELLA DIGITAL"),
      body: Container(
        padding:
            const EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('TÉRMINOS Y CONDICIONES'),
              const SizedBox(height: 25,),
              showTemrs ? SizedBox(
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width*0.85,
                // ignore: todo
                // TODO: ADD THE STREAMBUILDER HERE WITH THE SECONDS CONDITION
                child: ListView(
                  children: const [
                    Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ''')
                  ],
                ),
              ) : const Text("data"),
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF1A477C),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: const Text(
                        'ACEPTAR',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        showTemrs = !showTemrs;
                      },),
                  OutlinedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                        primary: const Color(0xFF1A477C)),
                    child: const Text('CANCELAR'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}