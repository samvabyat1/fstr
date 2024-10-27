import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fstr/fapi.dart';
import 'package:fstr/item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainApp()));
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Fapi> fapi = [];
  int loadcnt = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        actions: [
          Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Container(
                      height: MediaQuery.of(context).size.shortestSide * 0.8,
                      width: MediaQuery.of(context).size.shortestSide * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                side: BorderSide(color: Colors.blue.shade900),
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
                backgroundImage: AssetImage('assets/user_blank.png'),
              ),
            ),
          ),
        ],
        title: Text(
          MediaQuery.of(context).size.width > 600
              ? 'F Store - Shopping'
              : 'F Store',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: MediaQuery.of(context).size.width >= 400 ? true : false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.blue.shade900,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                          ),
                          child: Text(
                            'Men',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                          ),
                          child: Text(
                            'Women',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                          ),
                          child: Text(
                            'Kids',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                          ),
                          child: Text(
                            'Accessories',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                          ),
                          child: Text(
                            'Entertainment',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                // color: Colors.blue.shade900,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          print(MediaQuery.of(context).size.width);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue.shade900),
                        ),
                        child: Text(
                          'All items',
                          style: GoogleFonts.poppins(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
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
                                          MediaQuery.of(context).size.width >
                                                  1000
                                              ? 400
                                              : 200),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          Item(fapii: fapi[index]),
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue.shade900)),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        fapi[index].image,
                                      ),
                                      Container(
                                        color: Colors.blue.shade900,
                                        width: double.infinity,
                                        child: Text(
                                          fapi[index].title,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade100,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                // color: Colors.blue.shade900,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        loadcnt += 10;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue.shade900),
                    ),
                    child: Text(
                      'Load more',
                      style: GoogleFonts.poppins(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}
