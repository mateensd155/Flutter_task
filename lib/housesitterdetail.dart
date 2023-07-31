import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slides/HouseSitter.dart';

class HouseSitterDetailsPage extends StatelessWidget {
  final HouseSitter houseSitter;

  HouseSitterDetailsPage({required this.houseSitter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(houseSitter.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(houseSitter.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  houseSitter.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(houseSitter.profile),
                SizedBox(height: 8.0),
                Text("Experience: ${houseSitter.experience}"),
                SizedBox(height: 8.0),
                RatingBarIndicator(
                  rating: houseSitter.rating,
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
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors
                        .redAccent, // Set the selected tab text color to black
                    tabs: [
                      Tab(text: "Info"),
                      Tab(text: "Review"),
                      Tab(text: "Services"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Info Tab
                        Center(
                          child: Text(
                            "Info Tab",
                            style: TextStyle(
                                color: Colors
                                    .black), // Set the text color to black
                          ),
                        ),
                        // Review Tab
                        Center(
                          child: Text(
                            "Review Tab",
                            style: TextStyle(
                                color: Colors
                                    .black), // Set the text color to black
                          ),
                        ),
                        // Services Tab
                        Center(
                          child: Text(
                            "Services Tab",
                            style: TextStyle(
                                color: Colors
                                    .black), // Set the text color to black
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add code to handle the "Contact this sitter" button.
              },
              child: Text("Contact this sitter"),
            ),
          ),
        ],
      ),
    );
  }
}
