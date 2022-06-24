import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';


class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(appBarName: 'ABOUT US'),
        body: SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
              child : Column(
                children: [
                Expanded(child: Information())
                ]),
          )
        )
      );
    //);
  }
}

class Information extends StatelessWidget {
  Information({Key? key}) : super(key: key);

  final List<List<String>> urls = [
    ['lib/assets/logos/Fb_logo.png', 'https://www.facebook.com/9780Bitcoin/'],
    ['lib/assets/logos/Tw_logo.png', 'https://twitter.com/9780bitcoin'],
    ['lib/assets/logos/Tt_logo.png', 'https://www.tiktok.com/search?q=9780%20bitcoin&t=1638910325428'],
    ['lib/assets/logos/Yt_logo.png', 'https://www.youtube.com/channel/UCtvW2aceNFkKNUHQp28jVEg'],
    ['lib/assets/logos/Ig_logo.png', 'https://www.instagram.com/9780bitcoin/']
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child   : Column(
        crossAxisAlignment : CrossAxisAlignment.center,
        mainAxisAlignment  : MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment : MainAxisAlignment.center,
            children          : [Image.asset('lib/assets/img/Group 10.png'),
            const Text('Powered by 9780 Bank S. A.',
              style: TextStyle(fontSize: 16))
            ]
          ),
          const SizedBox(height: 20),
          const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut bibendum est nunc, non convallis eros posuere eget. Nulla facilisi. Nulla pulvinar vel nibh et tincidunt. Sed justo ipsum, condimentum non placerat malesuada, efficitur ut quam.',
            style: TextStyle(
              fontWeight : FontWeight.bold,
              fontSize   : 18
            ),
            textAlign  : TextAlign.center,
          ),
          const SizedBox(height: 30),
          Container(
            height : MediaQuery.of(context).size.height * 0.35,
            width  : MediaQuery.of(context).size.width * 0.65,
            decoration  : BoxDecoration(
              boxShadow : [BoxShadow(
                spreadRadius : 5,
                blurRadius   : 7,
                color        : Colors.grey.withOpacity(0.3),
                offset       : const Offset(1, 3), // changes position of shadow
              )],
              //border: Border.all(color: Colors.black),
              // image: const DecorationImage(
              //   image: AssetImage('lib/assets/img/profile.png'),
              //   fit: BoxFit.fill,
            ),
            //shape: BoxShape.circle,
          ),
          //)
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment : MainAxisAlignment.spaceEvenly,
            children          : urls.map((e) => InkWell(
              onTap  : () => debugPrint(e.last),
              child  : Image.asset(e[0],
              height : 50))
            ).toList()
          )
        ],
      )
    );
  }
}