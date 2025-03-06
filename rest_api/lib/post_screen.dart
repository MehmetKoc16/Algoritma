import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rest_api/utils/models/comments_model.dart';
import 'package:rest_api/utils/service/api_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController postidcontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController bodycontroller = TextEditingController();
  ApiService apiService = new ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Post Id ")),
                Expanded(child: TextField(controller: postidcontroller))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("id ")),
                Expanded(child: TextField(controller: idcontroller))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Name ")),
                Expanded(child: TextField(controller: namecontroller))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Email ")),
                Expanded(child: TextField(controller: emailcontroller))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Body ")),
                Expanded(child: TextField(controller: bodycontroller))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  SendData();
                },
                child: Text("Send"))
          ],
        ));
  }

  void SendData() async {
    CommentsModel model = CommentsModel(
        postId: int.parse(postidcontroller.text),
        id: int.parse(idcontroller.text),
        name: namecontroller.text,
        email: emailcontroller.text,
        body: bodycontroller.text);
    final resp = await apiService.postComment(model);
    if (resp.statusCode == HttpStatus.created) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Succesfully created"),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to created"),
        ),
      );
    }
  }
}
