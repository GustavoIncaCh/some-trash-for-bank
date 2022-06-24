import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';


import '../../modules/provider/operation_provider.dart';
import '../../services/api/call/forgot_pin.dart';

class ForgotPinPage extends StatefulWidget with InputValidationMixin{
  const ForgotPinPage({Key? key}) : super(key: key);

  @override
  State<ForgotPinPage> createState() => _ForgotPinPageState();
}

class _ForgotPinPageState extends State<ForgotPinPage>
with InputValidationMixin {
  
  final formGlobalKey = GlobalKey<FormState>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();
  TextEditingController controllerDni = TextEditingController();
  TextEditingController controllerCellphone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: SizedBox(
      appBar: const MyAppBar(appBarName: "OLVIDÉ MI PIN", isInside: false,),
      body: Form(
        key: formGlobalKey,
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          Container(
            //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            height: MediaQuery.of(context).size.height*0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 40,
                  child: Align(
                    child: Text(
                      'Ingrese su DNI',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF0A5F93),
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
                TextFormField(
                  controller: controllerDni,
                  onChanged: (value){
                    setState(() => value);
                      context.read<OperationProvider>().getForgottenPinDocument(forgottenPinDocument: value );
                  },
                  validator: (phone) => isDniValid(phone!)
                      ? null
                      : phone.isEmpty
                          ? "Debe indicar su número de DNI."
                          : "Ingrese valores validos.",
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 8,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF0A5F93),
                      ),
                    ),
                    labelText: 'DNI',
                    labelStyle: TextStyle(color: Color(0xFF0A5F93)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 40,
                  child: Align(
                    child: Text(
                      'Ingrese su número de celular',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF0A5F93),
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
                TextFormField(
                  controller: controllerCellphone,
                  onChanged: (value){
                    setState(() => value);
                      context.read<OperationProvider>().getForgottenPinPhone(forgottenPinPhone:value );
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    _phoneNumberFormatter,
                    //FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))
                  ],
                  validator: (phone) => isPhoneValid(phone!)
                      ? null
                      : phone.isEmpty
                          ? "Debe indicar su número de celular."
                          : "Ingrese valores validos.",
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF0A5F93),
                      ),
                    ),
                    labelText: 'Número de celular',
                    labelStyle: TextStyle(
                      color: Color(0xFF0A5F93),
                    ),
                    prefix: Text('+51'),
                    prefixStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF1A477C),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                      ),
                      child: const Text(
                        'ACEPTAR',
                        style: TextStyle(fontSize: 18),
                      ),
                      // ignore: todo
                      //TODO: add the alerts
                      onPressed: () async{
                        await ForgotPin.getForgottenPin(context);
                        if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            if (context.read<OperationProvider>().forgottenPin!.status==200){
                          debugPrint("Se realiza el cambio de pin");
                          showToast("Se realiza el cambio de pin",context          : context,
        backgroundColor  : Colors.blue.shade800,
        animation        : StyledToastAnimation.slideFromTopFade,
        reverseAnimation : StyledToastAnimation.slideToTopFade,
        animDuration     : const Duration(seconds: 1),
        duration         : const Duration(seconds: 4),
        curve            : Curves.elasticOut,
        reverseCurve     : Curves.elasticIn,);
                        }
                        else if(context.read<OperationProvider>().forgottenPin!.status==401){
                          debugPrint("El usuario no existe, verifique su DNI y número de celular");
                          showToast("El usuario no existe, verifique su DNI y número de celular",context          : context,
        backgroundColor  : Colors.blue.shade800,
        animation        : StyledToastAnimation.slideFromTopFade,
        reverseAnimation : StyledToastAnimation.slideToTopFade,
        animDuration     : const Duration(seconds: 1),
        duration         : const Duration(seconds: 4),
        curve            : Curves.elasticOut,
        reverseCurve     : Curves.elasticIn,);
                          debugPrint(context.read<OperationProvider>().forgottenPin!.status.toString());
                        }
                        else if (context.read<OperationProvider>().forgottenPin!.status==422){
                          showToast("Usuario no ingresado",
                          context          : context,
        backgroundColor  : Colors.blue.shade800,
        animation        : StyledToastAnimation.slideFromTopFade,
        reverseAnimation : StyledToastAnimation.slideToTopFade,
        animDuration     : const Duration(seconds: 1),
        duration         : const Duration(seconds: 4),
        curve            : Curves.elasticOut,
        reverseCurve     : Curves.elasticIn,);
                          debugPrint("Usuario no ingresado");
                          debugPrint(context.read<OperationProvider>().forgottenPin!.status.toString());
      //
                        }
                        else{
                          debugPrint("Error");
                          debugPrint(context.read<OperationProvider>().forgottenPin!.status.toString());

                        }
                          }
                        //Routes.registration1(context);
                        //Navigator.pushNamed(context, opt ['ruta']);
                      },
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
                        },
                        child: const Text('REGISTRARME')),
                  ],
                ),
              ],
            ),
          ),
        ]),
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
