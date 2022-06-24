import 'dart:ui';

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:bank9780/services/database/queries/register_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterFormFirst extends StatefulWidget with InputValidationMixin {
  const RegisterFormFirst({Key? key}) : super(key: key);

  @override
  State<RegisterFormFirst> createState() => _RegisterFormFirstState();
}

class _RegisterFormFirstState extends State<RegisterFormFirst>
    with InputValidationMixin {
  int index = 0;
  final formGlobalKey = GlobalKey<FormState>();
  late Future<String> _value;

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];


  //String? validateName() {
  //  String text = controllers[1].text;
  //  if (text.isEmpty) {
  //    return "Espacio vacio";
  //  }
  //  final nameExp = RegExp(r'^[A-Za-z ]+$');
  //  if (!nameExp.hasMatch(text)) {
  //    return "Valores no validos";
  //  }
  //  return null;
  //}

  @override
  void dispose() {
    controllers[0].dispose();
    controllers[1].dispose();
    controllers[2].dispose();
    controllers[3].dispose();
    controllers[4].dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () async {
      await RegisterData.getFirstData(context);
      setState(() {
        controllers[0].text =
            context.read<ClientProvider>().clientRegister!.codRefer;
        controllers[1].text =
            context.read<ClientProvider>().clientRegister!.names;
        controllers[2].text =
            context.read<ClientProvider>().clientRegister!.surnames;
        controllers[3].text =
            context.read<ClientProvider>().clientRegister!.numDocument;
        controllers[4].text =
            context.read<ClientProvider>().clientRegister!.dateBirth;
        index = context.read<DataProvider>().documentTypes.indexWhere(
            (element) =>
                element.id ==
                context.read<ClientProvider>().clientRegister!.idTypeDocument);
        index = index < 0 ? 0 : index;
      });
    });

    _value = getValue();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      //body: SizedBox(
      appBar: const MyAppBar(
        appBarName: "Registro",
        isInside: false,
      ),
      body: Consumer<DataProvider>(
        builder: (context, value, child) => Container(
          decoration: Skin.gradientDecoration(),
          child: Center(
            child: FutureBuilder<String>(
              future: _value,
              initialData: "data",
              builder: (
                BuildContext context,
                AsyncSnapshot<String> snapshot,
                ){
              if (snapshot.connectionState == ConnectionState.waiting) {

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    //Visibility(
                    //  visible: snapshot.hasData,
                    //  child: Text(
                    //    "snapshot.data",
                    //    style: const TextStyle(color: Colors.black, fontSize: 24),
                    //  ),
                    //)
                  ],
                );
              
              }
              else if (snapshot.connectionState == ConnectionState.done){
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff2DD8E3),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      //color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Form(
                        key: formGlobalKey,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assets/img/Group 10.png'),
                                  const SizedBox(height: 15),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        //flex: 2,
                                        width: 210,
                                        child: Text(
                                          'referralsCode'.tr(),
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF0A5F93),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
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
                                      Expanded(
                                          child: CupertinoTextField(
                                              controller: controllers[0],
                                              onChanged: (value) =>
                                                  RegisterData.codRefer(context,
                                                      codRefer: value),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF0A5F93)),
                                                  borderRadius:
                                                      BorderRadius.circular(2))))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller: controllers[1],
                                      //textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      onChanged: (value) {
                                        setState(() => value);
                                        RegisterData.names(context, names: value);
                                      },
                                      obscureText: false,
                                      validator: (name) => isNameValid(name!)
                                          ? null
                                          : name.isEmpty
                                              ? "Es obligatorio indicar tu nombre."
                                              : "Ingrese valores validos.",
                                      decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF0A5F93))),
                                        labelText: 'names'.tr(),
                                        labelStyle: const TextStyle(
                                            color: Color(0xFF0A5F93)),
                                        //errorText: _validateName(),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller: controllers[2],
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      onChanged: (value) => RegisterData.surnames(
                                          context,
                                          surnames: value),
                                      obscureText: false,
                                      validator: (surname) => isNameValid(
                                              surname!)
                                          ? null
                                          : surname.isEmpty
                                              ? "Es obligatorio indicar tus apellidos."
                                              : "Ingrese valores validos.",
                                      decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF0A5F93),
                                          ),
                                        ),
                                        labelText: 'lastnames'.tr(),
                                        labelStyle: const TextStyle(
                                            color: Color(0xFF0A5F93)),
                                      ),
                                    ),
                                  ),
                                  Consumer<DataProvider>(
                                      builder: (context, data, child) => Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 5, right: 5),
                                            child:
                                                DropdownButtonFormField<String>(
                                              style: const TextStyle(
                                                color: Color(0xFF0A5F93),
                                                fontSize: 17,
                                              ),
                                              value:
                                                  data.documentTypesNames[index],
                                              onChanged: (String? value) async {
                                                setState(() => index = data
                                                    .documentTypesNames
                                                    .indexOf(value!));
                                                await RegisterData.documentype(
                                                    context,
                                                    idTypeDocument: data
                                                        .allTypes!.data!.typeDocument![index].id!);
                                              },
                                              items: data.documentTypesNames
                                                  .map<DropdownMenuItem<String>>(
                                                      (String value) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: Text(value),
                                                          ))
                                                  .toList(),
                                            ),
                                          )),
                                  const SizedBox(height: 2),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      controller: controllers[3],
                                      onChanged: (value) => RegisterData.numDocument(
                                          context,
                                          numDocument: value),
                                      keyboardType: TextInputType.number,
                                      maxLength: 8,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r"[0-9]"))
                                        //FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      obscureText: false,
                                      // ignore: todo
                                      // TODO: change the values of the function
                                      validator: (dni) => isDniValid(dni!)
                                          ? null
                                          : dni.isEmpty
                                              ? "Ingresa tu número de DNI!"
                                              : "El DNI debe contener 8 digitos",
                                      // {
                                      //   if (isDniValid(dni!)) {
                                      //     return null;
                                      //   } else
                                      //     return "El DNI debe contener 8 digitos";
                                      // },
                                      decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Color(0xFF0A5F93),
                                        )),
                                        labelText: context
                                            .watch<DataProvider>()
                                            .documentTypesNames[index],
                                        labelStyle: const TextStyle(
                                            color: Color(0xFF0A5F93)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      alignment: Alignment.centerLeft,
                                      child: Text('bornDate'.tr(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF0A5F93),
                                          ))),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 140,
                                    padding: const EdgeInsets.only(top: 20),
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (value) =>
                                          RegisterData.dateBirth(context,
                                              dateBirth: DateFormat('yyyy-MM-dd')
                                                  .format(value)),
                                      // maximumDate       : DateTime.now(),
                                      initialDateTime: context
                                              .read<ClientProvider>()
                                              .clientRegister!
                                              .dateBirth
                                              .isEmpty
                                          ? DateTime.now()
                                          : DateTime.parse(context
                                              .read<ClientProvider>()
                                              .clientRegister!
                                              .dateBirth),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: ElevatedButton(
                      child: Text(
                        'next'.tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          Routes.registerSec(context);
                          // use the email provided here
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF1A477C),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        minimumSize: Size(
                          MediaQuery.of(context).size.width * 0.4,
                          40,
                        ),
                      ),
                    ),
                  ),
                ],
              );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }),
          ),
        ),
      ),
    );
  }
}
Future<String> getValue() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Flutter Devs';
}

mixin InputValidationMixin {
  //bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }

  bool isNameValid(String name) {
    // RegExp nameExp = new RegExp(r'^[A-Za-z ]+$');
    // TegExp for portuguese and spanish language
    RegExp nameExp = RegExp(r'^[A-Za-z-µùàçéèçÇ-ñÑ ]+$');
    return nameExp.hasMatch(name);
  }

  bool isDniValid(String dni) {
    if (dni.length < 8) return false;
    return true;
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child:
            GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.zero,
            width: 320,
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('lib/assets/img/Alert1.png'),
                fit: BoxFit.contain,
                //alignment: Alignment(0, 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "SI NO LO TIENES,\n¡NO TE PREOCUPES!",
                      style: TextStyle(
                          color: Color(0xFF0A5F93),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Pero recuerda dar el tuyo\na tus conocidos para\nobtener beneficios",
                      style: TextStyle(
                          color: Color(0xFF0A5F93),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Para más información visita nuestra\npágina web https://\nnwww.9780bank.com",
                        style:
                            const TextStyle(color: Color(0xFF000000), fontSize: 10),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://www.google.com');
                          },
                      ),
                    ),
                const SizedBox(height: 15),
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
