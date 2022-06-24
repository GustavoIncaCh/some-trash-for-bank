import 'dart:async';
import 'dart:ui';

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/modules/provider/operation_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/services/api/call/locals.dart';
import 'package:bank9780/services/api/call/terms.dart';
import 'package:bank9780/services/database/queries/register_data.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class LoginPageWithoutID extends StatefulWidget {
  final Pages pages;
  final Process process;

  ///  Pin Page
  ///-----------------------------------------------------
  const LoginPageWithoutID(
      {required this.pages, required this.process, Key? key})
      : super(key: key);

  @override
  _LoginPageWithoutIDState createState() => _LoginPageWithoutIDState();
}

class _LoginPageWithoutIDState extends State<LoginPageWithoutID> {
  StreamController<bool> loading = StreamController<bool>();

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void dispose() {
    controllers[0].dispose();
    controllers[1].dispose();
    controllers[2].dispose();
    super.dispose();
  }

  @override
  void initState() {
    loading.close();
    Future.delayed(const Duration(milliseconds: 100), () async {
      await RegisterData.getFirstData(context);
      setState(() {
        controllers[0].text =
            context.read<ClientProvider>().clientRegister!.numDocument;
        controllers[1].text =
            context.read<ClientProvider>().clientRegister!.phone;
        controllers[2].text =
            context.read<ClientProvider>().clientRegister!.pin;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: const MyAppBar(
          appBarName: "INGRESAR",
          isInside: false,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controllers[0],
                            maxLength: 8,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF0A5F93),
                              )),
                              labelText: "DNI",
                              counterText: "",
                              labelStyle: TextStyle(color: Color(0xFF0A5F93)),
                            ),
                          ),
                          TextFormField(
                            controller: controllers[1],
                            maxLength: 9,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF0A5F93),
                              )),
                              labelText: "NÚMERO DE CELULAR",
                              counterText: "",
                              labelStyle: TextStyle(color: Color(0xFF0A5F93)),
                            ),
                          ),
                          TextField(
                            controller: controllers[2],
                            obscureText:
                                context.watch<OperationProvider>().isObscure,
                            maxLength: 6,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            obscuringCharacter: '●',
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: "",
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF0A5F93),
                              )),
                              labelStyle:
                                  const TextStyle(color: Color(0xFF0A5F93)),
                              labelText: "PIN",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<OperationProvider>()
                                      .getIsObscure(
                                          isObscure: context
                                                  .read<OperationProvider>()
                                                  .isObscure
                                              ? false
                                              : true);
                                },
                                icon: const Icon(Icons.remove_red_eye),
                                padding: EdgeInsets.zero,
                                color: const Color(0xff0C4F83),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: const Text(
                            "OLVIDE MI PIN",
                            style: TextStyle(
                                color: Color(0xFF0A557A), fontSize: 14),
                          ),
                          onPressed: () {
                            Routes.forgotpin(context);
                          },
                        ),
                        SizedBox(
                          width: 30,
                          // rotation of the icon
                          child: Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.info_outline_rounded,
                                color: Color(0xFF2DD8E3),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => const ImageDialog(),
                                  barrierColor: const Color(0x33FFFFFF),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    // todo: buttons
                    ElevatedButton(
                      onPressed: () {
                        
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
                      onPressed: ()  => loadLocals(),
                      child: StreamBuilder(
                              stream: loading.stream,
                              builder: (context, AsyncSnapshot snapshot) =>
                                  !(snapshot.connectionState ==
                                          ConnectionState.active)
                                      ? const Text('REGISTRARME',)
                                      : const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.green,
                                          ),
                                        ),
                            )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  loadLocals() async {
    //todo: loadin streambuilder must be solved
    loading = StreamController<bool>();
    loading.add(true);

    await RegisteringInformation.getDepartments(context);
    await RegisteringInformation.getProvinces(context);
    await RegisteringInformation.getDocumnetTypes(context);
    await Terms.getTerms(context);
    //await RegisteringInformation.getTerms(context);
    // ignore: todo
    /// TODO: clients added to the panel section
    // ignore: todo
    /// TODO: it must call the clients by the app section in "crear cuenta"
    /// look for 'services/api/call' clients, agencies n' locals
    // ignore: todo
    /// TODO: uncoment the Clients.postClient and the coments inside the class Clients
    /// it should call the API and register the user
    //await Clients.postClient(context);
    //await Agencies.getAgencies(context);

    Future.delayed(const Duration(seconds: 1), () {
      loading.close();
      Routes.register(context);
    });
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Container(
    //  //width: 200,
    //  //height: 200,
    //  decoration: BoxDecoration(
    //    image: DecorationImage(
    //      image: ExactAssetImage('lib/assets/img/Alert1.png'),
    //      //fit: BoxFit.cover
    //    )
    //  ),
    //);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          //alignment: Alignment(-2,1),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.zero,
            width: 320,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('lib/assets/img/Alert3.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "SI OLVIDASTE TU PIN\n¡NO TE PREOCUPES!\n",
                      style: TextStyle(
                          color: Color(0xFF0A5F93),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "“ Solo necesitaremos tu\nDNI, N° de celular y\ncomprobar que eres tú ”",
                      style: TextStyle(
                          color: Color(0xFF0A5F93),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

mixin InputValidationMixin {
  bool isDniValid(String dni) {
    if (dni.length < 8) return false;
    return true;
  }

  bool isPhoneValid(String phone) {
    // the validation was done with 11 because the class _UsNumberTextInputFormatter
    // is adding two blank spaces ' ' to the string phoneNumber
    if (phone.length < 11) return false;
    return true;
  }

  bool isPinValid(String pin) {
    if (pin.length < 6) return false;
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
