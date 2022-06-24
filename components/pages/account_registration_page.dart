import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AccountRegistrationPage extends StatefulWidget {
  const AccountRegistrationPage({Key? key}) : super(key: key);

  @override
  State<AccountRegistrationPage> createState() =>
      _AccountRegistrationPageState();
}

class _AccountRegistrationPageState extends State<AccountRegistrationPage> {
  bool isDropDownOpened = false;
  String dropdownValue1 = 'INTERBANK';
  String dropdownValue2 = 'SOLES';
  List<String> listOne = ['INTERBANK', 'BANK2', 'BANK3', 'BANK4'];
  List<String> listTwo = ['SOLES', 'DÓLARES'];
  
  final formGlobalKey = GlobalKey<FormState>();

  final myControllerAlias = TextEditingController();
  final myControllerAccount = TextEditingController();
  final myControllerInterbank = TextEditingController();
  late List<AccountItem> accountItems;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myControllerAlias.dispose();
    myControllerAccount.dispose();
    myControllerInterbank.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomInset: false,
      appBar: const MyAppBar(appBarName: "MIS CUENTAS"),
      body: Form(
        key: formGlobalKey,
        child: ListView(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DropdownButtonFormField<String>(
                            value: dropdownValue1,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue1 = newValue!;
                              });
                            },
                            items: listOne
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: const TextStyle(
                                      color: Color(0xFF0A5F93),
                                    )),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF0A5F93),
                              )),
                              labelStyle: TextStyle(color: Color(0xFF0A5F93)),
                            ),
                          ),
                          DropdownButtonFormField<String>(
                            value: dropdownValue2,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue2 = newValue!;
                              });
                            },
                            items: listTwo
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: const TextStyle(
                                      color: Color(0xFF0A5F93),
                                    )),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF0A5F93),
                              )),
                              labelStyle: TextStyle(color: Color(0xFF0A5F93)),
                            ),
                          ),
                          TextFormField(
                            controller: myControllerAlias,
                            obscureText: false,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF0A5F93),
                              )),
                              labelText: 'Alias (Opcional)',
                              labelStyle: TextStyle(color: Color(0xFF0A5F93)),
                            ),
                            //validator: (alias) => alias!.isEmpty ? "Debes Ingresar un alias":null,
                          ),
                          TextFormField(
                            controller: myControllerAccount,
                            inputFormatters: [
                              //FilteringTextInputFormatter.allow(RegExp(r'0-9')),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF0A5F93),
                              )),
                              labelText: 'N° de Cuenta',
                              labelStyle: TextStyle(color: Color(0xFF0A5F93)),
                            ),
                            validator: (alias) => alias!.isEmpty ? "Debes Ingresar una cuenta":null,
                          ),
                          TextFormField(
                            controller: myControllerInterbank,
                            inputFormatters: [
                              //FilteringTextInputFormatter.allow(RegExp(r'0-9')),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF0A5F93),
                              )),
                              labelText: 'N° de Cuenta Interbancaria',
                              labelStyle: TextStyle(color: Color(0xFF0A5F93)),
                            ),
                            validator: (alias) => alias!.isEmpty ? "Debes Ingresar una cuenta interbancaria":null,
                          ),
                        ],
                      ),
                    ),
                    Consumer<MenuProvider>(
                      builder: (context, value, child) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF1A477C),
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                        ),
                        child: const Text(
                          'ACEPTAR',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          if  (formGlobalKey.currentState!.validate()){
                          context.read<MenuProvider>().addBankAccount(
                                accountAdd: AccountItem(
                                    name: myControllerAlias.text,
                                    type: dropdownValue2,
                                    accountNumber: myControllerAccount.text,
                                    interbankAccount: myControllerInterbank.text,
                                    bank: dropdownValue1),
                              );
                          Navigator.pop(context);
                          }
                        },
                      ),
                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
