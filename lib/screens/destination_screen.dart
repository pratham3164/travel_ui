import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/constants.dart';
import 'package:travel/models/activity.dart';
import 'package:travel/models/destination.dart';

class DestinnationScreen extends StatefulWidget {
  final Destination destination;
  DestinnationScreen(this.destination);
  @override
  _DestinnationScreenState createState() => _DestinnationScreenState();
}

class _DestinnationScreenState extends State<DestinnationScreen> {
  Widget _buildRatings(int ratings) {
    String stars = ' ';
    for (int i = 0; i < ratings; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 6,
                        offset: Offset(0.0, 2.0))
                  ], borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image(
                        image: AssetImage(widget.destination.imageUrl),
                        fit: BoxFit.cover),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.search, size: 35),
                        SizedBox(width: 5),
                        Icon(Icons.filter_list, size: 35),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${widget.destination.city}',
                          style: kCity.copyWith(fontSize: 30)),
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.locationArrow,
                              size: kIconSize + 10, color: kiconColor),
                          SizedBox(width: 5),
                          Text('${widget.destination.country}',
                              style: kCountry.copyWith(fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 25,
                  right: 25,
                  child: Icon(Icons.location_on, color: kiconColor, size: 20))
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: widget.destination.activities.length,
                itemBuilder: (context, index) {
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            90,
                            20,
                            20,
                            20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    child: Text(activity.name,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('\$ ${activity.price}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600)),
                                      Text('per pax'),
                                    ],
                                  )
                                ],
                              ),
                              Text(activity.type),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: _buildRatings(activity.rating),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(activity.startTimes[0]),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(activity.startTimes[1]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(activity.imageUrl),
                            width: 110,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
