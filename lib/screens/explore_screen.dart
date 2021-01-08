import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slacker/classes/model_classes/country_class.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'package:slacker/globals.dart' as globals;
import 'package:slacker/widgets/bottom_sheets/html_bottom_sheet.dart';
import 'package:slacker/widgets/custom_tab_indicator.dart';
import 'package:slacker/widgets/image_card.dart';
import 'package:flutter_html/flutter_html.dart';

import '../constants.dart';

const double kExplorePageHorizontalPadding = 15.0;

class ExploreScreen extends StatefulWidget {
  static const String id = 'explore_screen';
  final States state;
  ExploreScreen({this.state});
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _pageController = PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 5.0,
                left: kExplorePageHorizontalPadding,
                right: kExplorePageHorizontalPadding,
              ),
              child: Text(
                widget.state.stateName,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: kExplorePageHorizontalPadding,
                right: kExplorePageHorizontalPadding,
              ),
              child: Text(
                widget.state.detailedDescription,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.symmetric(vertical: 15.0),
              //height: 700.0,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'General\nInformation',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Want to know more about Tasmania?\nHave a look at it\'s history, ethics and other guides.',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 320.0,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        //TODO: Implement pageController
                        //controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        children: /*widget.state
                            .getExploreGeneralInformationCards(context),*/

                            [
                          ImageCard(
                            imageDirectory: 'assets/images/retro_logo.png',
                            heading: 'Weather',
                            cardHeight: 290.0,
                            margin: EdgeInsets.all(15.0),
                            onTap: () {
                              HtmlBottomSheet.showHtmlBottomSheet(
                                  context, widget.state.weather, false);
                            },
                          ),
                          ImageCard(
                            imageDirectory: 'assets/images/retro_logo.png',
                            heading: 'History',
                            cardHeight: 290.0,
                            margin: EdgeInsets.all(15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Custom Tab bar with Custom Indicator
            Container(
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
              child: DefaultTabController(
                length: 4,
                child: TabBar(
                    labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                    indicatorPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                    isScrollable: true,
                    labelColor: Color(0xFF000000),
                    unselectedLabelColor: Color(0xFF8a8a8a),
                    labelStyle: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    indicator: RoundedRectangleTabIndicator(
                        color: Color(0xFF000000), weight: 2.4, width: 14.4),
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text('Top Guides'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text('Selected Highlines'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text('Coastal Guides'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text('Alpine Guides'),
                        ),
                      )
                    ]),
              ),
            ),

            // ListView widget with PageView
            // Recommendations Section
            ///Uncomment this block
            /*Container(
              height: 218.4,
              margin: EdgeInsets.only(top: 16),
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  recommendations.length,
                  (int index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectedPlaceScreen(
                              recommendedModel: recommendations[index])));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 28.8),
                      width: 333.6,
                      height: 218.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        //Image would go here
                        //image:
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 19.2,
                            left: 19.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.8),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaY: 19.2, sigmaX: 19.2),
                                child: Container(
                                  height: 36,
                                  padding:
                                      EdgeInsets.only(left: 16.72, right: 14.4),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on),
                                      SizedBox(
                                        width: 9.52,
                                      ),
                                      */ /*Text(
                                        recommendations[index].name,
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 16.8),
                                      )*/ /*
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),*/

            // Dots Indicator
            // Using SmoothPageIndicator Library
            Padding(
              padding: EdgeInsets.only(left: 28.8, top: 28.8),
              /*child: SmoothPageIndicator(
                controller: _pageController,
                count: recommendations.length,
                effect: ExpandingDotsEffect(
                    activeDotColor: Color(0xFF8a8a8a),
                    dotColor: Color(0xFFababab),
                    dotHeight: 4.8,
                    dotWidth: 6,
                    spacing: 4.8),
              ),*/
            ),

            /*// Text Widget for Popular Categories
            Padding(
              padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Popular Categories',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Text(
                    'Show All ',
                    style: GoogleFonts.lato(
                      fontSize: 16.8,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8a8a8a),
                    ),
                  )
                ],
              ),
            ),

            // ListView for Popular Categories Section
            Container(
              margin: EdgeInsets.only(top: 33.6),
              height: 45.6,
              child: ListView.builder(
                itemCount: populars.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 28.8, right: 9.6),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 19.2),
                    height: 45.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      color: Color(populars[index].color),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 19.2,
                        ),
                        Image.asset(
                          populars[index].image,
                          height: 16.8,
                        ),
                        SizedBox(
                          width: 19.2,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            // ListView for Beach Section
            Container(
              margin: EdgeInsets.only(top: 28.8, bottom: 16.8),
              height: 124.8,
              child: ListView.builder(
                itemCount: beaches.length,
                padding: EdgeInsets.only(left: 28.8, right: 12),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 124.8,
                    width: 188.4,
                    margin: EdgeInsets.only(right: 16.8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            CachedNetworkImageProvider(beaches[index].image),
                      ),
                    ),
                  );
                },
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
