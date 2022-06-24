import 'dart:ui';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/modules/provider/operation_provider.dart';

import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:bank9780/services/database/queries/register_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';

import '../../services/api/call/clients.dart';
import '../../services/api/call/login.dart';

/// Board for pin numbers widget
/// - Made by: Neil Yesikov Cuadros miraval
/// - email: 9780desarrollador09@gmail.com
/// - Date : 03/11/2021
class PinBoardWidget extends StatefulWidget {
  final Pages? pages;
  late Process process;

  PinBoardWidget({this.pages = Pages.none, required this.process, Key? key})
      : super(key: key);

  /// Board for pin numbers widget
  ///-----------------------------------
  ///- [page] : Destiny page
  ///- [process] : action to do
  ///- [fingerPrint] : show fingerprint
  ///-----------------------------------
  ///* Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  @override
  _PinBoardWidgetState createState() => _PinBoardWidgetState();
}

class _PinBoardWidgetState extends State<PinBoardWidget> {
  List<String> pin = [];
  List<String> backup = [];
  bool fingerPrint = false;
  bool movement = false;
  bool repeat = false;
  bool change = false;
  String message = '';
  int loginError = 0;
  List<String> confirmVar = [];

  List<Pointer> pointers = [
    Pointer.empty,
    Pointer.empty,
    Pointer.empty,
    Pointer.empty,
    Pointer.empty,
    Pointer.empty,
  ];

