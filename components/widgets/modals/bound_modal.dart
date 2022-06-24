import 'dart:async';

import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BoundBox extends StatefulWidget {
  BoundBox({
    Key? key,
    required this.name,
    required this.amount,
    required this.colorGradient,
    required this.borderColor,
    required this.index,
    //required this.historyItems,
  }) : super(key: key);

  //final HelpItem historyItems;
  final String name;
  double amount;
  LinearGradient colorGradient;
  Color borderColor;
  int index;

  @override
  State<BoundBox> createState() => _BoundBoxState();
}

class _BoundBoxState extends State<BoundBox> {
  TextEditingController controller = TextEditingController();
  bool _visible = false;

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              //color: Color(0xFF00B4D8),
              decoration: BoxDecoration(
                gradient: widget.colorGradient,
                border: Border.all(color: widget.borderColor, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
              height: 50,
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.name,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white)),
                  if (widget.index == 2)
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF90E0EF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      height: 13,
                      width: 40,
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.zero),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        onPressed: () {
                          showDialog(
                              barrierColor: const Color(0x66FFFFFF),
                              context: context,
                              builder: (_) => const DialogAlert());
                        },
                        child: const Text(
                          "Activar",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  Container(
                    color: Colors.white,
                    height: 30,
                    width: 100,
                    child: TextField(
                      //controller: !_visible ? controller: null,
                      controller: controller,
                      keyboardType: TextInputType.number,

                      //enabled: !_visible,
                      onSubmitted: (value) {
                        setState(() {
                          if (value == '.') {
                            controller.text = "0.0";
                            context
                                .read<MenuProvider>()
                                .boundValues[widget.index] = 1.0;
                          } else if (value != '') {
                            context
                                    .read<MenuProvider>()
                                    .boundValues[widget.index] =
                                double.parse(value);
                          } else {
                            context
                                .read<MenuProvider>()
                                .boundValues[widget.index] = 0.0;
                          }
                        });
                      },

                      decoration: InputDecoration(
                        //prefix: Text("máx", style: TextStyle(color: Colors.black),),
                        hintText: !_visible
                            ? "máx " +
                                context
                                    .read<MenuProvider>()
                                    .bounds[widget.index]
                                    .roundToDouble()
                                    .toString()
                            : context
                                .read<MenuProvider>()
                                .boundValues[widget.index]
                                .roundToDouble()
                                .toString(),
                        hintStyle: TextStyle(
                          color: _visible
                              ? const Color(0xFF000000)
                              : const Color(0x66000000),
                        ),
                        //suffix: Text(".00"),
                        contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
                      ),
                      //placeholder: !_visible ? context
                      //    .read<MenuProvider>()
                      //    .bounds[widget.index]
                      //    .round()
                      //    .toString() : context
                      //    .read<MenuProvider>()
                      //    .boundValues[widget.index]
                      //    .round()
                      //    .toString() ,
                      style: const TextStyle(fontSize: 14),
                      // decoration:
                      //    BoxDecoration(borderRadius: BorderRadius.zero),
                      inputFormatters: [
                        // FilteringTextInputFormatter.allow(
                        //   RegExp(r'^\d{0}[1-3](?:\d{0,1}[0-9])?$')),
                        //FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^\d*\.?\d*)')),
                        FilteringTextInputFormatter.singleLineFormatter,
                        //FilteringTextInputFormatter.allow(RegExp(r'^\d{1,6}(?:-\d{0,4})?$')),
                        CustomRangeTextInputFormatter(
                            context: context,
                            maxValue: context
                                .watch<MenuProvider>()
                                .bounds[widget.index]),
                      ],
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.mode_sharp,
                color: Color(0xFF154579),
              ),
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
            ),
          ],
        ),
        _visible
            ? Container(
                margin: const EdgeInsets.only(right: 55),
                height: MediaQuery.of(context).size.height * 0.050,
                width: MediaQuery.of(context).size.width * 0.75,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white.withOpacity(1),
                    inactiveTrackColor: Colors.white.withOpacity(.5),

                    trackHeight: 4.0,
                    thumbShape: CustomSliderThumbCircle(
                      thumbRadius: 20,
                      min: 0,
                      max: context
                          .read<MenuProvider>()
                          .bounds[widget.index]
                          .round(),
                    ),
                    overlayColor: Colors.white.withOpacity(.4),
                    //valueIndicatorColor: Colors.green,
                    //activeTickMarkColor: Colors.white,
                    //inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                    activeColor: const Color(0xFF48CAE4),
                    inactiveColor: const Color(0xFF48CAE4),
                    thumbColor: Colors.black,
                    value:
                        context.read<MenuProvider>().boundValues[widget.index],
                    max: context.read<MenuProvider>().bounds[widget.index],
                    onChanged: (double value) {
                      setState(() {
                        context.read<MenuProvider>().boundValues[widget.index] =
                            value;
                        controller.text = value.roundToDouble().toString();
                      });
                    },
                  ),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
              ),
      ],
    );
  }
}

