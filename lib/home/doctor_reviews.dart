import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorReviewsPage extends StatelessWidget {
  const DoctorReviewsPage({super.key});


  List<Review> _getReviews() {
    Random random = new Random();
    return List.generate(20, (index) =>
        Review(rating: random.nextInt(10) + 1, comment: "Comment ${index}",
            reviewDate: DateTime.now().subtract(
                Duration(days: (random.nextInt(10) + 1)))),

    );
  }


  @override
  Widget build(BuildContext context) {
    List<Review> reviews = _getReviews();
    return Column(
        children: [
    ListView.builder(
    itemCount: reviews.length,
        itemBuilder: (context, index) =>
            Container(child: Column(
                children: [
                Divider(),

              ],
            )))

    ]
    ,
    );
  }
}


class Review {
  String? comment;
  int rating;
  DateTime reviewDate;

  Review({this.comment, required this.rating, required this.reviewDate});


}
