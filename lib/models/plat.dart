import 'package:XFoody/models/ingredient.dart';

class Plat {
  String id;
  String name;
  String timer;
  String calories;
  String image;
  List<Ingredient> ingredient = [];

  Plat(
      {required this.id,
      required this.name,
      required this.image,
      required this.ingredient,
      required this.timer,
      required this.calories});
}

List<Plat> dummyPlat = [
  Plat(
      id: 'vjhDGJGVkvsdf165',
      image: "assets/images/patate.png",
      name: "Patate farcé",
      calories: "130 Cals",
      timer: "25 min",
      ingredient: [
        Ingredient(
            image: "assets/images/patate1.png",
            name: 'patate douce',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/poichiche.png",
            name: 'poichiche',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/9osbor.png",
            name: 'hurb',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
      ]),
  Plat(
      id: 'cvsnzodi59d5ck',
      image: "assets/images/humburger-top.png",
      name: "Humburger",
      calories: "543 Cals",
      timer: "45 min",
      ingredient: [
        Ingredient(
            image: "assets/images/potato.png",
            name: 'pomme de terre',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/tomato.png",
            name: 'tomate',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/bread.png",
            name: 'pain ',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/chesse.png",
            name: 'chesse',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/onion.png",
            name: 'onion',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/salada.png",
            name: 'hurb',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/meat.png",
            name: 'hurb',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
      ]),
  Plat(
      id: 'vbdkapxmzzed74sa8/',
      image: "assets/images/bread-top.png",
      name: "khobz",
      calories: "214 Cals",
      timer: "80 min",
      ingredient: [
        Ingredient(
            image: "assets/images/farine.png",
            name: 'farine',
            weight: "200 g",
            pricePerKilo: "1.4 £/ KG"),
        Ingredient(
            image: "assets/images/salt.png",
            name: 'selt',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/milk.png",
            name: 'lait',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
      ]),
  Plat(
      id: 'vjhDGJGVvbd885kvsdf',
      image: "assets/images/french-fries-top.png",
      name: "french fries",
      calories: "350 Cals",
      timer: "15 min",
      ingredient: [
        Ingredient(
            image: "assets/images/potato.png",
            name: 'pomme de terre',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/tomato.png",
            name: 'tomate',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
        Ingredient(
            image: "assets/images/salt.png",
            name: 'selt',
            weight: "200 g",
            pricePerKilo: "15.0 £/ KG"),
      ])
];
