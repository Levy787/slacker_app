/*
import 'package:flutter/material.dart';
import 'package:slacker/classes/model_classes/guide_class.dart';

class GuideScroll extends StatelessWidget {
  const GuideScroll({
    Key key,
    @required this.guide,
  }) : super(key: key);

  final Guide guide;

  List<Widget> scrollWidgets() {
    List<Widget> returnWidgets = [];
    guide.description != null || guide.description != ''
        ? returnWidgets
            .add(DescriptionBlock(guideDescription: guide.description))
        : null;
    guide.approach != null || guide.description != ''
        ? returnWidgets.add(ApproachBlock(guideApproach: guide.approach))
        : null;
    guide.approachFromHobart != null || guide.description != ''
        ? returnWidgets.add(ApproachFromHobartBlock(
            guideApproachFromHobart: guide.approachFromHobart))
        : null;
    guide.approachFromLaunceston != null || guide.description != ''
        ? returnWidgets.add(ApproachFromLauncestonBlock(
            guideApproachFromLaunceston: guide.approachFromLaunceston))
        : null;
    guide.camping != null || guide.description != ''
        ? returnWidgets.add(CampingBlock(guideCamping: guide.camping))
        : null;
    guide.amenities != null || guide.description != ''
        ? returnWidgets.add(AmenitiesBlock(guideAmenities: guide.amenities))
        : null;
    guide.warning != null || guide.description != ''
        ? returnWidgets.add(WarningBlock(guideWarning: guide.warning))
        : null;
    return returnWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: scrollWidgets(),
      ),
    );
  }
}

class GuideTextBlock extends StatelessWidget {
  GuideTextBlock({
    @required this.heading,
    @required this.text,
  });
  final String heading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Text(
            heading,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class DescriptionBlock extends GuideTextBlock {
  DescriptionBlock({
    this.guideDescription,
  }) : super(heading: 'Description', text: guideDescription);
  final String guideDescription;
}

class ApproachBlock extends GuideTextBlock {
  ApproachBlock({
    this.guideApproach,
  }) : super(heading: 'Approach', text: guideApproach);
  final String guideApproach;
}

class ApproachFromHobartBlock extends GuideTextBlock {
  ApproachFromHobartBlock({
    this.guideApproachFromHobart,
  }) : super(heading: 'Approach From Hobart', text: guideApproachFromHobart);
  final String guideApproachFromHobart;
}

class ApproachFromLauncestonBlock extends GuideTextBlock {
  ApproachFromLauncestonBlock({
    this.guideApproachFromLaunceston,
  }) : super(
            heading: 'Approach From Launceston',
            text: guideApproachFromLaunceston);
  final String guideApproachFromLaunceston;
}

class CampingBlock extends GuideTextBlock {
  CampingBlock({
    this.guideCamping,
  }) : super(heading: 'Camping', text: guideCamping);
  final String guideCamping;
}

class AmenitiesBlock extends GuideTextBlock {
  AmenitiesBlock({
    this.guideAmenities,
  }) : super(heading: 'Amenities', text: guideAmenities);
  final String guideAmenities;
}

class WarningBlock extends GuideTextBlock {
  WarningBlock({this.guideWarning})
      : super(heading: 'Warning', text: guideWarning);
  final String guideWarning;
}
*/
