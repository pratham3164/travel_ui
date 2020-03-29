import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/constants.dart';
import 'package:travel/widgets/destinaion_carousel.dart';
import 'package:travel/widgets/hotel_carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIcon = 0;
  int _currentIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.planeDeparture,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcons(int index) => GestureDetector(
        onTap: () {
          setState(() {
            _selectedIcon = index;
          });
        },
        child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: _selectedIcon == index
                    ? Theme.of(context).accentColor
                    : kinactiveIconB,
                borderRadius: BorderRadius.circular(30)),
            child: Icon(_icons[index],
                color: _selectedIcon == index
                    ? Theme.of(context).primaryColor
                    : kinactiveIcon,
                size: 25)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120),
            child: Text('What you would like to find ?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          ),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcons(map.key))
                  .toList()),
          SizedBox(
            height: 20,
          ),
          DestinationCarousel(),
          SizedBox(
            height: 20,
          ),
          HotelCarousel(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 30), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_pizza, size: 30),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                title: SizedBox.shrink()),
          ]),
    );
  }
}
