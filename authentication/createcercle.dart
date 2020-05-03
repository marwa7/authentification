import 'package:flutter/material.dart';
import 'package:ourwonderfullapp/authentication/cercle.dart';
import 'package:ourwonderfullapp/authentication/code.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  final formkey = GlobalKey <FormState>();

  Widget _avatar() {
    return Center(child :
    Column ( children : <Widget> [
      Container (
        height: 300,
        width: 200,
        decoration : new  BoxDecoration  (
            shape: BoxShape.circle,
            boxShadow : [ new BoxShadow (
              color:Colors.black12,
              blurRadius:10.0,
              offset:new Offset(0.0,10.0),) ]),

        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child : Icon (Icons.camera_enhance , color: Color(0xffE8652D) , size : 65.0 ,  ),


        ),),



    ],
    ),

    );
  }

  Widget _code() {
    return Positioned(
      top: 50, // hint text + code + en bas un autre bouton send
      child: Column ( children: <Widget>[ Container(
        margin: EdgeInsets.all(20),
        height: 450,
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
          height: 250,
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _avatar(),
              SizedBox( height: 10.0),
              Container(
                width: 300.0,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xff739D84))),
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Nom du cercle",
                    labelStyle: TextStyle(color:Color(0xff739D84) , fontSize: 18.0 , fontWeight: FontWeight.bold ),
                    hintText: "Saisissez le nom de votre cercle",
                    hintStyle: TextStyle(
                        color: Color(0xff739D84), fontSize: 15.0),
                  ),
                ),
              ),
              SizedBox( height: 10.0),
            ],
          ),
        ),
      ),
        SizedBox( height:20.0),
        Row( children:<Widget> [
          RaisedButton(
            onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> code())) ;},
            padding :EdgeInsets.all(15.0),
            child: Text("         Prochain          ", style : TextStyle(fontSize:18.0,fontWeight:FontWeight.bold)),
            color:  Color(0xffE8652D),
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
            textColor: Color(0xffF1B97A),
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
          'Créer un nouveau cercle',
          style: TextStyle(
              color: Color(0xffF2E9DB),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
              onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> cercle())) ;}
            ),
      ),
      backgroundColor: Color(0xffF2E9DB),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _code(),

          ],
        ),
      ),
    );
  }
  moveToLastSreen() {
    Navigator.pop(context);
  }
}