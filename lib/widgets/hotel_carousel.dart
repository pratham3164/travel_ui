import 'package:flutter/material.dart';
import 'package:travel/constants.dart';
import 'package:travel/models/hotel.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Exclusive Hotels', style: kTopDest),
              Text('See All', style: kSeeAll),
            ],
          ),
        ),
        Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  Hotel hotel = hotels[index];

                  return (Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 125,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('${hotel.name} ', style: kActivites),
                                    Text('${hotel.address}',
                                        style: kDescripton),
                                    Text('\$${hotel.price} / night',
                                        style: kActivites)
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              height: 180,
                              width: MediaQuery.of(context).size.width - 60,
                              fit: BoxFit.cover,
                              image: AssetImage(hotel.imageUrl),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
                }))
      ],
    );
  }
}
