
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ReceiveFormWidget extends StatefulWidget {

  ///  Receive reactive form
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const ReceiveFormWidget({Key? key}) : super(key: key);

  @override
  _ReceiveFormWidgetState createState() => _ReceiveFormWidgetState();
}

class _ReceiveFormWidgetState extends State<ReceiveFormWidget> {
  TextEditingController searchController = TextEditingController();
  bool showList     = false;
  bool showSearch   = false;
  bool searchTyping = false;
  GlobalKey key_pos = GlobalKey(); // declare a global key

  @override
  Widget build(BuildContext context) {
    //todo bool
    bool show = false;//WidgetsBinding.instance.window.viewInsets.bottom != 0.0;
    //--------------------------------------------------------------- SIZE DETERMINATE BOX
    return SizedBox.expand(
      child:
      Stack(
        children: [
          //-------------------------------------------------- COLUM OF AMOUNT INFORMATION
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children     : [
              InkWell(
                onTap: () {},
                child:
                Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children          : [
                    Padding(
                      padding : const EdgeInsets.symmetric(vertical: 5),
                      child   : Text('Con tarjeta de credito o debito',
                        style: Skin.textButtonTextStyle(cancel: true)
                      )
                    ),
                    Row(
                      children: [
                        Padding(
                          padding : const EdgeInsets.all(5),
                          child   : Image.asset('lib/assets/img/mastercard.png', height: 15)
                        ),
                        Padding(
                          padding : const EdgeInsets.all(5),
                          child   : Image.asset('lib/assets/img/visa.png', height: 15)
                        )
                      ]
                    )
                  ]
                )
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:
                Text(
                  'Para que usted pueda recibir soles o dólares en su cuenta de 9780 Bank, ingrese lo solicitado por favor.',
                  textAlign: TextAlign.justify,
                  // style: Skin.amountInputTextStyle(),
                )
              ),
              Container(
                width   : double.infinity,
                padding : const EdgeInsets.only(bottom: 10),
                child   :
                CupertinoTextField(
                  padding          : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  textAlign        : TextAlign.left,
                  decoration       : Skin.inputDecoration(transparent: false),
                  style            : Skin.inputTextStyle(),
                  placeholder      : 'Monto',
                  keyboardType     : TextInputType.number,
                  inputFormatters  : [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  onTap            : ()=>{},
                  onChanged        : (String text) {},
                )
              ),
              Container(
                width   : double.infinity,
                padding : const EdgeInsets.only(bottom: 10),
                child   :
                CupertinoTextField(
                  padding          : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  textAlign        : TextAlign.left,
                  decoration       : Skin.inputDecoration(transparent: false),
                  style            : Skin.inputTextStyle(),
                  placeholder      : 'Banco',
                  keyboardType     : TextInputType.number,
                  onTap            : ()=>{},
                  onChanged        : (String text) {},
                  suffix:
                  InkWell(
                    onTap : () => toggleList(),
                    child :
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child:
                      Icon(showList? Icons.expand_less : Icons.expand_more, color: Tint.blue.accent5)
                    )
                  )
                )
              ),
              Offstage(
                offstage : show,
                child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('BCP', style: Skin.blackTextStyle(bankSymbol: true)),
                          const SizedBox(width: 5),
                          Text('215-256-45896-4521', style: Skin.blackTextStyle(backNumber: true)),
                          InkWell(
                            onTap: () {},
                            child:
                            Icon(Icons.copy, color: Tint.blue.accent10,)
                          ),
                          InkWell(
                            key: key_pos,
                            onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => ImageDialog(key_pos:key_pos),
                    barrierColor: const Color(0x33FFFFFF),
                  );},
                            child:
                            const Icon(Icons.help_outline, color: Color(0xFF2DD8E3),)
                          )
                        ]
                      )
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Text('9780 Bank S.A.', style: Skin.blackTextStyle(bankName: true))
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          //onPressed : () => Routes.pinPage(context: context, pages: Pages.none, process: Process.check,),
                          onPressed: () {context.read<DataProvider>().changeTypePushed();
                          },
                          child     :
                          Container(
                            padding    : const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            decoration : Skin.buttonDecoration(),
                            child      : Text('ACEPTAR', style: Skin.textButtonTextStyle())
                          )
                        ),
                      ]
                    ),
                  ]
                )
              )
            ]
          )
          //------------------------------------------------------------------------------
        ]
      )
    );
  }

  focus()=> FocusScope.of(context).hasFocus ? FocusScope.of(context).unfocus() : null;

  toggleList() => setState(() {
    focus();
    showList = !showList;
    searchController.clear();
    showSearch = false;
  });

  search(String text){

    String upperSearch = text.toUpperCase();
    int index = 0;

    if(text.isNotEmpty){

      index = context.read<DataProvider>().accounts.indexWhere((element) => element.name.toUpperCase().startsWith(upperSearch));

      context.read<DataProvider>().setSearchAccount(context.read<DataProvider>().accounts[index == -1 ? 0 : index]);

      setState(() { showList = false; showSearch = true;  });

    } else{
      setState(() { showList = false; showSearch = false; });
    }

  }
}

class ImageDialog extends StatefulWidget {
  GlobalKey key_pos;
  ImageDialog({required this.key_pos, Key? key}) : super(key: key);

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
  RenderBox box = widget.key_pos.currentContext!.findRenderObject() as RenderBox;
Offset position = box.localToGlobal(Offset.zero); //this is global position
double y = position.dy;
double x = position.dx;
double h = MediaQuery.of(context).size.height*0.5;
double w = MediaQuery.of(context).size.width*0.5;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        alignment: Alignment(
        //((x-w)/w)+280/w,
        ((x-w)/w)-15/w,
        ((y-h)/h)-63/h
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.zero,
          width: 180,
          height: 125,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('lib/assets/img/AlertReceive.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: const Text("\nAsegúrate de verificar\nque la cuenta salga a\nnombre de\n“ 9780 Bank S.A. “", textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF0A5F93)),),
        ),
      ),
    );
  }
}
