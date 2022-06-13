import 'package:equatable/equatable.dart';

class CreatorModel extends Equatable {
  final String id;
  final String name;
  final String itemName;
  final String imageUrl;
  final int price;
  final String desc;

  const CreatorModel({
    required this.id,
    this.name = '',
    this.itemName = '',
    this.imageUrl = '',
    this.price = 0,
    this.desc = '',
  });

  factory CreatorModel.fromJson(String id, Map<String, dynamic> json) =>
      CreatorModel(
        id: id,
        name: json['name'],
        itemName: json['item_name'],
        imageUrl: json['image_url'],
        price: json['price'],
        desc: json['desc'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'item_name': itemName,
        'image_url': imageUrl,
        'price': price,
        'desc': desc,
      };

  @override
  List<Object?> get props => [id, name, itemName, imageUrl, price, desc];
}
