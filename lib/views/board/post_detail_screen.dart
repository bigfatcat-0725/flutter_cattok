import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as tago;

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
  }) : super(key: key);
  final title;
  final description;
  final time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tago.format(time.toDate()),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(title),
              SizedBox(
                height: 20,
              ),
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
