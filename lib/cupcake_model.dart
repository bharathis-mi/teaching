// ignore_for_file: public_member_api_docs, sort_constructors_first
class CupcakeModel {
  int quantity;
  double price;
  String flavor;
  String pickedDate;
  CupcakeModel({
    this.quantity = 0,
    this.price = 0,
    this.flavor = '',
    this.pickedDate = '',
  });

  CupcakeModel copyWith({
    int? quantity,
    double? price,
    String? flavor,
    String? pickedDate,
  }) {
    return CupcakeModel(
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      flavor: flavor ?? this.flavor,
      pickedDate: pickedDate ?? this.pickedDate,
    );
  }
}
