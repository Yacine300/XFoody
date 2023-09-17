import 'dart:ui';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:XFoody/settings/size_configuration.dart';

import '../../models/plat.dart';

bool up = false;

class Detail extends StatefulWidget {
  final int index;
  const Detail({super.key, required this.index});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool licked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: GestureDetector(
        onVerticalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dy > sensitivity) {
            setState(() {
              up = false;
            });
          } else if (details.delta.dy < -sensitivity) {
            setState(() {
              up = true;
            });
          }
        },
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: up ? 400 : 1200),
              curve: Curves.ease,
              decoration: BoxDecoration(
                  color: up
                      ? Colors.white.withOpacity(1)
                      : Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(5)),
              height: up ? 260 : 100,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:
                      up ? MainAxisAlignment.start : MainAxisAlignment.center,
                  children: [
                    Icon(
                      up
                          ? Icons.arrow_downward_rounded
                          : Icons.arrow_upward_rounded,
                      color: Colors.grey,
                      size: 14,
                    ),
                    Text(
                      up ? "" : "Swipe up to see all ingredients",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SingleChildScrollView(
                      child: AnimatedContainer(
                        curve: Curves.ease,
                        duration: Duration(milliseconds: up ? 2000 : 800),
                        height: up ? 209 : 0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: dummyPlat[widget.index].ingredient.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Stack(children: [
                                  AnimatedContainer(
                                    curve: Curves.ease,
                                    duration:
                                        Duration(milliseconds: up ? 2000 : 800),
                                    height: up
                                        ? SizeConfiguration.defaultSize * 0.8
                                        : SizeConfiguration.defaultSize * 0,
                                    width: up
                                        ? SizeConfiguration.defaultSize * 0.7
                                        : SizeConfiguration.defaultSize * 0,
                                    child:
                                        Image.asset("assets/images/tabssi.png"),
                                  ),
                                  Positioned(
                                    top: 2,
                                    left: 8,
                                    child: AnimatedContainer(
                                      curve: Curves.ease,
                                      duration: Duration(
                                          milliseconds: up ? 3000 : 800),
                                      height: up
                                          ? SizeConfiguration.defaultSize * 0.8
                                          : SizeConfiguration.defaultSize * 0,
                                      width: up
                                          ? SizeConfiguration.defaultSize * 0.7
                                          : SizeConfiguration.defaultSize * 0,
                                      child: Image.asset(dummyPlat[widget.index]
                                          .ingredient[index]
                                          .image),
                                    ),
                                  )
                                ]),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dummyPlat[widget.index]
                                          .ingredient[index]
                                          .name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: up ? 20 : 0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Parisienne'),
                                    ),
                                    Text(
                                      dummyPlat[widget.index]
                                          .ingredient[index]
                                          .weight,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: up ? 14 : 0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Parisienne'),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  dummyPlat[widget.index]
                                      .ingredient[2]
                                      .pricePerKilo,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: up ? 16 : 0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Fredericka'),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Container(
              height: SizeConfiguration.defaultSize * 2,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover)),
              child: Stack(clipBehavior: Clip.none, children: [
                const Positioned(
                  left: 10,
                  top: 30,
                  child: BackButton(
                    color: Colors.white,
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 30,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            licked = !licked;
                          });
                        },
                        icon: !licked
                            ? const Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.favorite_rounded,
                                color: Colors.red.shade300,
                              ))),
                Positioned(
                    top: -30,
                    left: 35,
                    right: 35,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                          width: 300,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 290,
                              width: 290,
                              child: Image.asset("assets/images/tabssi2.png"),
                            ),
                            Positioned(
                                top: 25,
                                right: 25,
                                child: SizedBox(
                                  height: 250,
                                  width: 250,
                                  child: Image.asset(
                                      dummyPlat[widget.index].image),
                                )),
                          ],
                        ),
                      ],
                    )),
                Positioned(
                    top: SizeConfiguration.defaultSize * 1.8,
                    left: 30,
                    right: 30,
                    child: Container(
                        height: 150,
                        width: 250,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.normal,
                              color: Colors.black12.withOpacity(0.09),
                              offset: const Offset(0, 1),
                              blurRadius: 10.0,
                              spreadRadius: 7.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    dummyPlat[widget.index].name,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Parisienne'),
                                  ),
                                  Text(
                                    dummyPlat[widget.index]
                                            .ingredient
                                            .length
                                            .toString() +
                                        "  ingredients",
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Stack(children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                            "assets/images/tabssi.png"),
                                      ),
                                      Positioned(
                                        left: 4,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.asset(
                                              dummyPlat[widget.index]
                                                  .ingredient[0]
                                                  .image),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Stack(children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                            "assets/images/tabssi.png"),
                                      ),
                                      Positioned(
                                        left: 4,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.asset(
                                              dummyPlat[widget.index]
                                                  .ingredient[1]
                                                  .image),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Stack(children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                            "assets/images/tabssi.png"),
                                      ),
                                      Positioned(
                                        left: 4,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.asset(
                                              dummyPlat[widget.index]
                                                  .ingredient[2]
                                                  .image),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset(
                                          "assets/images/tabssi.png",
                                        ),
                                      ),
                                      Positioned(
                                          child: ClipRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 2.0, sigmaY: 2.0),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white24
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '+${dummyPlat[widget.index].ingredient.length - 3}',
                                                style: TextStyle(
                                                    color: Colors.grey[300]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                    ]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))),
              ]),
            );
          }),
          SizedBox(
            height: 110,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfiguration.defaultSize * 0.1,
                right: SizeConfiguration.defaultSize * 0.1,
                top: SizeConfiguration.defaultSize * 0.3,
                bottom: 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/tabssi.png"),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                              dummyPlat[widget.index].ingredient[0].image),
                        ),
                      )
                    ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummyPlat[widget.index].ingredient[0].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Parisienne'),
                        ),
                        Text(
                          dummyPlat[widget.index].ingredient[0].weight,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Parisienne'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      dummyPlat[widget.index].ingredient[0].pricePerKilo,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Fredericka'),
                    )
                  ],
                ),
                Row(
                  children: [
                    Stack(children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/tabssi.png"),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                              dummyPlat[widget.index].ingredient[1].image),
                        ),
                      )
                    ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummyPlat[widget.index].ingredient[1].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Parisienne'),
                        ),
                        Text(
                          dummyPlat[widget.index].ingredient[1].weight,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Parisienne'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      dummyPlat[widget.index].ingredient[1].pricePerKilo,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Fredericka'),
                    )
                  ],
                ),
              ],
            ),
          ),
          /* Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 40, bottom: 20, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'total price',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      '33.33 £',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )*/
        ],
      )),
    );
  }
}
