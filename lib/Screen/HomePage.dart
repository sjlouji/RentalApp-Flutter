import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home(title: 'Home',);
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent, // makes highlight invisible too
                            onTap: (){
                              print('working');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Your Location', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                Container(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on, color: Colors.grey[750],size: 15,),
                                      SizedBox(width: 10,),
                                      Text('Chennai'),
                                      SizedBox(width: 5,),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      )
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.notifications, color: Colors.grey[700],size: 30,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.grey,),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text("Categories", style: new TextStyle(fontSize: 25.0,color: Colors.grey[900],fontWeight: FontWeight.bold),),
                          Text("See All"),
                        ],
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.only(top: 20),
                        child: ScrollConfiguration(
                          behavior: ListViewBehaviour(),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              makeCategory(cat_image: 'assets/category/bike.png',title: 'Bikes'),
                              makeCategory(cat_image: 'assets/category/mobile.png',title: 'Mobile'),
                              makeCategory(cat_image: 'assets/category/cars.png',title: 'Cars'),
                              makeCategory(cat_image: 'assets/category/electronics.png',title: 'Electronics'),
                              makeCategory(cat_image: 'assets/category/fashion.png',title: 'Fashion'),
                              makeCategory(cat_image: 'assets/category/books.png',title: 'Books'),
                              makeCategory(cat_image: 'assets/category/sports.png',title: 'Sports'),
                              makeCategory(cat_image: 'assets/category/bike.png',title: 'Bikes'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: ScrollConfiguration(
                          behavior: ListViewBehaviour(),
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: <Widget>[
                              makeFeed(cat_image: 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202003/Avoid_leaving_your_bike_in_ope.jpeg?.TfqAOzq1QVagtkIT4jP0omM54xiHQgI&size=770:433',title: 'Bikes'),
                              SizedBox(height: 2,child: Container(color: Colors.grey[200],),),
                              makeFeed(cat_image: 'https://i.ytimg.com/vi/R7Vz4lQQQGo/maxresdefault.jpg',title: 'Mobile'),
                              SizedBox(height: 2,child: Container(color: Colors.grey[200],),),
                              makeFeed(cat_image: 'https://www.cartoq.com/wp-content/uploads/2019/08/swift-featured.jpg',title: 'Cars'),
                              SizedBox(height: 2,child: Container(color: Colors.grey[200],),),
                              makeFeed(cat_image: 'https://apollo-singapore.akamaized.net/v1/files/gamnsho6uvhi3-IN/image;s=272x0',title: 'Electronics'),
                              SizedBox(height: 2,child: Container(color: Colors.grey[200],),),
                              makeFeed(cat_image: 'https://i.ytimg.com/vi/R7Vz4lQQQGo/maxresdefault.jpg',title: 'Fashion'),
                              SizedBox(height: 2,child: Container(color: Colors.grey[200],),),
                              makeFeed(cat_image: 'https://i.ytimg.com/vi/R7Vz4lQQQGo/maxresdefault.jpg',title: 'Books'),
                              SizedBox(height: 2,child: Container(color: Colors.grey[200],),),
                              makeFeed(cat_image: 'https://i.ytimg.com/vi/R7Vz4lQQQGo/maxresdefault.jpg',title: 'Sports'),
                              SizedBox(height: 2,child: Container(color: Colors.grey[200],),),
                              makeFeed(cat_image: 'https://i.ytimg.com/vi/R7Vz4lQQQGo/maxresdefault.jpg',title: 'Bikes'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({cat_image,title}){
    return(
        AspectRatio(
          aspectRatio: 1/.8,
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 30,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage(cat_image),scale: 1, fit: BoxFit.fitWidth),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.blue.withOpacity(.1),
                        Colors.blue.withOpacity(.1)
                      ]
                  )
              ),
            ),
          ),
        )
    );
  }

  Widget makeFeed({cat_image,title}){
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 5, top: 5),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 100,
            child: Image.network(cat_image, width: 200,),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(title, style: TextStyle(fontSize: 23),),
                ),
                Text('Joan Louji')
              ],
            ),
          ),
        ],
      ),
    );
  }

}


class ListViewBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}