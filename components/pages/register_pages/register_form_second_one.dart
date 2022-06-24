import 'dart:async';

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:bank9780/services/api/call/locals.dart';
import 'package:bank9780/services/database/queries/register_data.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../modules/general/enum.dart';

class RegisterFormSecond extends StatefulWidget with InputValidationMixin {
  const RegisterFormSecond({Key? key}) : super(key: key);

  @override
  State<RegisterFormSecond> createState() => _RegisterFormSecondState();
}

class _RegisterFormSecondState extends State<RegisterFormSecond>
    with InputValidationMixin {
  int index = 0;

  List<int> indexes = [0, 0];
  final formGlobalKey = GlobalKey<FormState>();

  ScrollController scrollController = ScrollController();
  StreamController<bool> loading = StreamController<bool>();

  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  //final ValueChanged<String> onSubmit;
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
            context.read<ClientProvider>().clientRegister!.phone;
        controllers[1].text =
            context.read<ClientProvider>().clientRegister!.email;
        controllers[2].text =
            context.read<ClientProvider>().clientRegister!.address;
        indexes[0] = context.read<DataProvider>().departments.indexWhere(
            (element) =>
                element.id ==
                context.read<ClientProvider>().clientRegister!.idDepartament);
        indexes[0] = indexes[0] < 0 ? 0 : indexes[0];
        context.read<DataProvider>().changeDepartment(index: indexes[0]);
        if (indexes[0] != 0) {
          changeProvince(hasData: true);
        }
        indexes[1] = context.read<DataProvider>().provinces.indexWhere(
            (element) =>
                element.id ==
                context.read<ClientProvider>().clientRegister!.idProvince);
        indexes[1] = indexes[1] < 0 ? 0 : indexes[1];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      //body: SizedBox(
      appBar: const MyAppBar(
        appBarName: "Registro",
        isInside: false,
      ),
      body: Consumer<DataProvider>(
        builder: (context, value, child) => Container(
          decoration: Skin.gradientDecoration(),
          child: Center(
            child: ListView(
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
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Form(
                      key: formGlobalKey,
                      child: ListView(
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    //height : MediaQuery.of(context).size.height * 0.4,
                                    child: Column(children: [
                                      Image.asset(
                                          'lib/assets/img/Group 10.png'),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: TextFormField(
                                            controller: controllers[0],
                                            onChanged: (value) {
                                              value.replaceAll(' ', '');
                                              RegisterData.phone(context,
                                                  phone: value);
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              _phoneNumberFormatter,
                                              //FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))
                                            ],
                                            obscureText: false,
                                            maxLength: 11,
                                            maxLengthEnforcement:
                                                MaxLengthEnforcement.enforced,
                                            validator: (phone) => isPhoneValid(
                                                    phone!)
                                                ? null
                                                : phone.isEmpty
                                                    ? "Introduce tu número de celular."
                                                    : "### ### ###. Ingresa tu número de celular",
                                            decoration: InputDecoration(
                                              prefixText: "+54 ",
                                              prefixStyle: const TextStyle(
                                                  color: Colors.black),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF0A5F93),
                                                ),
                                              ),
                                              labelText: 'cellphoneNumber'.tr(),
                                              labelStyle: const TextStyle(
                                                  color: Color(0xFF0A5F93)),
                                            ),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: TextFormField(
                                            controller: controllers[1],
                                            onChanged: (value) =>
                                                RegisterData.email(context,
                                                    email: value),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            obscureText: false,
                                            validator: (email) => isEmailValid(
                                                    email!)
                                                ? null
                                                : email.isEmpty
                                                    ? "Es obligatorio ingresar un Correo Electrónico."
                                                    : "Ingrese un Correo Electronico valido.",
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF0A5F93),
                                                ),
                                              ),
                                              labelText: 'email'.tr(),
                                              labelStyle: const TextStyle(
                                                  color: Color(0xFF0A5F93)),
                                            ),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: TextField(
                                            controller: controllers[2],
                                            onChanged: (value) =>
                                                RegisterData.address(context,
                                                    address: value),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF0A5F93),
                                                ),
                                              ),
                                              labelText: 'address'.tr(),
                                              labelStyle: const TextStyle(
                                                  color: Color(0xFF0A5F93)),
                                            ),
                                          )),
                                      Container(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          alignment: Alignment.centerLeft,
                                          child: Text('department'.tr(),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF0A5F93),
                                              ))),
                                      Consumer<DataProvider>(
                                          builder: (context, data, child) =>
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 5, right: 5),
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  style: const TextStyle(
                                                    color: Color(0xFF0A5F93),
                                                    fontSize: 17,
                                                  ),
                                                  value: data.departmentNames[
                                                      indexes[0]],
                                                  onChanged:
                                                      (String? value) async {
                                                    int index = data
                                                        .departmentNames
                                                        .indexOf(value!);
                                                    data.changeDepartment(
                                                        index: index);
                                                    RegisterData.idDepartament(
                                                        context,
                                                        idDepartament: data
                                                            .departments[index]
                                                            .id);
                                                    changeProvince();
                                                  },
                                                  items: data.departmentNames
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child:
                                                                    Text(value),
                                                              ))
                                                      .toList(),
                                                ),
                                              )),
                                      Container(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          alignment: Alignment.centerLeft,
                                          child: Text('province'.tr(),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF0A5F93),
                                              ))),
                                      StreamBuilder(
                                        stream: loading.stream,
                                        builder:
                                            (context, AsyncSnapshot snapshot) =>
                                                !(snapshot.connectionState ==
                                                        ConnectionState.active)
                                                    ? Consumer<DataProvider>(
                                                        builder:
                                                            (context, data,
                                                                    child) =>
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 10,
                                                                      left: 5,
                                                                      right: 5),
                                                                  child:
                                                                      DropdownButtonFormField<
                                                                          String>(
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color(
                                                                          0xFF0A5F93),
                                                                      fontSize:
                                                                          17,
                                                                    ),
                                                                    value: data
                                                                            .provinceNames[
                                                                        indexes[
                                                                            1]],
                                                                    onChanged:
                                                                        (String?
                                                                            value) async {
                                                                      int index = data
                                                                          .provinceNames
                                                                          .indexOf(
                                                                              value!);
                                                                      data.changeProvince(
                                                                          index:
                                                                              index);
                                                                      RegisterData.idProvince(
                                                                          context,
                                                                          idProvince: data
                                                                              .provinces[index]
                                                                              .id);
                                                                    },
                                                                    items: data
                                                                        .provinceNames
                                                                        .map<
                                                                            DropdownMenuItem<String>>((String
                                                                                value) =>
                                                                            DropdownMenuItem<String>(
                                                                              value: value,
                                                                              child: Text(value),
                                                                            ))
                                                                        .toList(),
                                                                  ),
                                                                ))
                                                    : const SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                      )
                                    ])),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Checkbox(
                                            activeColor:
                                                const Color(0xFF0A5F93),
                                            value: context
                                                .watch<ClientProvider>()
                                                .terms,
                                            onChanged: (value) {
                                              scrollController.animateTo(
                                                  scrollController
                                                      .position.maxScrollExtent,
                                                  duration: const Duration(
                                                      milliseconds: 1500),
                                                  curve: Curves.ease);

                                              context
                                                      .read<ClientProvider>()
                                                      .terms
                                                  ? context
                                                      .read<ClientProvider>()
                                                      .switchTerms(state: false)
                                                  : Routes.terms(context);
                                            },
                                          ),
                                          Align(
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                textStyle: const TextStyle(
                                                    color: Color(0xFF0A557A),
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 16),
                                                //primary: Colors.white,
                                              ),
                                              child: Text(
                                                'termsAcceptation'.tr(),
                                                style: const TextStyle(
                                                    color: Color(0xFF0A5F93)),
                                              ),
                                              onPressed: () {
                                                // ignore: todo
                                                // TODO: GetTerms error
                                                //Terms.getTerms(context);
                                                Routes.terms(context);
                                              },
                                            ),
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ]),
                                  ]),
                                ),
                              ],
                            ),
                          ]),
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
                    //autofocus: false,
                    onPressed: context.watch<ClientProvider>().terms
                        ? () {
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();
                              // use the email provided here
                              Routes.pinPage(
                                  context: context,
                                  process: Process.register,
                                  pages: Pages.waiting);
                            }
                          }
                        : null,
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
            ),
          ),
        ),
      ),
    );
  }

  changeProvince({bool? hasData = false}) async {
    loading = StreamController<bool>();
    loading.add(true);

    await RegisteringInformation.getProvinces(context);

    Future.delayed(const Duration(seconds: 1), () {
      loading.close();
    });

    if (hasData!) {
      indexes[1] = context.read<DataProvider>().provinces.indexWhere(
          (element) =>
              element.id ==
              context.read<ClientProvider>().clientRegister!.idProvince);
      indexes[1] = indexes[1] < 0 ? 0 : indexes[1];
    }
  }
}

mixin InputValidationMixin {
  bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }

  bool isPhoneValid(String phone) {
    // the validation was done with 11 because the class _UsNumberTextInputFormatter
    // is adding two blank spaces ' ' to the string phoneNumber
    if (phone.length < 11) return false;
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
