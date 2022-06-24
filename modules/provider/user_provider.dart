import 'dart:io';

import 'package:bank9780/modules/general/classes.dart';
import 'package:flutter/cupertino.dart';


///  User Information building main class
///-----------------------------------------------------
///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
///  - email: 9780desarrollador09@gmail.com
///  - Date : 02/12/2021
class UserProvider extends ChangeNotifier {
  User user = User(
    pk              : 0,
    name            : 'Britany de las casas',
    surname         : 'De las Casas',
    pin             : '111111',
    document        : '45882123',
    address         : 'Calle Grau, Mz J, Lt. 15, Dpto. 302',
    cellphoneNumber : '904548460',
    paymentPlan     : 'Limitado',
    hasPhoto        : false,
    photo           : const AssetImage('lib/assets/logos/dataphoto1.png'),
    photopath       : Image.file(File('lib/assets/logos/dataphoto1.png'))
  );

  changePhoto(File image){
    user.photopath=Image.file(image);
    if (user.hasPhoto==false){
      user.hasPhoto=true;
    }
    notifyListeners();
  }
}