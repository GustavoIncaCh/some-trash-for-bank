import 'dart:io';

import 'package:bank9780/components/pages/agencies_page.dart';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/profile_widget.dart';
import 'package:bank9780/modules/provider/operation_provider.dart';
import 'package:bank9780/modules/provider/user_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  File? image;
  TextEditingController controller = TextEditingController();
  late FocusNode focusNode;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.text= context.read<OperationProvider>().loginData['direccion'].toString();
    focusNode = FocusNode();
  }

  Future pickImage(ImageSource action) async {
    try {
      final image = await ImagePicker().pickImage(source: action);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        context.read<UserProvider>().changePhoto(this.image!);
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      debugPrint("object"+e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const MyAppBar(appBarName: "MIS DATOS"),
      //body: SizedBox(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileWidget(
                    imagePath: context.watch<UserProvider>().user.hasPhoto
                        ? context.watch<UserProvider>().user.photopath.image
                        : context.watch<UserProvider>().user.photo,
                    onClickedPhoto: () {
                      pickImage(ImageSource.camera);
                    },
                    onClickedGallery: () {
                      pickImage(ImageSource.gallery);
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Row(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      //  children: [
                      //    Text(
                      //      context
                      //          .watch<UserProvider>()
                      //          .user
                      //          .name
                      //          .split(' ')
                      //          .first,
                      //      style: const TextStyle(
                      //          fontSize: 20, fontWeight: FontWeight.bold),
                      //    ),
                      //    IconButton(
                      //      onPressed: () {
                      //        Routes.changevideo(context);
                      //      },
                      //      icon: const Icon(
                      //        Icons.border_color_rounded,
                      //        size: 20,
                      //      ),
                      //    ),
                      //  ],
                      //),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Text(
                          //    context
                          //        .watch<UserProvider>()
                          //        .user
                          //        .name
                          //        .split(' ')
                          //        .first,
                          //    style: const TextStyle(
                          //        fontSize: 18, fontWeight: FontWeight.bold)),
                          //Text(
                          //  context
                          //      .watch<ClientProvider>()
                          //      .clientRegister!
                          //      .names
                          //      .split(" ")
                          //      .first,
                          //  style: const TextStyle(
                          //      fontSize: 18, fontWeight: FontWeight.bold),
                          //),
                          Text(
                              context
                                  .watch<OperationProvider>()
                                  .loginData['nombres']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            context
                                .watch<OperationProvider>()
                                .loginData['apellidos']
                                .toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Nombres',
                            style: TextStyle(
                              color: Color(0xFF7D7676),
                            ),
                          ),
                          Text(
                            'Apellido',
                            style: TextStyle(
                              color: Color(0xFF7D7676),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Align(
                        child: Text(
                          context
                              .watch<OperationProvider>()
                              .loginData['nroDocumento']
                              .toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      const Align(
                        child: Text(
                          'DNI',
                          style: TextStyle(
                            color: Color(0xFF7D7676),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context
                                    .watch<OperationProvider>()
                                    .loginData['telefono']
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Teléfono',
                                style: TextStyle(
                                  color: Color(0xFF7D7676),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Routes.changenumber(context);
                              //print(context
                              //    .read<OperationProvider>()
                              //    .loginData
                              //    .toString());
                              //print(context
                              //    .read<OperationProvider>()
                              //    .loginData['nombres']
                              //    .toString());
                            },
                            icon: const Icon(
                              Icons.border_color_rounded,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Theme(
                                  data: ThemeData(hintColor: Colors.black),
                                  child: TextField(
                                    controller: controller,
                                    focusNode: focusNode,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                     // labelText: context
                                     //     .watch<OperationProvider>()
                                     //     .loginData['direccion']
                                     //     .toString(),
                                      //hintMaxLines: 1,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const Text(
                                'Ubicación',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF7D7676),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              focusNode.requestFocus();
                            },
                            icon: const Icon(
                              Icons.border_color_rounded,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Align(
                        child: Text(
                          // ignore: todo
                          // TODO: API DOESNT HAVE A METHOD FOR THE PAYMENTPLAN
                          context.watch<UserProvider>().user.paymentPlan,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      const Align(
                        child: Text('Plan Actual',
                            style: TextStyle(
                              color: Color(0xFF7D7676),
                            )),
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    //color: Color(0xFF154579),
                                    decoration: TextDecoration.underline,
                                    fontSize: 13),
                                primary: const Color(0xFF0A557A),
                              ),
                              onPressed: () {
                                //Routes.agencies(context);
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const AgenciesPage(),
                                      settings: const RouteSettings(
                                          name: '/agencies'),
                                    ));
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.error_outline,
                                    color: Color(0xFF0A557A),
                                    size: 18,
                                  ),
                                  Text('Cambiar a Plan Ilimitado'),
                                ],
                              )),
                          SizedBox(
                            width: 120,
                            height: 35,
                            child: CupertinoTextField(
                              placeholder: 'Código Tienda',
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFF0A5F93)),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '¡ Es gratuito !',
                          style: TextStyle(
                              color: Color(0xFF0A557A),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
                          onPressed: () {
                            //routes.tutorial(context);
                          },
                          child: const Text(
                            'CANCELAR',
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
