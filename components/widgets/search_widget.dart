import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final textController = TextEditingController();
  static const List<String> _kOptions = <String>[
    'bitcoin',
    'bobcat',
    'chameleon',
  ];
  @override
void initState() {
  super.initState();

  // Start listening to changes.
  //textController.removeListener(() { });
}

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC4C4C4), width: 2.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Autocomplete<String>(
        //fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) => ,
      fieldViewBuilder: (
              BuildContext context,
              TextEditingController textController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted
              ) {
            return TextField(
        controller: textController,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.search,
            color: Color(0xFFC4C4C4),
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFFC4C4C4),
                  ),
                  onTap: () {
                    textController.clear();
                    widget.onChanged('');
                    //context.read<MenuProvider>().resizeList();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      );
          },
      
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    )
      //TextField(
      //  controller: textController,
      //  decoration: InputDecoration(
      //    icon: const Icon(
      //      Icons.search,
      //      color: Color(0xFF154579),
      //    ),
      //    suffixIcon: widget.text.isNotEmpty
      //        ? GestureDetector(
      //            child: const Icon(
      //              Icons.close,
      //              color: Color(0xFF154579),
      //            ),
      //            onTap: () {
      //              textController.clear();
      //              widget.onChanged('');
      //              //context.read<MenuProvider>().resizeList();
      //              FocusScope.of(context).requestFocus(FocusNode());
      //            },
      //          )
      //        : null,
      //    hintText: widget.hintText,
      //    hintStyle: style,
      //    border: InputBorder.none,
      //  ),
      //  style: style,
      //  onChanged: widget.onChanged,
      //),
    );
  }
}
