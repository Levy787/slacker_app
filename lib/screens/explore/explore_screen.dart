import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slacker/globals.dart' as globals;
import 'package:slacker/models/states_class.dart';
import 'package:slacker/services/providers/state_provider.dart';
import 'package:slacker/widgets/custom/rounded_rectangle_tab_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const double kExplorePageHorizontalPadding = 15.0;

class ExploreScreen extends StatelessWidget {
  static const String id = 'explore_screen';
  final _pageController = PageController(viewportFraction: 0.8);

  Column stateDescription(
      {BuildContext context, String stateName, String detailedDescription}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 5.0,
            left: kExplorePageHorizontalPadding,
            right: kExplorePageHorizontalPadding,
          ),
          child: Text(
            stateName,
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
            detailedDescription,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Container generalInformation({BuildContext context, List<Widget> cards}) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.symmetric(vertical: 15.0),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'General\nInformation',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            child: Text(
              'Want to know more about Tasmania?\nHave a look at it\'s history, ethics and other guides.',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: 320.0,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: cards,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*List<Widget> getExploreGeneralInformationCards(BuildContext context) {
    Map<String, String> nonNullGeneralInformation = getGeneralInformation();
    List<Widget> returnWidgets = [];

    for (var heading in nonNullGeneralInformation.keys) {
      returnWidgets.add(
        ImageCard(
          imageDirectory: 'assets/images/retro_logo.png',
          heading: heading,
          cardHeight: 290.0,
          margin: EdgeInsets.all(15.0),
          onTap: () {
            Navigator.of(context).pushNamed(
              ExploreGeneralInformationScreen.id,
              arguments: {'displayHtml': nonNullGeneralInformation[heading]},
            );
          },
        ),
      );
    }
    return returnWidgets;
  }*/

  @override
  Widget build(BuildContext context) {
    StateProvider tabProvider = Provider.of<StateProvider>(context);
    States stateData = tabProvider.activeStateData;
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          stateDescription(
            context: context,
            stateName: stateData.stateName,
            detailedDescription: stateData.detailedDescription,
          ),
          /*generalInformation(
            context: context,
            cards: stateData.getExploreGeneralInformationCards(context),
          ),*/
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
                labelStyle:
                    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
                unselectedLabelStyle:
                    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
                indicator: RoundedRectangleTabIndicator(
                    color: Color(0xFF000000), weight: 2, width: 20),
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
                ],
              ),
            ),
          ),
          Container(
            height: 218.4,
            margin: EdgeInsets.only(top: 16),
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                5,
                //recommendations.length,
                (int index) => GestureDetector(
                  onTap: () {
                    print('Recommendation tap index');
                    /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectedPlaceScreen(
                              recommendedModel: recommendations[index])));*/
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 28.8),
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                            image: AssetImage('assets/images/retro_logo.png'))),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 20.0,
                          left: 20.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaY: 20.0, sigmaX: 20.0),
                              child: Container(
                                height: 36.0,
                                padding:
                                    EdgeInsets.only(left: 17.0, right: 14.0),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Reco Name',
                                      //recommendations[index].name,
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 17.0),
                                    )
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
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 30.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 5,
              effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xFF8a8a8a),
                  dotColor: Color(0xFFababab),
                  dotHeight: 5.0,
                  dotWidth: 6,
                  spacing: 5.0),
            ),
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
    );
  }
}
