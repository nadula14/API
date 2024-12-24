import 'package:api_practise/api/api_service.dart';
import 'package:api_practise/models/product_model.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final int productId;

  SingleProduct({super.key, required this.productId});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Product Details"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Product>(
            future: apiService.fetchSingleProduct(productId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("No data found"),
                );
              } else {
                Product product = snapshot.data!;
                
                return Padding(padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(product.image, height: 300, width: 300),
                      const SizedBox(height: 10),
                      Text("Name: ${product.title}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10),
                      Text("Price: \$${product.price}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10),
                      Text("Description: ${product.description}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                ),
                );
              }
            }
            ),
      ),
    );
  }
}
