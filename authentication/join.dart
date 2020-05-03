import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ourwonderfullapp/authentication/cercle.dart';
import 'friend/friend.dart' ;

// ignore: camel_case_types
class join extends StatefulWidget {
  @override
  _joinState createState() => _joinState();
}

// ignore: camel_case_types
class _joinState extends State<join> {
  List<Friend> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    http.Response response =
    await http.get('https://randomuser.me/api/?results=25');

    setState(() {
      _friends = Friend.allFromResponse(response.body);
    });
  }

  Widget _buildFriendListTile(BuildContext context, int index) {
    var friend = _friends[index];

    return new ListTile(
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.location),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2E9DB),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Text("Parfait ! Vous êtes sur le point de rejoindre le cercle (nom du cercle)" ,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0 ,
              fontWeight: FontWeight.bold,
              color: Color(0xff739D84)
            ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text("Voici ce qui vous attend" ,
            style: TextStyle(
              fontSize: 18.0 ,
              color: Color(0xff739D84)
            ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 340.0,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow : [BoxShadow (color:Color(0xFFF1B97A),
                          blurRadius:20.0,
                          offset:new Offset(2.0,2.0)),]),
                  child: Center(
                    child: ListView.builder(
                      itemCount: _friends.length,
                      itemBuilder: _buildFriendListTile,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100.0,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              width: 250.0,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> join())) ;},
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                color: Color(0xffE8652D),
                child: Text(
                  '  Rejoindre  ',
                  style: TextStyle(
                      color: Color(0xffF1B97A),
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 250.0,
              child:  FlatButton(
                child:
                Text("Annuler",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color:Color(0xFFF1B97A),
                  ),
                ),
                onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> cercle())) ;},
              ),
            ),
          ],
        ));
  }
}
