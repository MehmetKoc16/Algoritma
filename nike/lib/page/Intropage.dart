import 'package:flutter/material.dart';
import 'package:nike/page/HomePage.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  "lib/image/nike.png",
                  height: 240,
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Text(
                "Just Do It",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Brand new sneakers and custom kicks made with premium quality",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 48,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage())),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16)),
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      "Shop Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
