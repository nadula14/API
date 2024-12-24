class Product {
  final int? id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category});

   // Api eken json wdiht ena object ek dart object ekk karagnnwa
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
    );
  }
   // dart eka json krna hati

   Map <String, dynamic> toJson() {
     return {
       'id': id,
       'title': title,
       'price': price,
       'description': description,
       'image': image,
       'category': category,
     };
   }

}
