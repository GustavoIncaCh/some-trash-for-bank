import 'dart:async';

import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

class CodeAccessPage extends StatelessWidget {
  const CodeAccessPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //body: SizedBox(
        body: SafeArea(
          child: ClipRRect(
            borderRadius : const BorderRadius.all(Radius.circular(20)),
            child        : Container(
              color : Colors.white,
              child : Column(
                children: const [
                  // Container(
                  //   color  : const Color(0xFF154579),
                  //   height : MediaQuery.of(context).size.height * 0.1,
                  //   width  : MediaQuery.of(context).size.width,
                  //   child  :
                    NavigatorWidget(
                      body : true,
                      logo : false,
                      text : 'INGRESAR',
                      bell : false,
                      menu : false
                    ),
                  //),
                  Expanded(child: SmsCode())
                ]),
            ),
        )
      )
    );
  }
}

class SmsCode extends StatefulWidget {
  const SmsCode({Key? key}) : super(key: key);

  // final String? phoneNumber;

  // const PinCodeVerificationScreen(this.phoneNumber);
  @override
  _SmsCodeState createState() =>
    _SmsCodeState();
}

class _SmsCodeState extends State<SmsCode> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
          onTap : () {},
          child : Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height : MediaQuery.of(context).size.height * 0.9,
            width  : MediaQuery.of(context).size.width,
            child  : ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const SizedBox(height: 30),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
                  child : Text('CÓDIGO DE SEGURIDAD',
                  style : TextStyle(
                    fontWeight : FontWeight.bold,
                    fontSize   : 18
                  ),
                  textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding : EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child   : Text("INGRESE CÓDIGO DE SEGURIDAD",
                    style: TextStyle(
                      color    : Colors.black54,
                      fontSize : 14
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                const Icon(Icons.lock,
                  size  : 70,
                  color : Color(0xFF154579),
                ),
                const SizedBox(height: 20),
                Form(
                  key   : formKey,
                  child : Padding(
                  padding :  const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child   : PinCodeTextField(
                    appContext      : context,
                    pastedTextStyle : TextStyle(
                      color      : Colors.green.shade600,
                      fontWeight : FontWeight.bold,
                    ),
                    length      : 6,
                    obscureText : false,
                    textStyle   : const TextStyle(color: Colors.white),
                    // obscuringCharacter: '*',
                    // obscuringWidget: const FlutterLogo(
                    //   size: 24,
                    // ),
                    blinkWhenObscuring : true,
                    animationType      : AnimationType.scale,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "Caracteres Incompletos";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape             : PinCodeFieldShape.box,
                      borderRadius      : BorderRadius.circular(5),
                      fieldHeight       : 45,
                      fieldWidth        : 35,
                      activeFillColor   : const Color(0xFF0C4F83),
                      inactiveFillColor : Colors.white,
                      selectedFillColor : Colors.black,
                      inactiveColor: const Color(0xFF0C4F83)
                    ),
                    cursorColor       : Colors.green,
                    animationDuration : const Duration(milliseconds: 300),
                    enableActiveFill  : true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType : TextInputType.number,
                    boxShadows   : const [
                      BoxShadow(
                        offset     : Offset(0, 1),
                        color      : Colors.black12,
                        blurRadius : 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completado");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Texto copiado al portapapeles $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    hasError ? "*Ingrese el codigo enviado a su Celular" : "",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(
                        child: TextButton(
                      child: const Text("Limpiar",
                      style: TextStyle(
                        color: Color(0xFF0C4F83),
                      ),
                      ),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    )),
                    Flexible(
                        child: TextButton(
                      child: const Text("Pegar",
                      style: TextStyle(
                        color: Color(0xFF0C4F83),
                      ),
                      ),
                      onPressed: () {
                        setState(() {
                          textEditingController.text = "123456";
                        });
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.refresh,
                    color: Color(0xFF0C4F83),
                    size: 20,
                    ),
                    TextButton(
                      onPressed: () => snackBar("Código reenviado"),
                      child: const Text(
                        "Enviar Código Nuevo",
                        style: TextStyle(
                          color: Color(0xFF0C4F83),
                          fontWeight: FontWeight.normal,
                          fontSize: 15
                        ),
                      )
                    )
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  margin : const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                  height: 40,
                  child  : TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 6 || currentText != "123456") {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                          () {
                            hasError = false;
                            snackBar("Código verificado");
                          },
                        );
                      }
                    },
                    child: Center(
                        child: Text(
                      "ACEPTAR".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C4F83),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 100),
                   child: OutlinedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize   : 18,
                        decoration : TextDecoration.none,
                        fontWeight : FontWeight.bold,
                      ),
                      primary   : const Color(0xFF1A477C)),
                      onPressed : () {
                      //routes.tutorial(context);
                      },
                      child: const Text('CANCELAR')
                )),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
    );
  }
}