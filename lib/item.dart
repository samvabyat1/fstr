import 'package:flutter/material.dart';
import 'package:fstr/fapi.dart';
import 'package:google_fonts/google_fonts.dart';

class Item extends StatelessWidget {
  Fapi fapii;
  Item({super.key, required this.fapii});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.center,
              direction:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? Axis.vertical
                      : Axis.horizontal,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.shortestSide * 0.9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        fapii.image,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.shortestSide * 0.9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fapii.title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        fapii.description,
                        style: GoogleFonts.poppins(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Variants',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.shortestSide * 0.2,
                        width: MediaQuery.of(context).size.shortestSide * 0.2,
                        child: Image.network(
                          fapii.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '₹' + fapii.price.toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '₹' + (fapii.price * 7).toString(),
                            style: GoogleFonts.poppins(
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            ' discount/offer price',
                            style: GoogleFonts.poppins(color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rating',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            fapii.rating.count.toString() +
                                '+ customer ratings',
                            style: GoogleFonts.poppins(),
                          ),
                          Row(
                            children: [
                              Icon(fapii.rating.rate <= 0
                                  ? Icons.star_border
                                  : fapii.rating.rate >= 1
                                      ? Icons.star
                                      : Icons.star_half),
                              Icon(fapii.rating.rate <= 1
                                  ? Icons.star_border
                                  : fapii.rating.rate >= 2
                                      ? Icons.star
                                      : Icons.star_half),
                              Icon(fapii.rating.rate <= 2
                                  ? Icons.star_border
                                  : fapii.rating.rate >= 3
                                      ? Icons.star
                                      : Icons.star_half),
                              Icon(fapii.rating.rate <= 3
                                  ? Icons.star_border
                                  : fapii.rating.rate >= 4
                                      ? Icons.star
                                      : Icons.star_half),
                              Icon(fapii.rating.rate <= 4
                                  ? Icons.star_border
                                  : fapii.rating.rate >= 5
                                      ? Icons.star
                                      : Icons.star_half),
                              Text(
                                fapii.rating.rate.toString(),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                'Category: ',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                fapii.category,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'id #' + fapii.id.toString(),
                            style: GoogleFonts.poppins(),
                          ),
                          SizedBox(
                            height: 75,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        // isExtended: true,
        elevation: 0, backgroundColor: Colors.blue.shade100,
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'BUY NOW',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
