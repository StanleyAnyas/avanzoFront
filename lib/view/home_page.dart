import 'package:flu_new/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'add_food.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appHomeTitle = "Avanzo";
    return MaterialApp(
      title: appHomeTitle,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed:
              () => Navigator.of(
                context,
                rootNavigator: true,
              ).push(MaterialPageRoute(builder: (context) => AddFoodForm())),
          backgroundColor: Colors.green,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                appHomeTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 107, 215, 53),
                  letterSpacing: 1.2,
                ),
              ),
              GestureDetector(
                onTap: () => {
                 Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => UserProfileScreen()
                  )
                 )
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 18,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                )
              )
              
            ]
          ),
          backgroundColor: Colors.white24,
          elevation: 4,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search food...",
                  prefixIcon: Icon(Icons.search),
                  // suffixIcon: Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Expanded(child: AvanzoList()),
          ],
        ),
      ),
    );
  }
}

class AvanzoList extends StatelessWidget {
  final foodUploaded = "assets/images/foodexample.jpg";

  // String type = "free";
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, i) {
        String type = "";
        if (i % 2 == 0) {
          type = "€2";
        } else {
          type = "Free";
        }
        return ListTile(
          leading: Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                foodUploaded,
                fit: BoxFit.cover,
                height: 100,
                width: 70,
              ),
            ),
          ),
          title: Text(
            "Food item ${i + 1}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              // decoration: TextDecoration.underline,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("My house"),
              const SizedBox(height: 4),
              Text(
                type,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.green),
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder:
                    (context) => FoodDetailPage(
                      foodTitle: "Food item ${i + 1}",
                      foodImage: "assets/images/foodexample.jpg",
                      description:
                          "This is the description of the food, it is really really really long for testing purposes, this food is created by the user, be careful of possible allergies",
                      owner: "Francesco",
                      pickupTime: "18:30",
                    ),
              ),
            );
          },
        );
      },
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final String foodTitle;
  final String foodImage;
  final String description;
  final String owner;
  final String pickupTime;

  const FoodDetailPage({
    super.key,
    required this.foodTitle,
    required this.foodImage,
    required this.description,
    required this.owner,
    required this.pickupTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              foodImage,
              // height: 400,
              fit: BoxFit.cover,
              // height: 400,
              // width: double.infinity,
            ),
          ),
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Pasta",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Pickup by 18:00"),
                  ],
                ),
                // Text("Pickup by 18:00"),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Location"),
                  ],
                ),
                // Text("Location"),
                SizedBox(height: 12),
                // Text("description"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.description, color: Colors.grey),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "This is the description of the food, it is really really really long for testing purposes, this food is created by the user, be careful of possible allergies",
                        style: TextStyle(fontSize: 16),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Francesco"),
                  ],
                ),
              ],
            ),
          ),
          // const Spacer(), // pushes the button to the bottom
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 200, // set your desired width here
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("You reserved $foodTitle")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  "Reserve",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
