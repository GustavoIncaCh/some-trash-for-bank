//import 'package:bank9780/components/widgets/app_bar_widget.dart';
//import 'package:flutter/material.dart';
//import 'package:agora_uikit/agora_uikit.dart';
//
//class VideoCallPage extends StatefulWidget{
//  const VideoCallPage({Key? key}) : super(key: key);
//
//  @override
//  State<VideoCallPage> createState() => _VideoCallPageState();
//}
//
//class _VideoCallPageState extends State<VideoCallPage>{
//  AgoraClient client = AgoraClient(
//      agoraConnectionData: AgoraConnectionData(
//          appId: "445b5f91d3c94db890aa89abef004d4a", channelName: "Prueba"),
//      enabledPermission: [Permission.camera, Permission.microphone]);
//
//  @override
//  void initState() {
//    super.initState();
//    client.initialize();
//  }
//  
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: const MyAppBar(appBarName: "MIS DATOS"),
//      resizeToAvoidBottomInset: false,
//      body: Stack(
//        children: [
//          AgoraVideoViewer(client: client),
//          AgoraVideoButtons(
//            client: client,
//          ),
//        ],
//      ),
//    );
//  }
//}