import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangeNumberPage extends StatefulWidget with InputValidationMixin {
  const ChangeNumberPage({Key? key}) : super(key: key);

  @override
  State<ChangeNumberPage> createState() => _ChangeNumberPageState();
}

class _ChangeNumberPageState extends State<ChangeNumberPage>
    with InputValidationMixin {
  String dni = "";
  String numberA = "";
  String numberN = "";
  //final myController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController controllerDni = TextEditingController();
  TextEditingController controllerCellphone = TextEditingController();
  TextEditingController controllerNewCellphone = TextEditingController();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(appBarName: "MIS DATOS"),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.9,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Form(
              key: formGlobalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "CAMBIAR NÚMERO",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const Text(
                    "DNI",
                    style: TextStyle(
                      color: Color(0xFF0A5F93),
                    ),
                  ),
                  TextFormField(
                    validator: (dni) => isDniValid(dni!)
                        ? null
                        : dni.isEmpty
                            ? "Debe indicar su número de DNI."
                            : "Ingrese valores validos.",
                    controller: controllerDni,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      //labelText: "Ingrese su DNI",
                      hintText: "Ingrese su DNI",
                    ),
                  ),
                  const Text(
                    "NÚMERO DE CELULAR ACTUAL",
                    style: TextStyle(
                      color: Color(0xFF0A5F93),
                    ),
                  ),
                  TextFormField(
                    validator: (phone) => isPhoneValid(phone!)
                        ? null
                        : phone.isEmpty
                            ? "Debe indicar su número de celular."
                            : "Ingrese valores validos.",
                    controller: controllerCellphone,
                    keyboardType: TextInputType.phone,
                  maxLength: 11,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    _phoneNumberFormatter,
                    //FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))
                  ],
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      //labelText: "Ingrese su número de celular actual",
                      hintText: "Ingrese su número de celular actual",
                    ),
                  ),
                  const Text(
                    "NÚMERO DE CELULAR NUEVO",
                    style: TextStyle(
                      color: Color(0xFF0A5F93),
                    ),
                  ),
                  TextFormField(
                    validator: (phone) => isPhoneValid(phone!)
                        ? null
                        : phone.isEmpty
                            ? "Debe indicar su número de celular."
                            : "Ingrese valores validos.",
                    controller: controllerNewCellphone,
                    keyboardType: TextInputType.phone,
                  maxLength: 11,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    _phoneNumberFormatter,
                    //FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))
                  ],
                    //keyboardAppearance: Brightness.dark,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      //labelText: "Ingrese su número de celular nuevo",
                      hintText: "Ingrese su número de celular nuevo",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //_printLatestValue();
                            if (formGlobalKey.currentState!.validate()) {
                              Routes.videocallwebview(context);
                            }
                          },
                          child: const Text(
                            'ACEPTAR',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF1A477C),
                            padding: const EdgeInsets.symmetric(horizontal: 35),
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
                            onPressed: () {
                              //routes.tutorial(context);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'CANCELAR',
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

mixin InputValidationMixin {
  bool isPhoneValid(String phone) {
    // the validation was done with 11 because the class _UsNumberTextInputFormatter
    // is adding two blank spaces ' ' to the string phoneNumber
    if (phone.length < 11) return false;
    return true;
  }

  bool isDniValid(String phone) {
    // the validation was done with 11 because the class _UsNumberTextInputFormatter
    // is adding two blank spaces ' ' to the string phoneNumber
    if (phone.length < 8) return false;
    return true;
  }
}

class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ' ');
      if (newValue.selection.end >= 3) selectionIndex++;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + ' ');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
