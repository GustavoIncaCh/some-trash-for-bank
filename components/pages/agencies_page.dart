import 'dart:async';

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'package:mapbox_gl/mapbox_gl.dart';

class AgenciesPage extends StatelessWidget {
  const AgenciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(appBarName: "MIS AGENCIAS"),
        body: AgenciesBot());
  }
}

class AgenciesBot extends StatefulWidget {
  const AgenciesBot({Key? key}) : super(key: key);

  @override
  _AgenciesBotState createState() => _AgenciesBotState();
}

class _AgenciesBotState extends State<AgenciesBot> {
  final Completer<GoogleMapController> _controller = Completer();
  bool isBackPressedOrTouchedOutSide = false;
  bool isDropDownOpened = true;
  //LatLng storeLocation = const LatLng(-16.39819781766054, -71.53373638697535);

  late List<String> ubicationList = [];
  late Map<String, LatLng> ubicationMap = {};
  String selectedItem = 'Lista de Agencias';
  List<Marker> markers = [];
  String? selectedValue;
  LatLng place = const LatLng(-16.39819781766054, -71.53373638697535);

  @override
  void initState() {
    intilize();
    ubicationList = [
      "Av. Aramburú 118, of. 3, Miraflores", // -12.103509636404775, -77.03125940235793
      "Calle Rivero 115, Arequipa", // -16.39819781766054, -71.53373638697535
      "Jiron Gamarra 384, Trujillo", // -8.109303698454994, -79.02783253122071
      "Av. de la cultura Mza H, Lte 3, Cusco" // -13.527659791560131, -71.94204290234545
    ];
    super.initState();
  }

  void startState() {
    ubicationMap = {
      "Av. Aramburú 118, of. 3, Miraflores":
          const LatLng(-12.103509636404775, -77.03125940235793),
      "Calle Rivero 115, Arequipa":
          const LatLng(-16.39819781766054, -71.53373638697535),
      "Jiron Gamarra 384, Trujillo":
          const LatLng(-8.109303698454994, -79.02783253122071),
      "Av. de la cultura Mza H, Lte 3, Cusco":
          const LatLng(-13.527659791560131, -71.94204290234545),
    };
    super.initState();
  }

  intilize() {
    Marker firstMarker = Marker(
      markerId: const MarkerId("Av. Aramburú 118, of. 3, Miraflores"),
      position: const LatLng(-12.103509636404775, -77.03125940235793),
      infoWindow: const InfoWindow(
        title: "Av. Aramburú 118, of. 3, Miraflores",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      //consumeTapEvents: false,
    );

    Marker secondMarker = Marker(
      markerId: const MarkerId("alle Rivero 115, Arequipa"),
      position: const LatLng(-16.39819781766054, -71.53373638697535),
      infoWindow: const InfoWindow(
        title: "Calle Rivero 115, Arequipa",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    Marker thirdMarker = Marker(
      markerId: const MarkerId("Jiron Gamarra 384, Trujillo"),
      position: const LatLng(-8.109303698454994, -79.02783253122071),
      infoWindow: const InfoWindow(
        title: "Jiron Gamarra 384, Trujillo",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    Marker fourthMarker = Marker(
      markerId: const MarkerId("Av. de la cultura Mza H, Lte 3, Cusco"),
      position: const LatLng(-13.527659791560131, -71.94204290234545),
      infoWindow: const InfoWindow(
        title: "Av. de la cultura Mza H, Lte 3, Cusco",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );
    markers.add(firstMarker);
    markers.add(secondMarker);
    markers.add(thirdMarker);
    markers.add(fourthMarker);

    setState(() {});
  }


  //Marker _createMarker() => Marker(
  //      markerId: const MarkerId("marker_1"),
  //      position: LatLng(-12.103509636404775, -77.03125940235793),
  //      //icon: Icons.access_alarm,
  //    );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Para vivir una experiencia ILIMITADA y ser uno de los usuarios VIP',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const Text(
              '“Ven acércarte a nuestras oficinas y firma tu nuevo contrato para que puedas manejar montos mayores”.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonDecoration: BoxDecoration(
                      color: const Color(0xFF1A477C),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    dropdownDecoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      border: Border(),
                    ),
                    isExpanded: true,
                    //scrollbarThickness: 6,
                    iconEnabledColor: Colors.white,
                    buttonPadding: const EdgeInsets.only(right: 14, left: 14),
                    disabledHint: null,
                    //autofocus: false,
                    hint: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Agencias",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    dropdownElevation: 4,
                    items: ItemMenus.agenciesPage
                        .map(
                          (item) => DropdownMenuItem<ItemMenu>(
                            value: item,
                            child: Text(
                              item.text,
                              style: const TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        )
                        .toList(),
                    // ignore: todo
                    // TODO: Items from DataProvider API
                    //items: context
                    //    .watch<DataProvider>()
                    //    .agencies!
                    //    .data
                    //    .map(
                    //      (e) => DropdownItemMenu(
                    //        value: e,
                    //        child: Text(e.description),
                    //      ),
                    //    )
                    //    .toList(),
                    value: selectedValue,
                    onChanged: (value) async {
                      //print(context.watch<DataProvider>().account);
                      value as ItemMenu;
                      place = value.mapsItem;
                      final GoogleMapController controller =
                          await _controller.future;
                      controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                              bearing: 192.8334901395799,
                              target: place,
                              tilt: 59.440717697143555,
                              zoom: 16),
                        ),
                      );
                      // ItemMenus.onChanged(context, value as ItemMenu);
                      //value as ItemMenu;
                      //place=value.mapsItem;
                      //_goToTheLake;
                      //debugPrint(value.mapsItem.toString());
                      //        Future<void> _goToTheLake() async {
                      //  final GoogleMapController controller = await _controller.future;
                      //  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                      //    bearing: 192.8334901395799,
                      //    target: value.mapsItem,
                      //    tilt: 59.440717697143555,
                      //    zoom: 19.151926040649414),),);
                      //}
                    },

                    selectedItemBuilder: (BuildContext context) =>
                        ItemMenus.agenciesPage
                            .map(
                              (e) => Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  e.text,
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                )),
            const SizedBox(
              height: 25,
            ),
            //      FloatingActionButton.extended(
            //  onPressed: _goToTheLake,
            //  label: Text('To the lake!'),
            //  icon: Icon(Icons.directions_boat),
            //),
            SizedBox(
              height: 350,
              width: 350,
              child: Scaffold(
                body: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    //bearing: 192.8334901395799,
                    target: LatLng(-9.189967, -75.015152),
                    //tilt: 59.440717697143555
                    zoom: 4.75,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    //controller.getLatLng(LatLng(-9.0,1.0));
                  },
                  markers: markers.map((e) => e).toSet(),
                  //markers: Set<Marker>.of(markers.values),
                  //markers: <Marker>{_createMarker()},
                ),
              ),
            )
          ]),
    );
  }
}
