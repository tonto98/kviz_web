import 'dart:convert';

abstract class ParamsMap { 
  Map<String, dynamic>? get paramsMapProps => null;

  
  String paramsToJson() {
    Map<String, dynamic> _map = {
      this.runtimeType.toString() : paramsMapProps
    };    

    try {        
      return json.encode(_map, toEncodable: (value)=> value.hashCode.toString());
    } catch (e) {
      throw e;
    }
  }
}