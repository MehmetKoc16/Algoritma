import 'package:flutter/material.dart';
import 'package:rest_api/post_screen.dart';
import 'package:rest_api/utils/service/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = new ApiService();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: apiService.getComments(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data![index].body.toString());
                      },
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PostScreen(),
                                ),
                              );
                            },
                            child: Text("data")))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
