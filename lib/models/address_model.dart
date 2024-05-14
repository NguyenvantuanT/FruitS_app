class AddressModel {
  String? adddress;
  String? name;
  String? local;
  bool? isDone;

  AddressModel({this.adddress, this.name, this.local, this.isDone = false});
}

List<AddressModel> address = [
  AddressModel()
    ..adddress = 'My Home Address'
    ..name = 'Home'
    ..local =
        '(503) 338-5200 15612 Fisher island Dr Miami Beach, Florida(FL), 33109',
  AddressModel()
    ..adddress = 'My Office Address'
    ..name = 'Office'
    ..local =
        '(503) 338-5200 15612 Fisher island Dr Miami Beach, Florida(FL), 33109',
  AddressModel()
    ..adddress = 'My Home Address'
    ..name = 'Home'
    ..local =
        '(503) 338-5200 15612 Fisher island Dr Miami Beach, Florida(FL), 33109',
  AddressModel()
    ..adddress = 'My Office Address'
    ..name = 'Office'
    ..local =
        '(503) 338-5200 15612 Fisher island Dr Miami Beach, Florida(FL), 33109',
];

List<AddressModel> paymentMedhods = [
  AddressModel()..adddress = 'Credit, debit Card',
  AddressModel()..adddress = 'Paypal',
  AddressModel()..adddress = 'Cash on Delivery',
];
