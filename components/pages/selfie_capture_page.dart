import 'dart:io';
//import 'dart:ui';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/services/api/call/register_user_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';

class SelfieCapturePage extends StatefulWidget {
  const SelfieCapturePage({ Key? key }) : super(key: key);

  @override
  State<SelfieCapturePage> createState() => _SelfieCapturePageState();
}

class _SelfieCapturePageState extends State<SelfieCapturePage> {
  File? image;

  bool _isVisible = false;

  void _getFromCamera() async {
  XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera,
  maxHeight : 1080,
  maxWidth  : 1080,
  //preferredCameraDevice:
  );
  setState(() {
    image = File(pickedFile!.path);
    setState(() {
      _isVisible = !_isVisible;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(appBarName: "REGISTRO", isInside: false,),
      //body: SizedBox(
        body: Center(
          child: SizedBox(
      height : MediaQuery.of(context).size.height * 0.85,
      child  : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isVisible)
            const SizedBox(
              width : 280,
              child : Text('Por favor, verifique que la Foto se vea Nitida',
                style     : TextStyle(fontSize: 22, wordSpacing: 2),
                textAlign : TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            image != null ?
            SizedBox(
              height : MediaQuery.of(context).size.height * 0.5,
              child  : Image.file(image!),
            ) :
            Padding(padding: const EdgeInsets.all(60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Por su seguridad, necesitamos algunas pruebas para Comprobar su Identidad',
                    style     : TextStyle(fontSize: 22, wordSpacing: 2),
                    textAlign : TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    child : const Text('SELFIE',
                      style : TextStyle(
                          fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      _getFromCamera();
                    },
                    style: ElevatedButton.styleFrom(
                      primary : const Color(0xFF1A477C),
                      padding : const EdgeInsets.symmetric(horizontal: 50),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            if (_isVisible)
            Column(
              children: [
                ElevatedButton(
                  child     : const Text('SIGUIENTE',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary : const Color(0xFF1A477C),
                    padding : const EdgeInsets.symmetric(horizontal: 35),
                  ),
                  // ignore: todo
                  // TODO: use the oldone if problems ---
                  //onPressed : () {
                  //  Routes.keyAth(context);
                  //},
                  onPressed: () {
                    context.read<ClientProvider>().getSelfie(selfie: image!);
                    RegisterUserStep2.getRegisterUserStep2(context);
                    //RegisterUserStep2.uploadImage("asd",context.read());
                    Routes.keyAuthRegister(context);
                  },
                ),
                OutlinedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize   : 18,
                      decoration : TextDecoration.none,
                      fontWeight : FontWeight.bold,
                    ),
                    primary   : const Color(0xFF1A477C)
                  ),
                  onPressed : () {
                    Routes.selfie(context);
                  },
                  child: const Text('Tomar de Nuevo',
                  )
                ),
              ]
            ),
          ],
      ),
    ),
        ),
    );
  }
}