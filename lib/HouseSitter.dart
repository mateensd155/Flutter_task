import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slides/housesitterdetail.dart';

class HouseSitter {
  String name;
  String profile;
  String experience;
  double rating; // Use a double to represent the average star rating
  double price; // Use a double to represent the price
  int clients;
  String imageUrl;

  HouseSitter({
    required this.name,
    required this.profile,
    required this.experience,
    required this.rating,
    required this.price,
    required this.clients,
    required this.imageUrl,
  });
}

class ThirdSlide extends StatelessWidget {
  final List<HouseSitter> houseSitters = [
    HouseSitter(
      name: "Sarah Johnson",
      profile:
          "Responsible and trustworthy house sitter with a love for pets and plants. Highly experienced in caring for homes during extended periods of absence.",
      experience: "5+ years of house sitting for various clients.",
      rating: 4.9, // Update with average star rating
      price: 40.0, // Update with the price
      clients: 25,
      imageUrl: "https://via.placeholder.com/150", // Placeholder image URL
    ),
    // Add other house sitter data here
    HouseSitter(
      name: "Michael Thompson",
      profile:
          "Friendly and reliable house sitter who ensures the security and well-being of your property. Great with home maintenance and excellent attention to detail.",
      experience: "3+ years of house sitting for homeowners and families.",
      rating: 4.5, // Update with average star rating
      price: 35.0, // Update with the price
      clients: 15,
      imageUrl: "https://via.placeholder.com/150", // Placeholder image URL
    ),
    HouseSitter(
      name: "Emily Anderson",
      profile:
          "Experienced house sitter and animal lover. Able to handle multiple tasks and emergencies. Ensures your pets and home are well-cared for.",
      experience: "4+ years of house sitting experience.",
      rating: 4.8, // Update with average star rating
      price: 50.0, // Update with the price
      clients: 20,
      imageUrl: "https://via.placeholder.com/150", // Placeholder image URL
    ),
    HouseSitter(
      name: "David Lee",
      profile:
          "Trustworthy and detail-oriented house sitter. Skilled in handling home security systems and managing household chores.",
      experience: "2+ years of house sitting for friends and referrals.",
      rating: 4.2, // Update with average star rating
      price: 30.0, // Update with the price
      clients: 10,
      imageUrl: "https://via.placeholder.com/150", // Placeholder image URL
    ),
    HouseSitter(
      name: "Jessica Ramirez",
      profile:
          "Responsible and caring house sitter with a background in property management. Knowledgeable in handling household repairs and maintenance.",
      experience: "6+ years of professional house sitting.",
      rating: 4.7, // Update with average star rating
      price: 45.0, // Update with the price
      clients: 35,
      imageUrl: "https://via.placeholder.com/150", // Placeholder image URL
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("House Sitters")),
        body: ListView.builder(
          itemCount: houseSitters.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HouseSitterDetailsPage(
                      houseSitter: houseSitters[index],
                    ),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(houseSitters[index].imageUrl),
                  ),
                  title: Text(
                    houseSitters[index].name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(houseSitters[index].profile),
                      SizedBox(height: 4.0),
                      Text("Experience: ${houseSitters[index].experience}"),
                      SizedBox(height: 4.0),
                      RatingBarIndicator(
                        rating: houseSitters[index].rating,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  trailing:
                      Text("\$${houseSitters[index].price.toStringAsFixed(2)}"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
