import 'package:flutter/material.dart';
import 'package:frontend/constants/shadow.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, this.category}) : super(key: key);
  final category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      constraints: BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
        color: Colors.white,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Image(
            image: NetworkImage("${category.image}"),
            width: 70,
            height: 70,
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${category.name}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "${category.description}",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
