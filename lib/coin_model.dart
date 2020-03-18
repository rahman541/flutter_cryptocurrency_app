import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coin extends Equatable {
  final String name, fullName;
  final double price;

  const Coin({
    @required this.name,
    @required this.fullName,
    @required this.price
  });

  @override
  // TODO: implement props
  List<Object> get props => [
    name, fullName, price
  ];

  @override
  String toString() => 'Coin {name: $name, fullName: $fullName, price: $price}';

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['CoinInfo']['Name'] as String,
      fullName: json['CoinInfo']['FullName'] as String,
      price: (json['RAW']['MYR']['PRICE'] as num).toDouble()
    );
  }

}