import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/constants.dart';
import 'package:travel/models/destination.dart';
import 'package:travel/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(' Top Destinations', style: kTopDest),
              Text('See All', style: kSeeAll),
            ],
          ),
        ),
        Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  Destination destination = destinations[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DestinnationScreen(destination)));
                    },
                    child: (Container(
                      margin: EdgeInsets.all(10),
                      width: 210,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 15.0,
                            child: Container(
                                width: 200,
                                height: 125,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                          '${destination.activities.length} activites',
                                          style: kActivites),
                                      Text('${destination.description}',
                                          style: kDescripton)
                                    ],
                                  ),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 2),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    height: 180,
                                    width: 180,
                                    fit: BoxFit.cover,
                                    image: AssetImage(destination.imageUrl),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('${destination.city}',
                                            style: kCity),
                                        Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.locationArrow,
                                                size: kIconSize,
                                                color: kiconColor),
                                            SizedBox(width: 5),
                                            Text('${destination.country}',
                                                style: kCountry),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  );
                }))
      ],
    );
  }
}
