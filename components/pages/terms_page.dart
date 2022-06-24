import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/src/provider.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          appBarName: "TÉRMINOS Y CONDICIONES",
          isInside: false,
        ),
        body: TermsData());
  }
}

class TermsData extends StatefulWidget {
  const TermsData({Key? key}) : super(key: key);

  @override
  _TermsDataState createState() => _TermsDataState();
}

class _TermsDataState extends State<TermsData> {
  bool _isVisible = false;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    String htmlData =
        context.watch<DataProvider>().terms!.data![0].value!.description!;
            
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //const Text('TÉRMINOS Y CONDICIONES'),
        Expanded(
          child: SizedBox(
              child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  children: [
                Column(
                  children: [
                    //Text("GetTerms"),
                    //Text(),
                    Html(data: htmlData),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: const Color(0xFF0A5F93),
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            });
                          },
                          //(value) => setState(() => this.value = value!)
                          //(_isVisible) => setState(() => this._isVisible = _isVisible!),
                        ),
                        const Text(
                          'Acepto los términos y Condiciones',
                          style: TextStyle(
                            color: Color(0xFF0A5F93),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (_isVisible)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    //padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Column(
                      children: [
                        ElevatedButton(
                          child: const Text(
                            'ACEPTO',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // ignore: todo
                          // TODO: Process is defined to call the pinboard buton text, change it
                          // ignore: todo
                          // TODO: according to the process that has been taken
                          onPressed: () {
                            context
                                .read<ClientProvider>()
                                .switchTerms(state: true);
                            Navigator.pop(context);
                            //Routes.pinPageRegister(context: context, process: Process.register, pages: Pages.waiting);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF1A477C),
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                          ),
                        ),
                      ],
                    ),
                  ),
              ])),
        )
      ],
    );
  }
}
