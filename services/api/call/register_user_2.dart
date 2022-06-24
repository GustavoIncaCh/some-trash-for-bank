import 'dart:async';
import 'dart:convert';
import 'dart:io';
//import 'dart:io' as IO;
import 'package:dio/src/multipart_file.dart' as IOM;
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

import 'package:bank9780/properties/variables.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/src/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../modules/provider/client_provider.dart';
import '../../../modules/provider/data_provider.dart';
import '../json/client_register_json.dart';
import 'dart:typed_data';

//import '../json/RegisterUserStep2_json.dart';



class RegisterUserStep2{
  //Uint8List imgbytes = await context.read<ClientProvider>().dniBack.readAsBytes();
  //FormData

  // var formData = FormData();
  // formData.addFile('file', await File('picture.png').readAsBytes(),
  // filename: 'myPicture.png', contentType: 'image/png');
  
  static Future<bool> getRegisterUserStep2(BuildContext context) async {
    // debugPrint("----------------------------------------");
    //   debugPrint(context.read<ClientProvider>().dniBack!.toString());
    //   debugPrint("----------------------------------------");
    //   debugPrint(context.read<ClientProvider>().dniFront!.toString());
    //   debugPrint("----------------------------------------");
    // Dio dio = Dio();
    // try{
    // String fileName = context.read<ClientProvider>().dniBack!.path.split('/').last;
    // print(fileName);
    // print("provider "+context.read<ClientProvider>().dniBack!.path);
    // FormData data = FormData.fromMap({
    //   "imageLater": await IOM.MultipartFile.fromFile(
    //     context.read<ClientProvider>().dniBack!.path,
    //     filename: fileName,
    //   ),
    //   "imageFrontal": await IOM.MultipartFile.fromFile(
    //     context.read<ClientProvider>().dniBack!.path,
    //     filename: fileName,
    //   ),
    //   "imageSelfie": await IOM.MultipartFile.fromFile(
    //     context.read<ClientProvider>().dniBack!.path,
    //     filename: fileName,
    //   ),
    // });
    // await IOM.MultipartFile.fromFile(
    //     context.read<ClientProvider>().dniBack!.path,
    //     filename: fileName,
    //     contentType: MediaType('image','jpg'),
    //     //"type": "image/jpg"
    //   );
    //   var response = await dio.post(
    //     Variables.apiPaths.registerUserStep2, 
    //     data: data, 
    //     options: Options(
    //       headers: {
    //         'Authorization': 'Bearer ${context.read<ClientProvider>().firstRegisterJson!.token!}',
    //         //HttpHeaders.authorizationHeader: context.read<ClientProvider>().firstRegisterJson!.token!,
    //         'Content-Type'  : 'application/json; charset=UTF-8',
    //         'tenant'        : context.read<DataProvider>().country.name.toUpperCase(),
    //         'device'        : context.read<ClientProvider>().firstRegisterJson!.idDevice!
    //       }
    //     ),
    //   );
    // return response.statusCode == 200;
    // }catch(e){
    //   print(e);
    //   return false;
    // }


//uploadImage(String title, File file) async{
 try{
   String myFileName = context.read<ClientProvider>().dniBack!.path.split('/').last;
   String myFileName2 = context.read<ClientProvider>().dniFront!.path.split('/').last;
   String myFileName3 = context.read<ClientProvider>().selfie!.path.split('/').last;
  var request = http.MultipartRequest("POST",Uri.parse("http://192.168.3.21:3000/client/registerUserStep2"));

  //request.fields['title'] = "dummyImage";
  request.headers['Authorization'] = 'Bearer ${context.read<ClientProvider>().firstRegisterJson!.token!}';
  request.headers['Content-Type'] = 'application/json; charset=UTF-8';
  request.headers['tenant'] = context.read<DataProvider>().country.name.toUpperCase();
  request.headers['device'] = context.read<ClientProvider>().firstRegisterJson!.idDevice!;
  request.headers['idUser'] = context.read<ClientProvider>().firstRegisterJson!.idUser!;

  print('Bearer ${context.read<ClientProvider>().firstRegisterJson!.token!}');
  print("device "+context.read<ClientProvider>().firstRegisterJson!.idDevice!);

// for asset images
//  var picture = http.MultipartFile.fromBytes('image', (await rootBundle.load('assets/testimage.png')).buffer.asUint8List(),
//   filename: 'testimage.png');

  var picture = http.MultipartFile.fromBytes('imageLater', (await context.read<ClientProvider>().dniBack!.readAsBytes()).buffer.asUint8List(),
  filename: myFileName,
  contentType: MediaType('image', 'jpg'));
  var picture2 = http.MultipartFile.fromBytes('imageFrontal', (await context.read<ClientProvider>().dniFront!.readAsBytes()).buffer.asUint8List(),
  filename: myFileName2,
  contentType: MediaType('image', 'jpg'));
  var picture3 = http.MultipartFile.fromBytes('imageSelfie', (await context.read<ClientProvider>().selfie!.readAsBytes()).buffer.asUint8List(),
  filename: myFileName3,
  contentType: MediaType('image', 'jpg'));

  request.files.add(picture);
  request.files.add(picture2);
  request.files.add(picture3);

  var response = await request.send();

  var responseData = await response.stream.toBytes();

  var result = String.fromCharCodes(responseData);

  print(result);

return false;
 } catch (e){
   print(e);
   //return false;
 //}

}
return false;
    
    // try{
    //   ClientRegisterJson client = context.read<ClientProvider>().clientRegister!;
    //   // Make an Api call for getting full countries list
    //   Uint8List imgbytesDNIBack = await context.read<ClientProvider>().dniBack!.readAsBytes();
    //   Uint8List imgbytesDNIFront = await context.read<ClientProvider>().dniBack!.readAsBytes();
    //   Uint8List imgbytesSelfie = await context.read<ClientProvider>().dniBack!.readAsBytes();
    //   String bs4strDNIBack = base64.encode(imgbytesDNIBack);
    //   String bs4strDNIFront = base64.encode(imgbytesDNIFront);
    //   String bs4strSelfie = base64.encode(imgbytesSelfie);
    //   //Blob aea = new Blob(imgbytesDNIBack);
    //   final response = await Client().post(
    //     Uri.parse(Variables.apiPaths.registerUserStep2),
    //     headers: <String, String>{
    //       'Authorization': 'Bearer ${context.read<ClientProvider>().firstRegisterJson!.token!}',
    //       //HttpHeaders.authorizationHeader: context.read<ClientProvider>().firstRegisterJson!.token!,
    //       'Content-Type'  : 'application/json; charset=UTF-8',
    //       'tenant'        : context.read<DataProvider>().country.name.toUpperCase(),
    //       'device'        : context.read<ClientProvider>().firstRegisterJson!.idDevice!
    //     },
    //     body: //data
    //     jsonEncode(
    //       <String, dynamic>
    //       //data
    //     {
    //     //   // add de phone code
    //     //   //"code"                : context.read<ClientProvider>().securityCode,
    //     //   //context.read<ClientProvider>().dniBack,
    //        'imageLater'        : bs4strDNIBack,
    //        'imageFrontal'      : bs4strDNIBack,
    //        'imageSelfie'       : bs4strDNIBack,
    //     }
    //     ),
    //     //context.read<ClientProvider>().dniBack,
    //   ).timeout(Variables.apiCallBack);

    //   debugPrint("----------------------------------------");
    //   debugPrint(context.read<ClientProvider>().dniBack!.toString());
    //   debugPrint("----------------------------------------");
    //   debugPrint(context.read<ClientProvider>().dniFront!.toString());
    //   debugPrint("----------------------------------------");
    //   debugPrint(response.body.toString());
    //   debugPrint("answer");
    //   debugPrint(context.read<ClientProvider>().securityCode.toString());

    //   return response.statusCode == 200;
    // }
    // on TimeoutException { debugPrint('getRegisterUserStep2 [ Timeout ] exception'); return false; }
    // on SocketException  { debugPrint('getRegisterUserStep2 [ Socket  ] exception'); return false; }
    // on ClientException  { debugPrint('getRegisterUserStep2 [ Client  ] exception'); return false; }
    // catch (e) { debugPrint('getRegisterUserStep2 [ Code    ] exception ' + e.toString()); return false; }
  }
}