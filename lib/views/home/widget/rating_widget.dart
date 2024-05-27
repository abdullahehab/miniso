import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          unratedColor: Colors.transparent,
          ignoreGestures: true,
          itemSize:15 ,
          initialRating: 4.5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1,),
          itemBuilder: (context, _) => const Icon(
            size: 5,
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        RichText(
          text: const TextSpan(
              children: [
                TextSpan(
                    text: '4.5/',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    )
                ),
                TextSpan(
                    text: '5',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                    )
                )


              ]



          ),


        ),

      ],
    );
  }
}
