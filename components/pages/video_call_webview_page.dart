import 'dart:convert';
import 'dart:typed_data';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/src/provider.dart';

class VideoCallPageWebView extends StatefulWidget {
  const VideoCallPageWebView({Key? key}) : super(key: key);

  @override
  _VideoCallPageWebViewState createState() => _VideoCallPageWebViewState();
}

class _VideoCallPageWebViewState extends State<VideoCallPageWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        appBarName: "VideoLlamada",
        isInside: false,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: InAppWebView(
                    initialUrlRequest: URLRequest(
                        url: Uri.parse(context.read<ClientProvider>().videoLink!.urlVideoCall!),
                        body: Uint8List.fromList(utf8.encode("name=FooBar")),
                        headers: {
                          'Content-Type': 'application/x-www-form-urlencoded'
                        }),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        mediaPlaybackRequiresUserGesture: false,
                        //debuggingEnabled: true,
                      ),
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {},
                    androidOnPermissionRequest:
                        (InAppWebViewController controller, String origin,
                            List<String> resources) async {
                      return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
