class Cart {
  late final int id;
  final String productId;
  final String productName;
  final int initalPrice;
  final int productPrice;
  final int quanity;
  final String unitTag;
  final String image;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.initalPrice,
    required this.productPrice,
    required this.quanity,
    required this.unitTag,
    required this.image,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        initalPrice = res['initalPrice'],
        productPrice = res['productPrice'],
        quanity = res['quanity'],
        unitTag = res['unitTag'],
        image = res['image'];

  Map<String, Object> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'initalPrice': initalPrice,
      'productPrice': productPrice,
      'quanity': quanity,
      'unitTag': unitTag,
      'image': image,
    };
  }
}
