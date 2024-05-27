class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final String price;
  final int Saleprice;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.Saleprice,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['media'],
      price: json['price'],
      Saleprice: json['sale_price'],
    );
  }
}
