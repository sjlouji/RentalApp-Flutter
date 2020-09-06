import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:rentalapp_flutter/Screen/HomePage.dart';


void main() {
  runApp(DashBoardPage());
}

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: DashboardHome(title: 'Dashboard',),
      theme: new ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: ZoomPageTransitionsBuilder(),}),
      ),
    );
  }
}

class DashboardHome extends StatefulWidget {
  DashboardHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}



class _DashboardState extends State<DashboardHome> {

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text("Chats")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text("My Adds"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"),
        )
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("Chats");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("My_Adds");
        break;
      case 3:
        _navigatorKey.currentState.pushReplacementNamed("Settings");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Account":
        return MaterialPageRoute(builder: (context) => Container(color: Colors.blue,child: Center(child: Text("Account"))));
      case "Settings":
        return MaterialPageRoute(builder: (context) => Container(color: Colors.green,child: Center(child: Text("Settings"))));
      case "My_Adds":
        return MaterialPageRoute(builder: (context) => Container(color: Colors.blueGrey,child: Center(child: Text("My Adds"))));
      case "Chats":
        return MaterialPageRoute(builder: (context) => Container(color: Colors.red,child: Center(child: Text("Chats"))));
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffffff),
      bottomNavigationBar: _bottomNavigationBar(),
      body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
    );
  }
}
