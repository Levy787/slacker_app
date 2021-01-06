import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    @required this.imageDirectory,
    @required this.heading,
    this.cardHeight = 250.0,
    this.cardWidth = 250.0,
    this.bottomContainerHeight = 75.0,
    this.margin = const EdgeInsets.all(15.0),
    this.borderRadius = 25.0,
    this.bottomContainerColor = const Color(0xFF212121), //grey[900]
    this.onTap,
    Key key,
  }) : super(key: key);

  ///The card height plus the top and bottom margin must not be
  ///larger than the height given by the parent
  final String imageDirectory;
  final String heading;
  final double cardHeight;
  final double cardWidth;
  final EdgeInsets margin;
  final double bottomContainerHeight;
  final double borderRadius;
  final Color bottomContainerColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            height: cardHeight,
            width: cardWidth,
            color: Colors.grey[700],
            child: GestureDetector(
              child: Column(
                children: [
                  Image.asset(
                    imageDirectory,
                    height: cardHeight - bottomContainerHeight,
                    width: cardWidth,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: bottomContainerHeight,
                    width: cardWidth,
                    color: bottomContainerColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                    child: Text(
                      heading,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
