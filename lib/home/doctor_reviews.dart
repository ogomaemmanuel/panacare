import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DoctorReviewsPage extends StatelessWidget {
  const DoctorReviewsPage({super.key});

  List<Review> _getReviews() {
    Random random = new Random();
    return List.generate(
      20,
      (index) => Review(
          rating: random.nextInt(5) + 1,
          comment: "Comment $index",
          reviewDate: DateTime.now()
              .subtract(Duration(days: (random.nextInt(10) + 1)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Review> reviews = _getReviews();
    return ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          debugPrint("review $index");
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...List.generate(reviews[index].rating,
                                (index) => const Icon(Icons.star,
                                  color: Colors.blue,
                                  size: 17,))
                          ],
                        ),
                        Text(
                            DateFormat.yMMMMd().format(reviews[index].reviewDate))
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(reviews[index].comment ?? ""),
                      )],
                    ),
                  )
                ],
              ),
              const Divider(),
            ],
          );
        });
  }
}

class Review {
  String? comment;
  int rating;
  DateTime reviewDate;

  Review({this.comment, required this.rating, required this.reviewDate});
}
