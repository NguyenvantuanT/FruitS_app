class FruitModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? fs;
  String? img;
  int? quantity;
  bool isFavourite;
  bool isCart;

  FruitModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.fs,
    this.img,
    this.quantity,
    this.isFavourite = false,
    this.isCart = false,
  });

  double get total => (price ?? 0.0) * (quantity ?? 0);

  factory FruitModel.fromJson(Map<String, dynamic> json) => FruitModel()
    ..id = json['id']
    ..name = json['name']
    ..price = json['price']
    ..description = json['description']
    ..fs = json['fs']
    ..img = json['img']
    ..quantity = json['quantity']
    ..isFavourite = json['isFavourite']
    ..isCart = json['isCart'];
  

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'fs': fs,
      'img': img,
      'quantity': quantity,
      'isFavourite': isFavourite,
      'isCart': isCart,
    };
  }
}

List<FruitModel> cartFruits = [];
List<FruitModel> favourites = [];

List<FruitModel> fruits = [
  FruitModel()
    ..id = 1
    ..name = "Organic Bananas"
    ..price = 4.99
    ..description =
        "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet."
    ..fs = "7pcs, Priceg"
    ..img = "assets/images/food_1.png"
    ..quantity = 0,
  FruitModel()
    ..id = 2
    ..name = "Red Apple"
    ..price = 4.99
    ..description =
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'
    ..fs = "1kg, Priceg"
    ..img = "assets/images/food_2.png"
    ..quantity = 0,
  FruitModel()
    ..id = 3
    ..name = "Bell Pepper Red"
    ..price = 4.99
    ..description =
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'
    ..fs = "1kg, Priceg"
    ..img = "assets/images/food_3.png"
    ..quantity = 0,
  FruitModel()
    ..id = 4
    ..name = "Ginger"
    ..price = 4.99
    ..description =
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'
    ..fs = "250mg, Priceg"
    ..img = "assets/images/food_4.png"
    ..quantity = 0,
  FruitModel()
    ..id = 5
    ..name = "Organic Bananas"
    ..price = 4.99
    ..description =
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'
    ..fs = "7pcs, Priceg"
    ..img = "assets/images/food_1.png"
    ..quantity = 0,
  FruitModel()
    ..id = 6
    ..name = "Red Apple"
    ..price = 4.99
    ..description =
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'
    ..fs = "1kg, Priceg"
    ..img = "assets/images/food_2.png"
    ..quantity = 0,
  FruitModel()
    ..id = 7
    ..name = "Bell Pepper Red"
    ..price = 4.99
    ..description =
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.'
    ..fs = "1kg, Priceg"
    ..img = "assets/images/food_3.png"
    ..quantity = 0,
];
