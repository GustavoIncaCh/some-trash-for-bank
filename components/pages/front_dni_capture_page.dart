import 'dart:io';

import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../modules/provider/user_provider.dart';

class FrontDniCapturePage extends StatelessWidget {
  const FrontDniCapturePage({ Key? key }) : super(key: key);

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
                  //   color: const Color(0xFF154579),
                  //   height : MediaQuery.of(context).size.height * 0.1,
                  //   width  : MediaQuery.of(context).size.width,
                  //   child  :
                    NavigatorWidget(
                      body : true,
                      logo : false,
                      text : 'REGISTRO',
                      bell : false,
                      menu : false
                    ),
                  //),
                  Expanded(child: FrontCapture())
                ]),
            ),
        )
      )
    );
  }
}

class FrontCapture extends StatefulWidget {
  const FrontCapture({ Key? key }) : super(key: key);

  @override
  _FrontCaptureState createState() => _FrontCaptureState();
}

class _FrontCaptureState extends State<FrontCapture> {
  File? frontImage;
  bool _isVisible = false;

  void _getFromCamera() async {
  XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera,
  maxHeight : 1080,
  maxWidth  : 1080,
  );
  setState(() {
    frontImage = File(pickedFile!.path);
    print("image1");
    print(frontImage);
  });
  setState(() {
    frontImage = File(pickedFile!.path);
    setState(() {
      _isVisible = !_isVisible;
    print("image2");
    print(frontImage);
    });
  });
}//   });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_isVisible)
        const SizedBox(
          width : 280,
          child : Text('Por favor, verifique que la Foto se vea Nitida',
            style     : TextStyle(fontSize: 20, wordSpacing: 2),
            textAlign : TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        frontImage !=null ?
        SizedBox(
          height : MediaQuery.of(context).size.height * 0.4,
          width  : MediaQuery.of(context).size.width * 0.9,
          child  : Column(
            children: [
              SizedBox(
                height : MediaQuery.of(context).size.height * 0.4,
                width  : 400,
                child  : Image.file(frontImage!)
              ),
            ],
          ),
        ) :
        Padding(padding: const EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Por su seguridad, necesitamos algunas pruebas para Comprobar su Identidad',
                style     : TextStyle(fontSize: 22, wordSpacing: 2),
                textAlign : TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text('Fotografie de manera horizontal la parte frontal de su DNI',
              //const Text('Fotografie de manera horizontal la cara anterior de su DNI',
                style     : TextStyle(fontSize: 22, wordSpacing: 2),
                textAlign : TextAlign.center,
              ),
              //Image.asset('lib/assets/img/'),
              const SizedBox(height: 20),
              ElevatedButton(
                child : const Text('DNI',
                  style : TextStyle(
                      fontSize: 18,
                  ),
                ),
                onPressed: () {
                  //Image.file(frontImage!);
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
              onPressed : () {
                context.read<UserProvider>().user.hasPhoto = true;
                context.read<UserProvider>().user.photopath=Image.file(frontImage!);
                context.read<ClientProvider>().getDniFront(dniFront: frontImage!);
                Routes.dnibackcap(context);
                //Routes.videocallwebview(context);
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
              child: const Text('Tomar de Nuevo',
              ),
              onPressed : () {
                Routes.dnifrontcap(context);
              },
            ),
          ]
        ),
      ],
    );
  }
}