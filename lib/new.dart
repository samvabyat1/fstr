import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fstr/fapi.dart';
import 'package:fstr/item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Fapi> fapi = [];
  int loadcnt = 10;

  List<String> ls = [
    'https://freepngimg.com/thumb/refrigerator/5-2-refrigerator-png-picture-thumb.png',
    'https://static.vecteezy.com/system/resources/thumbnails/024/822/743/small/the-headphones-ai-generated-transparent-png.png',
    'https://freepngimg.com/thumb/model/27171-2-mens-fashion-image.png',
    'https://static.vecteezy.com/system/resources/thumbnails/041/450/716/small/ai-generated-classic-acoustic-guitar-musical-instrument-png.png',
    'https://cdn-icons-png.flaticon.com/256/7360/7360313.png',
    'https://www.pngmart.com/files/15/Apple-iPhone-11-PNG-Clipart.png',
    'https://freepngimg.com/download/laptop/162043-picture-laptop-notebook-png-image-high-quality.png'
  ];

  Future<List<Fapi>> getData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        fapi.add(Fapi.fromJson(i));
      }
      return fapi;
    } else {
      return fapi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: MediaQuery.sizeOf(context).width > 1000,
          child: Image.network(
              'https://media.istockphoto.com/id/511119416/photo/indian-landmark-gadi-sagar-in-rajasthan.jpg?s=612x612&w=0&k=20&c=dO7TbXh3sd6_QmgcF_nYi6ynyIAvPI5STavwzCDyWTI=',
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: MediaQuery.sizeOf(context).width < 1000
              ? Colors.blue.shade100
              : Colors.white54,
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: LiquidPullToRefresh(
                backgroundColor: Colors.blue,
                color: Colors.blue,
                animSpeedFactor: 1,
                onRefresh: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    )),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.blue,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(
                          'https://media.istockphoto.com/id/511119416/photo/indian-landmark-gadi-sagar-in-rajasthan.jpg?s=612x612&w=0&k=20&c=dO7TbXh3sd6_QmgcF_nYi6ynyIAvPI5STavwzCDyWTI=',
                          fit: BoxFit.cover,
                        ),
                      ),
                      leading: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      expandedHeight: MediaQuery.of(context).size.height * 0.4,
                      title: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'F Store',
                            style: GoogleFonts.permanentMarker(
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'SHOPPING AND MORE',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      actions: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.shortestSide *
                                          0.8,
                                  width:
                                      MediaQuery.of(context).size.shortestSide *
                                          0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/user_blank.png'),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'No Accounts found',
                                        style: GoogleFonts.poppins(
                                          // color: Colors.bl.shade900,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      OutlinedButton(
                                          onPressed: () {
                                            // google sign in
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                color: Colors.blue.shade900),
                                          ),
                                          child: Text(
                                            'Sign In with Google',
                                            style: GoogleFonts.poppins(
                                              color: Colors.blue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/user_blank.png'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SliverVisibility(
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      visible: kIsWeb,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: GridView.count(
                              crossAxisSpacing:
                                  MediaQuery.sizeOf(context).width < 1000
                                      ? 10
                                      : 50,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 2,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy7Zv5vxnea4upL56xVmThcldOeFwKvM6-Lg&s',
                                            ),
                                            fit: BoxFit.cover)),
                                    child: Center(
                                      child: Text(
                                        'MEN',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              'https://www.shutterstock.com/image-vector/abstract-rose-flower-blooming-design-260nw-2460226585.jpg',
                                            ),
                                            fit: BoxFit.cover)),
                                    child: Center(
                                      child: Text(
                                        'WOMEN',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    SliverVisibility(
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      visible: kIsWeb,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: GridView.builder(
                            itemCount: ls.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 5,
                                    maxCrossAxisExtent: MediaQuery.of(context)
                                            .size
                                            .shortestSide *
                                        0.2),
                            itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        ls[index],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverVisibility(
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      visible: kIsWeb,
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 25),
                        child: Row(
                          children: [
                            Text(
                              'SOME PICKS',
                              style: GoogleFonts.montserrat(
                                color: Colors.brown.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_outlined,
                              color: Colors.brown,
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverVisibility(
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      visible: kIsWeb,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 1200),
                              child: FutureBuilder(
                                  future: getData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return MasonryGridView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: loadcnt,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 15,
                                        gridDelegate:
                                            SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent:
                                                    MediaQuery.of(context)
                                                                .size
                                                                .width >
                                                            1000
                                                        ? 400
                                                        : 200),
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                          onTap: () => Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    Item(fapii: fapi[index]),
                                              )),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Image.network(
                                                    fapi[index].image,
                                                  ),
                                                  Container(
                                                    color: Colors.white54,
                                                    width: double.infinity,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        fapi[index].title,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.blue,
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      sliver: SliverToBoxAdapter(
                        child: Center(
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                loadcnt += 10;
                              });
                            },
                            mini: true,
                            shape: OvalBorder(),
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
