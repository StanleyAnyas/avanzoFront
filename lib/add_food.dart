// import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddFoodForm extends StatefulWidget {
  @override
  AddFoodFormState createState() => AddFoodFormState();
}

class AddFoodFormState extends State<AddFoodForm> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  TimeOfDay? _selectedTime;

  TextEditingController _controller = TextEditingController(text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");

  final TextEditingController _foodTitleController =  TextEditingController();
  final TextEditingController _foodDescriptionController = TextEditingController();
  final TextEditingController _foodPickupAddressController = TextEditingController();

  void _pickTime(BuildContext context) async{
    final TimeOfDay? picked = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
    );

    if (picked != null){
      setState(() {
        _selectedTime = picked;
        _controller.text = _selectedTime!.format(context);
      });
    }
  }

  Future<void> _handleAddFood() async {
    const url = "http://192.168.1.2:8080/add_food";
    // print("button press");
    final foodDetails = jsonEncode({
      "title": _foodTitleController.text,
      "description": _foodDescriptionController.text, 
      "pickup_address": _foodPickupAddressController.text,
      "user_id": 1,
      "is_free": true,
      "pickup_time": _controller.text,
      "image": "Thisisanimage"
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: foodDetails,
      );

      if (response.statusCode == 200) {
        print("Food added successfully!");
      } else {
        print("Failed with status: ${response.statusCode}");
        print("Body: ${response.body}");
      }
    } catch (e) {
      print("Error sending POST: $e");
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
        // padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(8),
              ),
              child: _imageFile != null
                  ? Image.file(_imageFile!, fit: BoxFit.cover)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, size: 40, color: Colors.green),
                        SizedBox(height: 8),
                        Text("Add Food Image", style: TextStyle(color: Colors.green)),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _foodTitleController,
            decoration: const InputDecoration(
              labelText: 'Food title',
              labelStyle: TextStyle(color: Colors.green),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _foodDescriptionController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: "Description",
              labelStyle: TextStyle(color: Colors.green),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _foodPickupAddressController,
            decoration: const InputDecoration(
              labelText: "Pickup address",
              labelStyle: TextStyle(color: Colors.green),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Pickup time",
              labelStyle: TextStyle(color: Colors.green),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            controller: _controller,
            readOnly: true,
            onTap: () => _pickTime(context),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              _handleAddFood();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
           child: Text(
            "Add food",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
           ))
        ],
      ),
      )
    );
  }
}
