import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/model.dart';

class DescriptionScreen extends StatefulWidget {
  int id;
  String title;
  double price;
  String description;
  dynamic category;
  String image;
  Rating rating;

  DescriptionScreen({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade50,
        centerTitle: true,
        title: Text(
          'D E S C R I P T I O N',
          style: TextStyle(color: Colors.amber.shade800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    width: 600,
                    height: 200,
                    child: Image.network(widget.image)),
                Positioned(
                  right: 250,
                  top: 160,
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        widget.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              widget.description,
              style:
                  TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Container(
                width: 15,
                child: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              onRatingUpdate: (rating) {
                widget.rating;
              },
            ),
          ],
        ),
      ),
    );
  }
}
