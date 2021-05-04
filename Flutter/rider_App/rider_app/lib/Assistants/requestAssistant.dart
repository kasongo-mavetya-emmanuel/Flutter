import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestAssistant{

  static Future getRequest(url) async{
    http.Response response= await http.get(url);
    try{
      if(response.statusCode==200){
        dynamic jSonData= response.body;
        dynamic decodeData= jsonDecode(jSonData);
        return decodeData;
      }

      else{
        return 'failed';
      }
    }
    catch(e){
      return 'failed';
    }
  }
}