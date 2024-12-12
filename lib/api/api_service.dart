import 'dart:convert';
import 'package:api_practise/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
 // Fetch all products from Api

  Future<List<Product>> fetchAllProducts()async{
    const String url = "https://fakestoreapi.com/products";

    try {
        final response = await http.get(Uri.parse(url));

        if(response.statusCode == 200){
            List<dynamic> responseData = json.decode(response.body);
            List<Product> products = responseData.map((json){
             return Product.fromJson(json); 
            }).toList();
            return products;
        }
        else{
          print("Failed to fetch products status code: ${response.statusCode}");
          throw Exception("Failed to fetch products");

        }
    }
    catch(error){
      print ("Error in fetching products: $error");
      throw Exception("Failed to fetch products");
    }
 }
}
