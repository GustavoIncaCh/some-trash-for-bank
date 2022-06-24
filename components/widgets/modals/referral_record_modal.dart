import 'package:bank9780/modules/general/button_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReferralRecord extends StatefulWidget {
  const ReferralRecord({
    Key? key,
    required this.context,
    required this.referralRecord,
  }) : super(key: key);

  final BuildContext context;
  final ReferralRecordItem referralRecord;

  @override
  State<ReferralRecord> createState() => _ReferralRecordState();
}

class _ReferralRecordState extends State<ReferralRecord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
          width: 2.5,
          color: Color(0xFF0C4F83),),
        ),
        //borderRadius: BorderRadius.all(Radius.circular(12.5))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Fecha:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Referido:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Tipo:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Criptomoneda:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Monto:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Comisión adquirida:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Plazo de cobro:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.referralRecord.date}",
                  ),
                Text(
                  widget.referralRecord.referral,
                  ),
                Text(
                  widget.referralRecord.type,
                  ),
                Text(
                  widget.referralRecord.coin,
                  ),
                Text(
                  widget.referralRecord.amount,
                  ),
                Text(
                  widget.referralRecord.comission,
                  ),
                Text(
                  widget.referralRecord.collectionPeriod,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
