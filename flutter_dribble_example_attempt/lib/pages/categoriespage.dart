// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_dribble_example_attempt/util/box_tile.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // greetings row

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // hi jared with bell icon and date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Jared!',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '23 Jan, 2023',
                            style: TextStyle(color: Colors.blue[200]),
                          )
                        ],
                      ),
                      // notification bell
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // spacing
                  SizedBox(height: 25),

                  // search box
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // white spaceing for the bottom section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(55)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // dash in center of the white section
                    Center(
                      child: Icon(
                        Icons.horizontal_rule_rounded,
                        size: 60,
                      ),
                    ),

                    // categories
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),

                    //
                    Expanded(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 2.3,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.teal[100],
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: const Text(
                              'Relationship',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.teal[100],
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: const Text(
                              'Relationship',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.teal[100],
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: const Text(
                              'Relationship',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.teal[100],
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: const Text(
                              'Relationship',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // consultant
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Consultant',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),

                    //spacing
                    SizedBox(
                      height: 10,
                    ),

                    // ListView
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            BoxTile(
                              iconboxcolor: Colors.amber.shade600,
                              iconimage: Icons.favorite,
                              titletext: 'Speaking Skills',
                              subtext: '9 Exercise',
                            ),
                            BoxTile(
                              iconboxcolor: Colors.indigo.shade600,
                              iconimage: Icons.person,
                              titletext: 'Reading Skills',
                              subtext: '4 Exercise',
                            ),
                            BoxTile(
                              iconboxcolor: Colors.pink,
                              iconimage: Icons.headphones,
                              titletext: 'Listning Skills',
                              subtext: '7 Exercise',
                            ),
                            BoxTile(
                              iconboxcolor: Colors.green.shade300,
                              iconimage: Icons.headphones,
                              titletext: 'Listning Skills',
                              subtext: '7 Exercise',
                            ),
                            BoxTile(
                              iconboxcolor: Colors.yellow.shade300,
                              iconimage: Icons.headphones,
                              titletext: 'Listning Skills',
                              subtext: '7 Exercise',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
