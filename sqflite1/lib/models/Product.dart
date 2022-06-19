class Product {
  int? id;
  String? name;
  String? description;
  double? unitPrice;

  Product(this.name, this.description, this.unitPrice);

  Product.withId(this.id, this.name, this.description, this.unitPrice);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;
    map['unitPrice'] = unitPrice;
    return map;
  }

  Product.toObject(dynamic d) {
    this.id = int.tryParse(d['id']);
    this.name = d['name'];
    this.description = d['description'];
    this.unitPrice = double.tryParse(d['unitPrice']);
  }
}
