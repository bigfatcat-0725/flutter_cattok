import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final size = MediaQuery.of(context).size;
          return Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                color: Colors.black,
                child: Center(
                  child: Text(
                    '$index',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.5,
                right: size.height * 0.02,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/cat-foot.png',
                        width: 50,
                        height: 50,
                        color: Colors.white,
                        //  평소 회색 누르면 기본 핑크색
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
