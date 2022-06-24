
import 'package:bank9780/assets/data_list/list_visitor_page.dart';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/target_widget.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class VisitorTutorialPage extends StatefulWidget {
  const VisitorTutorialPage({Key? key}) : super(key: key);

  @override
  State<VisitorTutorialPage> createState() => _VisitorTutorialPageState();
}

//class StreamSocket{
//  final _socketResponse= StreamController<String>();
//
//  void Function(String) get addResponse => _socketResponse.sink.add;
//
//  Stream<String> get getResponse => _socketResponse.stream;
//
//  void dispose(){
//    _socketResponse.close();
//  }
//}

class _VisitorTutorialPageState extends State<VisitorTutorialPage> {
  String? selectedValue;
  //static List<String> visitorButtons = ["BTC", "S/.", "\$"];

  late List<VisitorItem> visitorButtons =
      context.read<VisitorProvider>().allVisitor;

  final CarouselController _controller = CarouselController();

  final listKey = GlobalKey<AnimatedListState>();
  //StreamSocket streamSocket =StreamSocket();

  //IO.Socket socket = IO.io('http://localhost:3000');
  @override
  void initState() {
    super.initState();
    //coinsItems = MenuProvider().allCoins;
  }

  //@override
  //void dispose(){
  //  _socketResponse.close();
  //}


  /// todo: answer to the server just to confirm the conectivity
  /// web socket with ioclient
  
  @override
  Widget build(BuildContext context) {
    // todo: header for the sockets call
    Map<String, String> socketMap = {
      'tenant': DataProvider().country.name.toUpperCase(),
      //'token': context.read<ClientProvider>().firstRegisterJson!.token!
    };
    // change to server ip
    // set the new query to make the call
    // if no query needed remove the line with .setQuery
    IO.Socket socket = IO.io(
        'http://192.168.3.24:3000',
        OptionBuilder()
            .setTransports(['websocket'])
            .setQuery(socketMap)
            .build());

    //socket.onConnect((_) {
    // print('connect');
    // socket.emit('msg', 'test');
    //});
    //socket.emit('msg', 'test');
    //socket.ack("asd");
    //socket.send(<String>['rony',"hola"]);
    print("socket entra");
    socket.on('videocall', (data) {
      //final dataList = data as String;
      //final ack = dataList.last as Function;
      //ack(null);
      //socket.emit('msg', 'test');
      //socket.ack("asd");
      //socket.send(<String>['rony',"hola"]);
      //socket.query;
      //socket.json.ack("asd");
      //print(socket.query);
      //socket.onConnect((_) {
      // print('connect');
      // socket.emit('msg', 'is a test');
      //});
      //print("object");
      //  print(socket.connected.toString()+"asd");
      print("socket entra data");
      print(data);
      //socket.emit("typing",
      //  {
      //    "id": "holaaaaaaaaaaaa envio socket",
      //     "typing": "Se envia algooooooooooooo",
      //  });
    });

    //debugPrint('token'+context.read<ClientProvider>().firstRegisterJson!.token.toString());
    //debugPrint('user'+context.read<ClientProvider>().firstRegisterJson!.idUser.toString());
    //debugPrint('device'+context.read<ClientProvider>().firstRegisterJson!.idDevice.toString());

    //When an event recieved from server, data is added to the stream
//    socket.on('videocall', (data) {
//      streamSocket.addResponse;
//      print(data);
//
//    print("object");
//      print(socket.connected.toString()+"asd");
//      socket.emit("typing",
//      {
//        "id": "holaaaaaaaaaaaa envio socket",
//         "typing": "Se envia algooooooooooooo",
//      });
//      });
//    socket.onDisconnect((_) => print('disconnect'));//

//socket.emit("typing",
//      {
//        "id": "holaaaaaaaaaaaa envio socket",
//         "typing": "Se envia algooooooooooooo",
//      });

    List<Widget> imageSliders = context
        .read<DataProvider>()
        .tokens
        .map((item) => Container(
              height: 100,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(item.logo),
                      Text(
                        item.symbol,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  )),
            ))
        .toList();

    @override
    void dispose() {
      socket.close();
      super.dispose();
    }

    return Scaffold(
      appBar: const MyAppBar(
        appBarName: "Vistante",
        isInside: false,
        needImage: true,
      ),
      body: Container(
        //color: Colors.white,
        decoration: Skin.gradientDecoration(),

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 25,
            ),
            const TargetWidget(),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: SizedBox(
                width: 175,
                height: 150,
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      height: 50,
                      scrollDirection: Axis.vertical,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      aspectRatio: 0.5,
                      viewportFraction: 0.35,
                      onPageChanged: (index, reason) {
                        //setState() {
                        //debugPrint(index.toString());
                        //};
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        child: BottomAppBar(
          elevation: 0,
          //color: const Color(0xff154579),
          color: Colors.transparent,
          //elevation: 800,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BottomButon(
                tittle: "Operación",
                icon: Icons.sync_alt,
                context: context,
                text:
                    "En esta sección podrás realizar envíos y recepciones en criptomonedas, soles y dólares.",
                color: const Color(0xFFB8F5F9),
              ),
              BottomButon(
                tittle: "Intercambio",
                icon: Icons.attach_money,
                context: context,
                text:
                    "En esta sección podrás realizar intercambios entre 2 diferentes criptomonedas.",
                color: const Color(0xFFD4F0F8),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0.0),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero),
                      backgroundColor: MaterialStateProperty.all<Color?>(
                          Colors.transparent)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.home,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text("Home",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 10))
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              BottomButon(
                tittle: "Servicios",
                icon: Icons.account_balance_wallet_outlined,
                context: context,
                text:
                    "En esta sección podrás realizar pagos de diferentes servicios básicos desde tu App.",
                color: const Color(0xFFEBCC9C),
              ),
              BottomButon(
                tittle: "Comprar - Vender",
                icon: Icons.real_estate_agent_outlined,
                context: context,
                text:
                    "En esta sección podrás comprar y vender criptomonedas, soles y dólares.",
                color: const Color(0xFFD7EFA4),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}

// ignore: must_be_immutable
class BottomButon extends StatelessWidget {
  BottomButon({
    Key? key,
    required this.tittle,
    required this.icon,
    required this.context,
    required this.text,
    required this.color,
  }) : super(key: key);

  String tittle;
  IconData icon;
  BuildContext context;
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            backgroundColor:
                MaterialStateProperty.all<Color?>(Colors.transparent)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              Text(tittle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 10))
            ],
          ),
        ),
        onPressed: () {
          showGeneralDialog(
            barrierColor: Colors.transparent,
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              final curvedValue =
                  Curves.easeInOutBack.transform(animation.value) - 1.0;
              return Transform(
                transform:
                    Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                child: Opacity(
                  opacity: animation.value,
                  child: Dialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    backgroundColor: color,
                    alignment: const Alignment(0, 0.7),
                    elevation: 0.0,
                    insetAnimationCurve: Curves.elasticOut,

                    //clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12.5),
                      child: Text(text,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16)),
                    ),
                  ),
                ),
              );
            },
            barrierLabel: '',
            transitionDuration: const Duration(milliseconds: 250),
            barrierDismissible: true,
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) {
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
