import 'dart:ui';

import 'package:XFoody/models/plat.dart';
import 'package:XFoody/providers/likes.dart';
import 'package:XFoody/settings/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  static String routeName = '/favoutite';
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late Favourites favourites;
  late List<Plat> favouritesPlats;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfiguration().init(context);
    favourites = Provider.of<Favourites>(context);
    favouritesPlats = favourites.items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Favourite',
          style: TextStyle(color: Colors.white, fontFamily: 'Parisienne'),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfiguration.screenHeight,
          child: ListView.builder(
            itemCount: favouritesPlats.length,
            itemBuilder: (context, index) => Dismissible(
                background: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.disabled_by_default_rounded,
                              color: Colors.white,
                            ))
                      ],
                    )),
                key: Key(favouritesPlats[index].id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  favourites.deleteById(favouritesPlats[index].id);
                },
                child: OneFavouritePlat(
                    index: index, favouritesPlats: favouritesPlats)),
          ),
        ),
        physics: AlwaysScrollableScrollPhysics(),
      ),
    );
  }
}

/* OneFavouritePlat(
                  index: index, favouritesPlats: favouritesPlats) */
class OneFavouritePlat extends StatelessWidget {
  const OneFavouritePlat({
    super.key,
    required this.favouritesPlats,
    required this.index,
  });

  final List<Plat> favouritesPlats;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/images/tabssi.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage(favouritesPlats[index].image),
                          fit: BoxFit.contain),
                    )),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favouritesPlats[index].name,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontFamily: 'parisienne',
                      fontSize: 16),
                ),
                Text(
                    favouritesPlats[index].ingredient.length.toString() +
                        ' ingredients',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Fredericka',
                        fontSize: 10)),
              ],
            ),
          ),
          Spacer(),
          Text(favouritesPlats[index].timer,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Fredericka', fontSize: 22)),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
