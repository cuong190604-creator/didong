class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  // Convert JSON → Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: (json["price"] as num).toDouble(), // CHUẨN – convert đúng kiểu
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      image: json["image"] ?? "",
      rating: Rating.fromJson(json["rating"] ?? {}),
    );
  }
}

// ---------------- RATING ----------------
class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  // Convert JSON → Rating
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json["rate"] ?? 0).toDouble(),
      count: json["count"] ?? 0,
    );
  }
}
