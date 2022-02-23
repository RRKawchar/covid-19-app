import 'dart:convert';
import 'package:covid19_api_app/Model/ModelTwo.dart';
import 'package:covid19_api_app/services/Utilities/app_url.dart';
import 'package:http/http.dart'as http;

class StateServices{

  Future<ModelTwo> fetchStateRecord()async{
    var data;
     final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

     if(response.statusCode==200){

        data=await jsonDecode(response.body.toString());

         print(data);

        return await ModelTwo.fromJson(data);

     }else{
       throw Exception("Error");
     }
  }

  Future<List<dynamic>> countrylistRecord()async{
    var data ;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    print(response.statusCode.toString());
    print(data);

    if (response.statusCode == 200) {
      data = await jsonDecode(response.body.toString());
      return await data;
    } else {
      throw Exception('Error');
    }
  }
}