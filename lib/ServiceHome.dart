import 'package:flutter/material.dart';
import 'package:flutter_slides/DogBoardingDetails.dart';

class DogBoarding {
  final String title;
  final String description;
  final IconData icon;

  DogBoarding(this.title, this.description, this.icon);
}

class ServiceHome extends StatelessWidget {
  final List<DogBoarding> boardingList = [
    DogBoarding('Dog Boarding Service', "in the sitter's home", Icons.hotel),
    DogBoarding('House Sitting', 'in your home', Icons.home),
    DogBoarding('Drop-In Visit', 'visits in your home', Icons.pets),
    DogBoarding('Doggy Day Care', "in the sitter's home", Icons.beach_access),
    DogBoarding('Doggy Walking', 'in your neighborhood', Icons.directions_walk),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text(''),
          flexibleSpace: Center(
            child: Text(
              'Select a Service',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'FIND AND BOOK A SITTER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: boardingList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: DogBoardingCard(boardingList[index]),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.green),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz, color: Colors.green),
                label: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DogBoardingCard extends StatelessWidget {
  final DogBoarding dogBoarding;

  DogBoardingCard(this.dogBoarding);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DogBoardingDetails()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(dogBoarding.icon,
                      size: 30.0, color: Colors.green), // Set the color here
                  SizedBox(width: 10.0),
                  Text(
                    dogBoarding.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                dogBoarding.description,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
