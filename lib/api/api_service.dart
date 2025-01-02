import 'dart:convert';
import 'package:api_practise/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Fetch all products from Api

  Future<List<Product>> fetchAllProducts() async {
    const String url = "https://fakestoreapi.com/products";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        List<Product> products = responseData.map((json) {
          return Product.fromJson(json);
        }).toList();
        return products;
      } else {
        print("Failed to fetch products status code: ${response.statusCode}");
        throw Exception("Failed to fetch products");
      }
    } catch (error) {
      print("Error in fetching products: $error");
      throw Exception("Failed to fetch products");
    }
  }

  //Fetch single product from Api

  Future<Product> fetchSingleProduct(int id) async {
    final String url = "https://fakestoreapi.com/products/$id";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Product product = Product.fromJson(json.decode(response.body));
        return product;
      } else {
        print(
            "Failed to fetch single product status code: ${response.statusCode}");
        throw Exception("Failed to fetch single product");
      }
    } catch (error) {
      print("Error in fetching single product: $error");
      throw Exception("Failed to fetch single product");
    }
  }

//Add a product to API

  Future<Product> addProduct(Product product) async {
    const String url = "https://fakestoreapi.com/products";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(product.toJson()),
      );

      print("response status code: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("response :${response.body}");

        Product newProduct = Product.fromJson(json.decode(response.body));
        return newProduct;
      } else {
        print("Failed to add product status code: ${response.statusCode}");
        throw Exception("Failed to add product");
      }
    } catch (error) {
      print("Error in adding product: $error");
      throw Exception("Failed to add product");
    }
  }

//Update a product in API

  Future<Product> updateProduct(int id, Product product) async {
    final String url = "https://fakestoreapi.com/products/${id}";
   

   try{
     final response  = await http.put(
       Uri.parse(url),
       headers: {"Content-Type": "application/json"},
       body: json.encode(product.toJson()),
     );
      if (response.statusCode == 200) {
        Product updatedProduct = Product.fromJson(json.decode(response.body));
        return updatedProduct;
      } else {
        print("Failed to update product status code: ${response.statusCode}");
        throw Exception("Failed to update product");
      }
    } catch (error) {
      print("Error in updating product: $error");
      throw Exception("Failed to update product");
    }
  }
}
