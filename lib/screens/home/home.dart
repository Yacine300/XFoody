import 'dart:ui';

import 'package:XFoody/providers/likes.dart';
import 'package:XFoody/screens/favourite/favourite_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:XFoody/models/plat.dart';
import 'package:XFoody/screens/detail/detail_screen.dart';
import 'package:XFoody/settings/size_configuration.dart';
import 'package:provider/provider.dart';

List<String> menu = ["Salad", "Bread", "Drinks", "Snacks", "Sweets"];

int? _currentIndex = 0;

int dichesM = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late PageController _pageController;
  late Animation<double> animation;
  late AnimationController rotationController;
  late Favourites favourites;
  late int favouriteLenght;
  late bool checkRot = false;

  @override
  void initState() {
    super.initState();

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.repeat();
      }
    });

    _pageController = PageController(viewportFraction: 0.95);

    setRotation(360);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    favourites = Provider.of<Favourites>(context, listen: true);
    favouriteLenght = favourites.items.length;
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  void setRotation(int degree) {
    final angel = degree * 3.14 / 180;
    animation = Tween<double>(begin: 0, end: angel).animate(rotationController);
    rotationController.forward(from: 0);
  }

  void flipRound() {
    setState(() {
      checkRot = !checkRot;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: HomeAppbar(favourites: favourites, lenght: favouriteLenght),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Menu(),
          SizedBox(
            height: SizeConfiguration.defaultSize * 0.2,
          ),
          SizedBox(
            height: SizeConfiguration.screenHeight * .7,
            width: SizeConfiguration.screenWidth,
            child: PageView.builder(
              controller: _pageController,
              itemCount: dummyPlat.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(
                              index: index,
                            )),
                  );
                },
                child: Stack(clipBehavior: Clip.none, children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfiguration.defaultSize * 0.3,
                    ),
                    child: Container(
                      height: SizeConfiguration.screenHeight * .6,
                      width: SizeConfiguration.screenWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/background.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfiguration.defaultSize * 0.3 +
                          SizeConfiguration.defaultSize * 0.15,
                      vertical: SizeConfiguration.defaultSize * 0.15,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Baguette',
                            ),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TyperAnimatedText(dummyPlat[index].name,
                                    speed: const Duration(milliseconds: 100)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfiguration.defaultSize * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.alarm,
                                color: Colors.white70,
                              ),
                              SizedBox(
                                  width: SizeConfiguration.defaultSize * 0.1),
                              DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: 'Baguette',
                                ),
                                child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TyperAnimatedText(dummyPlat[index].timer,
                                        speed:
                                            const Duration(milliseconds: 50)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfiguration.defaultSize * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.local_fire_department_rounded,
                                color: Colors.white70,
                              ),
                              SizedBox(
                                width: SizeConfiguration.defaultSize * 0.1,
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: 'Baguette',
                                ),
                                child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TyperAnimatedText(dummyPlat[index].calories,
                                        speed:
                                            const Duration(milliseconds: 10)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfiguration.defaultSize * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.favorite_rounded,
                                color: Colors.white70,
                              ),
                              SizedBox(
                                width: SizeConfiguration.defaultSize * 0.1,
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: 'Baguette',
                                ),
                                child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TyperAnimatedText('12 likes',
                                        speed:
                                            const Duration(milliseconds: 70)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: checkRot == true
                          ? SizeConfiguration.defaultSize / 7
                          : -SizeConfiguration.defaultSize / 8,
                      right: checkRot == true
                          ? -SizeConfiguration.defaultSize / 8
                          : -SizeConfiguration.defaultSize / 10,
                      child: GestureDetector(
                          onLongPress: () {
                            !checkRot
                                ? showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.black,
                                        title: Text(
                                          'ingredients',
                                          style: TextStyle(
                                              fontFamily: 'Parisienne',
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        content: SizedBox(
                                          height: 200,
                                          width: 200,
                                          child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: dummyPlat[index]
                                                  .ingredient
                                                  .length,
                                              itemBuilder:
                                                  (context, secondIndex) {
                                                return Row(
                                                  children: [
                                                    Text(
                                                      dummyPlat[index]
                                                          .ingredient[
                                                              secondIndex]
                                                          .name,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'Fredericka',
                                                          color: Colors.white),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Stack(children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Image.asset(
                                                              "assets/images/tabssi.png"),
                                                        ),
                                                        Positioned(
                                                          left: 4,
                                                          child: Container(
                                                            height: 60,
                                                            width: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Image.asset(
                                                                dummyPlat[index]
                                                                    .ingredient[
                                                                        secondIndex]
                                                                    .image),
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : const SizedBox();
                            flipRound();
                          },
                          child: Diches(
                            index: index,
                            animation: animation,
                            checkRot: checkRot,
                          ))),
                ]),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Fredericka'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const FoodSelection(image: "assets/images/1.jpg"),
          const SizedBox(
            height: 25,
          ),
          const FoodSelection(image: "assets/images/2.jpg"),
          const SizedBox(
            height: 25,
          ),
        ],
      )),
    );
  }
}

class FoodSelection extends StatelessWidget {
  final String image;
  const FoodSelection({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfiguration.defaultSize / 6,
          right: SizeConfiguration.defaultSize / 6),
      child: Container(
        width: SizeConfiguration.screenWidth,
        height: 90,
        decoration: BoxDecoration(
            // shape: BoxShape.values[15],you can use this with some changes of course
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: /*RotatedBox(
            quarterTurns: -1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            )),*/

            // this is a second approache of adding an image asset

            const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selection of tight food',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Parisienne', fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                  size: 16,
                ),
                Icon(
                  Icons.star_rounded,
                  size: 16,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star_rounded,
                  size: 16,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star_rounded,
                  size: 16,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star_border_rounded,
                  size: 16,
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Favourites favourites;
  final int lenght;

  const HomeAppbar({super.key, required this.favourites, required this.lenght});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
// TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      title: const Text(
        "S | T",
        style: TextStyle(color: Colors.white, fontFamily: 'Fredericka'),
      ),
      actions: [
        DragTarget<String>(
          onAccept: (data) {
            widget.favourites.addItem(id: data);
            print(data);
          },
          builder: (context, candidateData, rejectedData) {
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 5,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red,
                      ),
                      child: Center(
                          child: Text(
                        '${widget.lenght}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      )),
                    ))
              ],
            );
          },
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Diches extends StatelessWidget {
  int index;
  bool checkRot;
  Animation<double> animation;
  Diches(
      {super.key,
      required this.index,
      required this.animation,
      required this.checkRot});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: dummyPlat[index].id,
      feedback: Stack(children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutCubic,
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutCubic,
            height: 130,
            width: 130,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset("assets/images/tabssi2.png"),
          ),
        ),
        Positioned(
            left: 15,
            top: 15,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutCubic,
              height: 90,
              width: 90,
              child: Image.asset(dummyPlat[index].image),
            ))
      ]),

      /////////////////////////////
      ///
      ///
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Transform.rotate(
          angle: animation.value,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutCubic,
                height: checkRot == true
                    ? SizeConfiguration.defaultSize * 2.2
                    : SizeConfiguration.defaultSize * 1.7,
                width: checkRot == true
                    ? SizeConfiguration.defaultSize * 2.2
                    : SizeConfiguration.defaultSize * 1.7,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOutCubic,
                  height: checkRot == true
                      ? SizeConfiguration.defaultSize * 2.3
                      : SizeConfiguration.defaultSize * 2.2,
                  width: checkRot == true
                      ? SizeConfiguration.defaultSize * 2.3
                      : SizeConfiguration.defaultSize * 2.2,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset("assets/images/tabssi2.png"),
                ),
              ),
              Positioned(
                  left: checkRot == true ? 40 : 25,
                  right: checkRot == true ? 40 : 25,
                  top: checkRot == true ? 35 : 25,
                  bottom: checkRot == true ? 35 : 25,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOutCubic,
                    height: checkRot == true
                        ? SizeConfiguration.defaultSize * 1.9
                        : SizeConfiguration.defaultSize * 1.7,
                    width: checkRot == true
                        ? SizeConfiguration.defaultSize * 1.9
                        : SizeConfiguration.defaultSize * 1.7,
                    child: Image.asset(dummyPlat[index].image),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double padding = SizeConfiguration.screenWidth / menu.length;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: SizeConfiguration.defaultSize * 0.3,
        width: constraints.maxWidth,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: menu.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: (constraints.maxWidth / menu.length) / 3,
                right: (constraints.maxWidth / menu.length) / 3,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: Text(
                  menu[index],
                  style: TextStyle(
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white54,
                      fontFamily:
                          _currentIndex == index ? 'Parisienne' : 'Fredericka'),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
