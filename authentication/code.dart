import 'package:flutter/material.dart';
import 'package:ourwonderfullapp/authentication/createcercle.dart';


class code extends StatefulWidget {
  @override
  _codeState createState() => _codeState();
}

class _codeState extends State<code> {

  final formkey = GlobalKey <FormState>();

  Widget _avatar() {
    return Positioned( child : Row ( children:<Widget> [
      SizedBox( width :80.0),
      Image(   image: AssetImage("assets/images/send.png"),
        height: 250 ,
        width: 250 ,)
    ]
    ),
    );

  }

  Widget _code() {
    return Positioned(
      top: 226, // hint text + code + en bas un autre bouton send
      child: Column ( children: <Widget>[ Container(
        margin: EdgeInsets.all(20),
        height: 240,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20.0,
                  offset: new Offset(10.0, 10.0)),
            ]),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),

              Text(
                " Partager ce code avec les personnes pour qu'elles rejoignent votre cercle ",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff739D84)),
                textAlign: TextAlign.center,),
              SizedBox( height: 15.0),


              TextField(  enabled :false , textAlign : TextAlign.center, decoration: InputDecoration(border :InputBorder.none,  hintText:"6A-82-MR" , hintStyle: TextStyle(
                  fontSize:40.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF57C00))
              )),

            ],
          ),
        ),
      ),

        SizedBox( height:20.0),
        Row( children:<Widget> [
          FlatButton(
            onPressed:() => print("send code "),
            padding :EdgeInsets.all(15.0),
            child: Text('Envoyer le code', style : TextStyle(fontSize:18.0,fontWeight:FontWeight.bold)),
            color:  Color(0xffF1B97A),
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
            textColor: Color(0xffE8652D),
          ),
          SizedBox ( width : 8.0) ,FlatButton(
            onPressed:() => print("send code "),
            padding :EdgeInsets.all(15.0),
            child: Text('Envoyer plutard', style : TextStyle(fontSize:18.0,fontWeight:FontWeight.bold)),
            color:  Color(0xffF1B97A),
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
            textColor: Color(0xffE8652D),
          ),
        ],
        ),
      ] ,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xffF2E9DB)),
        backgroundColor: Color(0xff739D84),
        title: Text(
          'Nom du cercle',
          style: TextStyle(
              color: Color(0xffF2E9DB),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
              onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CreatePage())) ;},),
      ),
      backgroundColor: Color(0xffF2E9DB),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 70,
            ),
            _avatar(),
            _code(),

          ],
        ),
      ),
    );
  }
}

























































































































































































































































































