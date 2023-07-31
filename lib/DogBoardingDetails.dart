import 'package:flutter/material.dart';
import 'package:flutter_slides/HouseSitter.dart';
import 'package:intl/intl.dart';

class DogBoardingDetails extends StatefulWidget {
  @override
  _DogBoardingDetailsState createState() => _DogBoardingDetailsState();
}

class _DogBoardingDetailsState extends State<DogBoardingDetails> {
  String selectedPetType = 'Dog';
  DateTime selectedDate = DateTime.now();
  String location = '';

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white, // Set the background color of the white box
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Dog Boarding',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16.0),
            Text(
              'When do you need a sitter?',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: 'Dog',
                      groupValue: selectedPetType,
                      onChanged: (newValue) {
                        setState(() {
                          selectedPetType = newValue!;
                        });
                      },
                    ),
                    Text('Dog'),
                    Radio<String>(
                      value: 'Cat',
                      groupValue: selectedPetType,
                      onChanged: (newValue) {
                        setState(() {
                          selectedPetType = newValue!;
                        });
                      },
                    ),
                    Text('Cat'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectDate,
              child: Text(
                'Select Date',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Selected Date: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (newValue) {
                setState(() {
                  location = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdSlide()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
