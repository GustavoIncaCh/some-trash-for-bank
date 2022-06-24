import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebviewFlutterPage extends StatelessWidget {
  const WebviewFlutterPage({Key? key}) : super(key: key);

  // _back() {}

  // _forward() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              SizedBox(
                //height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 1,
                child: const NavigatorWidget(
                  body: true,
                  bell: false,
                  logo: false,
                  menu: false,
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const WebView(
                    //debuggingEnabled: true,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: 'https://www.9780bitcoin.com/',
                  ),
                ),
              ),
            ])));
  }
}