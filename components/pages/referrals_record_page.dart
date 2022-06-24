import 'package:bank9780/assets/data_list/list_referral_record.dart';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/modals/referral_record_modal.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:flutter/material.dart';

class ReferralsRecordPage extends StatefulWidget {
  const ReferralsRecordPage({Key? key}) : super(key: key);

  @override
  State<ReferralsRecordPage> createState() => _ReferralsRecordPageState();
}

class _ReferralsRecordPageState extends State<ReferralsRecordPage> {
  late List<ReferralRecordItem> referralItems;
  @override
  void initState() {
    super.initState();
    referralItems = allReferalRecord;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        appBarName: "HISTORIAL DE REFERIDOS",
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width*0.9,
          child: ListView.builder(
                itemCount: referralItems.length,
                /// here we have the index of the list, we can acces
                /// the list of coins here
                itemBuilder: (context, index) {
                  final referral = referralItems[index];
                  /// Here we call the function to create
                  /// the box of the coinItem, we must call
                  /// the item from the list of CoinItems
                  /// CoinItems is located in "list_porfolio.dart"
                  return ReferralRecord(context: context, referralRecord: referral);
                },
              ),
        ),
      ),
      //body: SizedBox(
      //body: SafeArea(
      //  child: ClipRRect(
      //    borderRadius: const BorderRadius.all(Radius.circular(20)),
      //    child: Container(
      //      color: Colors.white,
      //      child: Column(children: [
      //        // Container(
      //        //   color: const Color(0xFF154579),
      //        //   height : MediaQuery.of(context).size.height * 0.1,
      //        //   width  : MediaQuery.of(context).size.width,
      //        //   child  :
      //        const NavigatorWidget(
      //            body: true,
      //            logo: false,
      //            text: 'HISTORIAL REFERIDOS',
      //            bell: true,
      //            menu: true),
      //        //),
      //        Expanded(child: ReferralsRecord())
      //      ]),
      //    ),
      //  ),
      //),
    );
  }
}