import 'package:flutter/material.dart';
import './home.dart';

class UserPage extends StatelessWidget {
  UserPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("BERANDA"),
        ]),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Click search');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_active), 
            onPressed: () {
              print('Click start');
            },
          ),
        ],
      ),

      //DRAWER
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Ni Kadek Hermayanti"), 
              accountEmail: new Text("hermayanti@undiksha.ac.id"),
              currentAccountPicture: new GestureDetector(
                onTap: () {},
                child: new CircleAvatar(
                  child: new Image.asset('assets/appimages/herma.jpg'),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/appimages/bg.jpg'),
                  fit: BoxFit.cover
                ),
              ),
            ),

            new ListTile(
              title: new Text('Notifications'),
              trailing: new Icon(Icons.notifications_none),
            ),

            new ListTile(
              title: new Text('Wishlist'),
              trailing: new Icon(Icons.bookmark_border),
            ),

            new ListTile(
              title: new Text('Akun'),
              trailing: new Icon(Icons.verified_user),
            ),
            
            Divider(height: 2,),
            new ListTile(
              title: new Text('Setting'),
              trailing: new Icon(Icons.settings),
            ),
          ],
        )
      ),
      //END DRAWER

      body: new Column(
        children: <Widget>[
          Image.asset("assets/appimages/bunga.jpg"),
        
          Container(
            color: Colors.pinkAccent[100],
            padding: const EdgeInsets.all(10),

            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oniflorist Singaraja',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20
                        ),
                      ),
                      Text(
                        'Buleleng, Bali - Indonesia',
                        style: TextStyle(
                          color: Colors.black,
                        )
                      )
                    ],
                  ),
                )
              ]
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "CALL",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.near_me),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "ROUTE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),
                
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.share),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),
              ]
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Usaha Oniflorist ini dibuka pada tahun 2010 yang memiliki 1 cabang '
              'terletak di Jalan A.Yani No.189 A, Banyuasri, Buleleng.'
              'Awal pemasaran usaha dilakukan dengan cara menawarkan ke orang-orang terdekat '
              'dan dengan kemajuan usaha ini owner mumbuatkan akun Instagram untuk memudahkan pemasaran.'
              'Selain menjual bunga Oniflorist juga menerima pesanan dekorasi ulang tahun, pernikahan dan lain-lain.',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}