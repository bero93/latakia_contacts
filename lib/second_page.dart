import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController num = TextEditingController();

  String _result = "";
  Color c = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(hintColor: c),
      home: Scaffold(

          backgroundColor: Color.fromRGBO(56, 133, 223, 1),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                   Container(
                    width: double.infinity,
                    height: 250,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage("images/top.png"),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (value) {
                     setState(() {
                       if(value.length==6){
                         _result = numChooser(num.text);

                         c = Colors.greenAccent;
                       }else if(value.length<6)
                       _result = "";
                         c = Colors.white;
                     });
                    },
                    controller: num,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    style: TextStyle(color: Colors.white, fontSize: 24),

                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                        borderSide: BorderSide(
                          color: c,
                          width:2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                        borderSide: BorderSide(
                          color: c,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "الرقم الجديد",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: "aljazeera"),
                ),
                Text((_result.length>9)?_result.substring(3):"غير موجود",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "aljazeera")),

                      Image(
                        width: 80,
                       height: 80,

                       image: AssetImage("images/bottom.png"),
                     ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         "بوضع لايك لصفحتنا",
                         style: TextStyle(fontFamily: "aljazeera",color: Colors.white),
                       ),
                       SizedBox(
                         width: 10,
                       ),
                       Center(
                         child: RaisedButton(
                           color: Colors.white
                           ,onPressed: ()async{
                           const url = "fb://page/335413730561140";
                           if(await canLaunch(url))
                             await launch(url);
                           else  await launch("https://www.facebook.com/zprojects");
                         },child: IconTheme(
                           data: IconThemeData(color: Colors.blue[700]),
                           child: Icon(
                               Icons.thumb_up
                           ),
                         ),
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15.0)),),
                       ),
                       SizedBox(
                         width: 10,
                       ),
                       Text(
                         "الرجاء الدعم لعملنا",
                         style: TextStyle(fontFamily: "aljazeera",color: Colors.white),
                       ),
                     ],
                   ),

              ],
            ),
          )),
    );
  }
}
