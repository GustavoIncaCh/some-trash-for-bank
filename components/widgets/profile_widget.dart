
import 'package:bank9780/modules/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:animations/animations.dart';

class ProfileWidget extends StatelessWidget {
  final ImageProvider<Object> imagePath;
  final VoidCallback onClickedPhoto;
  final VoidCallback onClickedGallery;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClickedPhoto,
    required this.onClickedGallery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Image(image: imagePath);

    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: OpenContainer(
              transitionType: ContainerTransitionType.fade,
              transitionDuration: const Duration(milliseconds: 1500),
              closedBuilder: (context, action) => Material(
                color: Colors.transparent,
                child: Ink.image(
                  image: image.image,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              openBuilder: (context, action) => const DetailScreen(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: BuildCircle(
                color: Colors.white,
                all: 3,
                child: BuildCircle(
                  color: const Color(0xff154579),
                  all: 8,
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.photo_camera,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: 150,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Foto de perfil",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(0xff154579),
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(45))),
                                          child: IconButton(
                                              onPressed: onClickedPhoto,
                                              icon: const Icon(
                                                Icons.photo_camera_rounded,
                                                color: Color(0xff154579),
                                              )),
                                        ),
                                        const SizedBox(height: 10,),
                                        const Text("Cámara"),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(0xff154579),
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(45))),
                                          child: IconButton(
                                            onPressed: onClickedGallery,
                                            icon: const Icon(
                                              Icons.photo,
                                              color: Color(0xff154579),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        const Text("Galería"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class BuildCircle extends StatelessWidget {
  const BuildCircle({
    Key? key,
    required this.child,
    required this.all,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final double all;
  final Color color;

  @override
  Widget build(BuildContext context) => ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: MyAppBar(appBarName: "Foto de perfil",isInside: false,),
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Foto de perfil"),
        //backgroundColor: Colors.black,
        backgroundColor: const Color(0xff154579),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                //Routes.home(context);
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image(
              image: context.watch<UserProvider>().user.hasPhoto
                  ? context.watch<UserProvider>().user.photopath.image
                  : context.watch<UserProvider>().user.photo,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