  List<List<String>> board = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['f', '0', 'd'],
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () async {
      await RegisterData.getFirstData(context);
    });
    //print(widget.process.name);
    message =
        widget.process == Process.change || widget.process == Process.register
            ? 'Ingresar nuevo pin'
            : 'Ingresar pin';
    shuffleBoard();
    // reload and uncomend this to log in with 000000

    if (widget.process == Process.login &&
        context.read<ClientProvider>().clientRegister!.pin == '' &&
        context.read<ClientProvider>().clientRegister!.numDocument == '' &&
        context.read<ClientProvider>().clientRegister!.phone == '') {
      Future.delayed(
        const Duration(milliseconds: 10),
        () => context
            .read<ClientProvider>()
            .changeClientRegisterPin(pin: '999999'),
      );
      debugPrint("ingresa cambio pon 999999");
      //print("no existe");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // THIS WILL BE ENABLED WHEN REAL DATA EXIST
        // onTap       : () => context.read<WalletProvider>().resetInactiveCounter(),
        // onLongPress : () => context.read<WalletProvider>().resetInactiveCounter(),
        child: Container(
            alignment: Alignment.center,
            width: 240,
            height: 420,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pointers
                          .map((e) => e == Pointer.empty
                              ? TranslationAnimatedWidget(
                                  curve: Curves.easeInOut,
                                  duration: const Duration(milliseconds: 250),
                                  enabled: true,
                                  values: const [
                                    Offset(0, -10),
                                    Offset(0, 10),
                                    Offset(0, 0)
                                  ],
                                  child: const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Icon(Icons.radio_button_unchecked,
                                          color: Color(0xFF0A5F93))))
                              : e == Pointer.full
                                  ? TranslationAnimatedWidget(
                                      curve: Curves.easeInOut,
                                      duration:
                                          const Duration(milliseconds: 250),
                                      enabled: true,
                                      values: const [
                                        Offset(0, -10),
                                        Offset(0, 10),
                                        Offset(0, 0)
                                      ],
                                      child: const Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Icon(Icons.circle,
                                              color: Color(0xFF0A5F93))))
                                  : e == Pointer.number
                                      ? TranslationAnimatedWidget(
                                          curve: Curves.easeInOut,
                                          duration:
                                              const Duration(milliseconds: 250),
                                          enabled: true,
                                          values: const [
                                            Offset(0, 10),
                                            Offset(0, -10),
                                            Offset(0, 0)
                                          ],
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 24,
                                              padding: const EdgeInsets.only(
                                                  bottom: 0),
                                              child: Text(pin.last)))
                                      : const SizedBox.shrink())
                          .toList())),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: board
                      .map((row) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: row
                              .map((e) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ShakeAnimatedWidget(
                                      enabled: movement,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      shakeAngle: Rotation.deg(z: 40),
                                      curve: Curves.easeIn,
                                      child: InkWell(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30)),
                                          onTap: () {
                                            e == 'd'
                                                ? deleteNumber()
                                                : listenButtons(e);
                                          },
                                          child: Container(
                                              decoration: Skin
                                                  .circularButtonDecoration(),
                                              alignment: Alignment.center,
                                              width: 60,
                                              height: 60,
                                              child: e == 'f'
                                                  ? fingerPrint
                                                      ? const Icon(
                                                          Icons
                                                              .fingerprint_rounded,
                                                          color: Colors.white)
                                                      : const SizedBox(
                                                          width: 30, height: 30)
                                                  : e == 'd'
                                                      ? const Icon(
                                                          Icons
                                                              .backspace_rounded,
                                                          color: Colors.white)
                                                      : Text(e,
                                                          style: Skin
                                                              .textButtonTextStyle(
                                                                  pin:
                                                                      true)))))))
                              .toList()))
                      .toList()),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Text(
                  message,
                  style: Skin.textButtonTextStyle(detail: true),
                  overflow: TextOverflow.clip,
                ),
              )
            ])));
  }

  bool checkRegisteredPin() =>
      context.read<ClientProvider>().clientRegister!.pin == pin.join('');

  listenButtons(String number) async {
    if (pin.length < 6) {
      pin.add(number);
    }

    if (pin.length == 6) {
      if (context.read<DataProvider>().registerText == false &&
          widget.process == Process.register) {
        widget.process = Process.confirm;
      }
      switch (widget.process) {
        //-----------------------------------------
        case Process.register:
          context.read<DataProvider>().changeRegisterText(state: false);
          print("confirma" + widget.process.toString());
          confirmVar = pin;
          context
              .read<ClientProvider>()
              .changeClientRegisterPin(pin: pin.join(''));
          //Routes.pinPage(context: context, process: Process.confirm);

          register();
          break;
        //-----------------------------------------
        case Process.confirm:
          //debugPrint("pin cambio pa");
          if (listEquals(confirmVar, pin)) {
            // ignore: todo
            // TODO: uncomment this line to push the user
            // the default pin will be '111111' and the call
            // will be: 
            // b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d
            // --------------------------------------------------------------------------
            //debugPrint(context.read<ClientProvider>().clientRegister!.pin.toString());

            RegisterData.pin(context, pin: pin.join(''));
            Clients.postClient(context);
            // --------------------------------------------------------------------------
            //Routes.aboutus(context);
            debugPrint("names  " +
                context.read<ClientProvider>().clientRegister!.names);
            debugPrint("surnames  " +
                context.read<ClientProvider>().clientRegister!.surnames);
            debugPrint("idTypeDocument  " +
                context
                    .read<ClientProvider>()
                    .clientRegister!
                    .idTypeDocument
                    .toString());
            debugPrint("document  " +
                context.read<ClientProvider>().clientRegister!.numDocument);
            debugPrint("dateBirth  " +
                context.read<ClientProvider>().clientRegister!.dateBirth);
            debugPrint("address  " +
                context.read<ClientProvider>().clientRegister!.address);
            debugPrint("email  " +
                context.read<ClientProvider>().clientRegister!.email);
            debugPrint("codRefer  " +
                context.read<ClientProvider>().clientRegister!.codRefer);
            //debugPrint("fatherRefer  " +
            //    context.read<ClientProvider>().clientRegister!.fatherRefer);
            //debugPrint("isoCountry  " +
            //    context.read<ClientProvider>().clientRegister!.isoCountry);
            debugPrint(
                "pin  " + context.read<ClientProvider>().clientRegister!.pin);
            debugPrint("idDepartament  " +
                context.read<ClientProvider>().clientRegister!.idDepartament);
            debugPrint("idProvince  " +
                context.read<ClientProvider>().clientRegister!.idProvince);
            debugPrint("prefixPhone  " +
                context.read<ClientProvider>().clientRegister!.prefixPhone);
            debugPrint("phone  " +
                context.read<ClientProvider>().clientRegister!.phone.replaceAll(' ', ''));
            debugPrint("isoLanguage  " +
                context
                    .read<ClientProvider>()
                    .clientRegister!
                    .isoLanguage
                    .toString());

            await context.read<DataProvider>().changeRegisterText(state: true);
            print(confirmVar);
            print("confirma");
            Future.delayed(const Duration(milliseconds: 500),
                () => Routes.waitingRegisterPage(context));
          } else {
            print(confirmVar);
            print("confirma");
            showToast(
              "El PIN no coincide, ingrese nuevamente su PIN",
              context: context,
              backgroundColor: Colors.blue.shade800,
              animation: StyledToastAnimation.slideFromTopFade,
              reverseAnimation: StyledToastAnimation.slideToTopFade,
              animDuration: const Duration(seconds: 1),
              duration: const Duration(seconds: 4),
              curve: Curves.elasticOut,
              reverseCurve: Curves.elasticIn,
            );
            clean();
          }
          //register();
          break;
        //-----------------------------------------
        case Process.change:
          if (!change && checkRegisteredPin()) {
            clean();
            // showToastWidget(context, text: 'pin_different'.tr(), bottom: true);
          } else {
            register(modify: true);
          }
          break;
        //-----------------------------------------
        case Process.check:
          if (checkRegisteredPin()) {
            debugPrint("aguante megadeth");
            Routes.hide(context);
            switch (widget.pages) {
              case Pages.waiting:
                Routes.waitingPage(context);
                break;
              case Pages.change:
                // todo: add
                clean();
                break;
              default:
                break;
            }
          } else {
            // ignore: todo
            // TODO: add a context to call the toast alert
            // showToastWidget(context, text: 'pin_wrong'.tr(), bottom: true);
            //showToast("msg,");
            clean();
          }
          break;
        //-----------------------------------------
        case Process.login:
          if (checkRegisteredPin()) {
            //Login.getLogin(context);
            await Login.getLogin(context)
                ? Future.delayed(const Duration(milliseconds: 500), () {
                    context.read<OperationProvider>().getLoginData(
                        loginData: parseJwt(context
                            .read<OperationProvider>()
                            .login!
                            .token
                            .toString()));
                    Routes.home(context);
                  })
                : null;
            //await Publicity.getPublicity(context)
            //                                ? Future.delayed(
            //                                  const Duration(seconds: 1),
            //                                     () => Routes.welcome(context)
            //                                   )
            //                                   : null; break;
            //GO TO THE SUSSESFULL PAGE
          } else {
            loginError += 1;
            debugPrint("object");
            if (loginError == 3) {
              showDialog(
                context: context,
                builder: (_) => const ImageDialog(),
              );
              loginError = 0;
            } else {
              clean();
            }
            // showToastWidget(context, text: 'pin_wrong'.tr(), bottom: true);
          }
          break;
      }
    }
    setPointers();
  }

  register({bool? modify = false}) async {
    if (!repeat) {
      backup = pin;
      if (modify!) {
        change = true;
      }
      clean(repeat: true, message: 'pin_repeat'.tr());
    } else {
      if (pin.join('') == backup.join('')) {
        backup = [];
        context
            .read<ClientProvider>()
            .changeClientRegisterPin(pin: pin.join(''));
        if (modify!) {
          // showConfirmationDialog(
          //   context    : context,
          //   text       : 'pin_success'.tr()
          // );
        } else {
          // await confirmLocalAuth()
          // ? Routes.fingerprint(context)
          // : showLoadingOverlay(context);
        }
        clean(message: 'pin_new'.tr());
      } else {
        // showToastWidget(context, text: 'pin erroneo', bottom: true);
        clean(repeat: true);
      }
    }
  }

  //-------------------------------------------

  clean({
    bool? repeat = false,
    String? message = '',
  }) {
    pin = [];
    if (message!.isNotEmpty) {
      this.message = message;
    }
    this.repeat = repeat!;
    setPointers();
    shuffleBoard();
  }

  //-------------------------------------------

  deleteNumber() {
    pin.isNotEmpty ? pin.removeLast() : null;
    setPointers();
    if (pin.isEmpty) {
      shuffleBoard();
    }
  }

  //-------------------------------------------

  setPointers() => setState(() {
        for (int i = 0; i < pointers.length; i++) {
          // line for animation numbers
          //pointers[i] = i < pin.length - 1
          pointers[i] = i < pin.length
              ? Pointer.full
              : i == pin.length - 1
                  ? Pointer.number
                  : Pointer.empty;
        }
      });

  //-------------------------------------------

  shuffleBoard() {
    List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    numbers.shuffle();

    setState(() {
      board.clear();
      board.add(numbers.getRange(0, 3).toList());
      board.add(numbers.getRange(3, 6).toList());
      board.add(numbers.getRange(6, 9).toList());
      board.add(['f', numbers.last, 'd']);
    });

    setState(() => movement = true);
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => movement = false);
    });
  }

  //-------------------------------------------

  // Future<bool> confirmLocalAuth() async => await LocalAuthentication().canCheckBiometrics;

  // checkFingerprint() async =>
  // await LocalAuthentication().authenticate(localizedReason: ' ', stickyAuth: true)
  // ? showLoadingOverlay(context)
  // : showToastWidget(context, text: 'fingerWrong'.tr());

}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //gestureDetector
        child: Container(
          padding: EdgeInsets.zero,
          width: 275,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0x330C4F83), width: 2.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF0C4F83),
                child: const Text(
                  "¡ALERTA!\nPIN INCORRECTO",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "“Número de intentos excedidos (3 veces). Por razones de seguridad, se bloqueó su cuenta temporalmente, por favor  vuelva a intentarlo en de 1 hora.”",
                  style: TextStyle(
                    color: Color(0xFF0A5F93),
                    fontSize: 20,
                  ),
                ),
              ),
              const Text(
                "Si tienes alguna consulta comunícate\na nuestra banca telefónica 054 245897 ",
                style: TextStyle(
                  color: Color(0xFF0C4F83),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