class CustomRangeTextInputFormatter extends TextInputFormatter {
  final double maxValue;
  BuildContext context;

  CustomRangeTextInputFormatter({
    required this.maxValue,
    required this.context,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '' || newValue.text == '.') {
      return newValue;
    }
    // ignore: todo
    // TODO: make a new return form, it may work with ranges

    if (double.parse(newValue.text) > maxValue) {
      // dismiss the keyboard
      FocusManager.instance.primaryFocus?.unfocus();
      //showToastWidget(context, text: text);
      showToast(
        "La cantidad máxima que se puede agregar es de: $maxValue",
        context: context,
        animDuration: const Duration(milliseconds: 750),
        duration: const Duration(seconds: 4),
      );
      return const TextEditingValue();
    } else {
      //print("object");
      return newValue;
    }
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = const Color(0xff0077B6) //Thumb Background Color
      ..style = PaintingStyle.fill;

    //TextSpan span = new TextSpan(
    //  style: new TextStyle(
    //    fontSize: thumbRadius * .8,
    //    fontWeight: FontWeight.w700,
    //    color: sliderTheme.thumbColor, //Text Color of Value on Thumb
    //  ),
    //  text: getValue(value),
    //);

    // TextPainter tp = new TextPainter(
    //     text: span,
    //     textAlign: TextAlign.center,
    //     textDirection: TextDirection.ltr);
    // tp.layout();
    //Offset textCenter =
    //Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    //canvas.drawCircle(center, thumbRadius * .9, paint);
    canvas.drawRect(
        Rect.fromCenter(center: center, width: 8, height: 20), paint);
    //canvas.drawRRect(RRect.fromLTRBAndCorners(5, 5, 5, 5), paint);
    //canvas.drawOval(Rect.fromCenter(center: center, width: 10, height: 20), paint);
    //tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}

class DialogAlert extends StatefulWidget {
  const DialogAlert({Key? key}) : super(key: key);

  @override
  State<DialogAlert> createState() => _DialogAlertState();
}

class _DialogAlertState extends State<DialogAlert> {
  final formKey = GlobalKey<FormState>();
  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        //padding: EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          color: Color(0xffE5E5E5),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 135,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Introducir Código\nAuthenticator para\nestablecer su limite de\nENVIO.",
              textAlign: TextAlign.center,
            ),
            Center(
              child: Form(
                key: formKey,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: false,
                      textStyle: const TextStyle(color: Colors.black, fontSize: 15),
                      // obscuringCharacter: '*',
                      // obscuringWidget: const FlutterLogo(
                      //   size: 24,
                      // ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.scale,
                      validator: (v) {
                        if (v!.length < 5) {
                          return "Caracteres Incompletos";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 25,
                          fieldWidth: 25,
                          activeFillColor: const Color(0xffC1C1C1),
                          inactiveFillColor: const Color(0xffC1C1C1),
                          selectedFillColor: const Color(0xffC1C1C1),
                          activeColor: const Color(0xFF0C4F83),
                          errorBorderColor: const Color(0xFF0C4F83),
                          selectedColor: const Color(0xFF0C4F83),
                          inactiveColor: const Color(0xFF0C4F83)),
                      cursorColor: const Color(0xFF0C4F83),
                      cursorHeight: 15,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
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
            )
          ],
        ),
      ),
    );
  }
}
