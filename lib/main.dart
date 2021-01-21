import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/database/highline_database.dart';
import 'package:slacker/root_widget.dart';
import 'services/providers/tab_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HighlineDbProvider.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootWidget(),
        theme: ThemeData(
          textTheme: TextTheme(
            headline3: TextStyle(
              fontFamily: 'PlayfairDisplay',
              letterSpacing: 0.7,
              wordSpacing: 0.5,
              height: 1.2,
              color: Colors.grey[900],
            ),
            headline4: TextStyle(
              fontFamily: 'PlayfairDisplay',
              letterSpacing: 0.7,
              wordSpacing: 0.5,
              height: 1.2,
              color: Colors.grey[900],
            ),
            headline5: TextStyle(
              fontFamily: 'PlayfairDisplay',
              letterSpacing: 0.7,
              wordSpacing: 0.5,
              height: 1.2,
              color: Colors.grey[900],
            ),
            headline6: TextStyle(
              fontFamily: 'PlayfairDisplay',
              letterSpacing: 0.7,
              wordSpacing: 0.5,
              height: 1.2,
              color: Colors.grey[900],
            ),
            subtitle1: TextStyle(
              fontFamily: 'Montserrat',
              letterSpacing: 0.3,
              wordSpacing: 0.5,
              height: 1.2,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontFamily: 'Montserrat',
              letterSpacing: 0.3,
              wordSpacing: 0.5,
              height: 1.2,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              fontFamily: 'Montserrat',
              letterSpacing: 0.7,
              wordSpacing: 0.5,
              height: 1.2,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
