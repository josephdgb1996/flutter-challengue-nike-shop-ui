import 'package:flutter/material.dart';
import 'package:shoes/src/screens/products_screen.dart';
import 'package:shoes/src/api/fake_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          labelColor: Colors.black,
          isScrollable: true,
          tabs: <Widget>[
            Tab(child: Text('Hombres')),
            Tab(child: Text('Mujeres')),
            Tab(child: Text('Chicas')),
            Tab(child: Text('Chicos')),
          ],
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text('Tienda',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30.0)),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: Search());
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 35.0,
              ),
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          MenScreen(),
          WomenScreen(),
          GirlScreen(),
          BoyScreen()
        ],
      ),
    );
  }
}

class MenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Destacado',
                                    data: manFeaturedProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/man_featured_cover.jpeg',
                            'Destacado'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Zapatos',
                                    data: manShoesProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/man_shoes_cover.jpg',
                            'Zapatos'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Ropa',
                                    data: manClothesProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/man_clothes_cover.jpg',
                            '    Ropa'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget imageCover(BuildContext context, String imagePath, String title) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(imagePath, fit: BoxFit.fill),
          Positioned(
              top: 90.0,
              left: 130.0,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}

class WomenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Destacado',
                                    data: womenFeaturedProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/women_featured_cover.jpg',
                            'Destacado'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Zapatos',
                                    data: womenShoesProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/women_shoes_cover.jpg',
                            'Zapatos'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Ropa',
                                    data: womenClothesProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/women_clothes_cover.jpg',
                            '    Ropa'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget imageCover(BuildContext context, String imagePath, String title) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(imagePath, fit: BoxFit.fill),
          Positioned(
              top: 90.0,
              left: 130.0,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}

class GirlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductsScreen(
                                      title: 'Destacado',
                                      data: girlFeaturedProducts,
                                    )));
                          },
                          child: imageCover(
                              context,
                              'assets/images/covers/girl_featured_cover.jpg',
                              'Destacado'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductsScreen(
                                      title: 'Zapatos',
                                      data: girlShoesProducts,
                                    )));
                          },
                          child: imageCover(
                              context,
                              'assets/images/covers/girl_shoes_cover.jpg',
                              'Zapatos'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductsScreen(
                                      title: 'Ropa',
                                      data: girlClothesProducts,
                                    )));
                          },
                          child: imageCover(
                              context,
                              'assets/images/covers/girl_clothes_cover.jpg',
                              '    Ropa'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget imageCover(BuildContext context, String imagePath, String title) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(imagePath, fit: BoxFit.fill),
          Positioned(
              top: 90.0,
              left: 130.0,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}

class BoyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Destacado',
                                    data: boyFeaturedProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/boy_featured_cover.jpg',
                            'Destacado'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Zapatos',
                                    data: boyShoesProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/boy_shoes_cover.jpg',
                            'Zapatos'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    title: 'Ropa',
                                    data: boyClothesProducts,
                                  )));
                        },
                        child: imageCover(
                            context,
                            'assets/images/covers/boy_clothes_cover.jpg',
                            '    Ropa'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget imageCover(BuildContext context, String imagePath, String title) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(imagePath, fit: BoxFit.fill),
          Positioned(
              top: 90.0,
              left: 130.0,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {}),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildCardSugestion(FontAwesomeIcons.store, 'Camiseta Negra Polo'),
          buildCardSugestion(FontAwesomeIcons.store, 'Camiseta Negra Nike'),
          buildCardSugestion(FontAwesomeIcons.store, 'Camiseta Roja Adidas'),
          buildCardSugestion(FontAwesomeIcons.store, 'Zapatos Negros Nike'),
          buildCardSugestion(FontAwesomeIcons.store, 'Zapatos Negros Puma'),
          buildCardSugestion(FontAwesomeIcons.store, 'Zapatos Blancos Nike'),
          buildCardSugestion(FontAwesomeIcons.store, 'Jogger Negro Nike'),
          buildCardSugestion(FontAwesomeIcons.store, 'Jogger Gris Nike'),
          buildCardSugestion(FontAwesomeIcons.store, 'Jogger Rojo Puma'),
        ],
      ),
    );
  }

  Widget buildCardSugestion(IconData icon, String title) {
    return Container(
      height: 100.0,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 33.0),
              child: Icon(icon, color: Colors.black54,),
            ),
            Text(
              '$title',
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
