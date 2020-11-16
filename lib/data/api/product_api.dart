import 'package:http/http.dart' as http;

class ProductApi{
  static Future getProducts(){
    return http.get("http://10.0.2.2:3000/products");
    // emulator un local hostunu kullanmaliyiz
    // default oalrak 10.0.2.2 bu adrestir,
    // emulatorun icinde android isletim sistemi vardir

  }
  static Future getProductsByCategoryId(int categoryId){
    return http.get("http://10.0.2.2:3000/products?categoryId=$categoryId");
  }



}