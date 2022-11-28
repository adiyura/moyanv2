import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346,
      height: 200,
      margin: EdgeInsets.only(
        right: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox.fromSize(
          size: Size.fromRadius(48), // Image radius
          child: Image.network(
              'https://awsimages.detik.net.id/community/media/visual/2016/01/07/4da80f4a-fe5e-4585-977d-5c3cae9e0ce2_169.jpg?w=700&q=90',
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
