class Product {
  int id;
  int categoryId;
  String productName;
  String quantatityPerUnit;
  double unitPrice;
  int unitInStock;

  Product(
      {this.id,
      this.categoryId,
      this.productName,
      this.quantatityPerUnit,
      this.unitPrice,
      this.unitInStock});
  Product.fromJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    productName = json["productName"];
    quantatityPerUnit = json["quantatityPerUnit"];
    unitPrice = double.tryParse(json["unitPrice"].toString());
    unitInStock = json["unitInStock"];
  }
  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantatityPerUnit": quantatityPerUnit,
      "unitPrice": unitPrice,
      "unitInStock": unitInStock
    };
  }
}
