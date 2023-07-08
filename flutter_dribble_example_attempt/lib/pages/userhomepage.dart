// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../util/box_tile.dart';
import '../util/emoticon_face.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

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

                  // spacing
                  SizedBox(height: 25),

                  // how do you feel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  // spacing
                  SizedBox(height: 25),

                  // emotiocns
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // sad
                      Column(
                        children: [
                          EmoticonFace(emoticonfaceemoji: '😔'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Bad',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),

                      // fine
                      Column(
                        children: [
                          EmoticonFace(emoticonfaceemoji: '🙂'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Fine',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),

                      // well
                      Column(
                        children: [
                          EmoticonFace(emoticonfaceemoji: '😊'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Well',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),

                      // excellent
                      Column(
                        children: [
                          EmoticonFace(emoticonfaceemoji: '😁'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Excellent',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(55)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Icon(
                        Icons.horizontal_rule_rounded,
                        size: 60,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Exercise',
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
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    // ListView
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView(
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
                    ))
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
