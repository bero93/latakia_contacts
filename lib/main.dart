import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _requestPermission() async {
    await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    List<Contact> contactsList = contacts.toList();
    for (int i = 0; i < contactsList.length; i++) {
      Contact c = contactsList.elementAt(i);
      print(c.givenName);
      List<Item> phones = c.phones.toList();
      for (int j = 0; j < phones.length; j++) {
        String firstTrim =
            phones[j].value.replaceAll(new RegExp(r"\s\b|\b\s"), "");

        String secondTrim = firstTrim.replaceAll(RegExp(r"[^\s\w]"), "");
        if (secondTrim.startsWith("041")) {
          String afterSub = secondTrim.substring(3);
          if (afterSub.length == 6) {
            setState(() {
              _counter++;
            });
            await ContactsService.deleteContact(c);
            phones[j].value = numChooser(afterSub);
            c.phones = phones;
            await ContactsService.addContact(c);
          }
        }
      }
    }
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);


    var alert2 = AlertDialog(

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Text("تم تعديل : $_counter رقم",style: TextStyle(fontFamily: "aljazeera"),),
          Container(
            height: 60,
            width: 60,
            child: IconTheme(
              data: IconThemeData(
                color: Colors.green,
              ),
              child: Icon(Icons.check,size: 60.0,),
            ),
          ),
        ]
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)),
    );
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return alert2;
        });
  }

  String numChooser(String num) {
    String newNum = "";

    //the first page tishreen

    if (num.startsWith("664")) {
      newNum = "7164" + num.substring(3);
    }
    if (num.startsWith("424") ||
        num.startsWith("425") ||
        num.startsWith("427") ||
        num.startsWith("431") ||
        num.startsWith("432") ||
        num.startsWith("433") ||
        num.startsWith("434") ||
        num.startsWith("435") ||
        num.startsWith("436") ||
        num.startsWith("437") ||
        num.startsWith("438") ||
        num.startsWith("439") ||
        num.startsWith("4098") ||
        num.startsWith("4099") ||
        num.startsWith("440") ||
        num.startsWith("441") ||
        num.startsWith("444") ||
        num.startsWith("445") ||
        num.startsWith("446") ||
        num.startsWith("607") ||
        num.startsWith("662") ||
        num.startsWith("21") ||
        num.startsWith("23") ||
        num.startsWith("24") ||
        num.startsWith("25") ||
        num.startsWith("220") ||
        num.startsWith("221") ||
        num.startsWith("222") ||
        num.startsWith("223") ||
        num.startsWith("224") ||
        num.startsWith("225") ||
        num.startsWith("41") ||
        num.startsWith("420") ||
        num.startsWith("421") ||
        num.startsWith("422") ||
        num.startsWith("423")) {
      newNum = "2" + num;
    }
    if (num.startsWith("84")) {
      newNum = "654" + num.substring(2);
    }
    if (num.startsWith("45")) {
      newNum = "255" + num.substring(2);
    }
    if (num.startsWith("46")) {
      newNum = "256" + num.substring(2);
    }
    if (num.startsWith("47")) {
      newNum = "257" + num.substring(2);
    }
    if (num.startsWith("49")) {
      newNum = "259" + num.substring(2);
    }
    if (num.startsWith("89")) {
      newNum = "889" + num.substring(2);
    }
    if (num.startsWith("80")) {
      newNum = "880" + num.substring(2);
    }
    if (num.startsWith("82")) {
      newNum = "882" + num.substring(2);
    }
    if (num.startsWith("75")) {
      newNum = "455" + num.substring(2);
    }
    if (num.startsWith("73")) {
      newNum = "433" + num.substring(2);
    }
    if (num.startsWith("31")) {
      newNum = "231" + num.substring(2);
    }
    if (num.startsWith("32")) {
      newNum = "232" + num.substring(2);
    }
    if (num.startsWith("33")) {
      newNum = "233" + num.substring(2);
    }
    if (num.startsWith("34")) {
      newNum = "274" + num.substring(2);
    }
    if (num.startsWith("35")) {
      newNum = "275" + num.substring(2);
    }
    if (num.startsWith("36")) {
      newNum = "276" + num.substring(2);
    }
    if (num.startsWith("37")) {
      newNum = "277" + num.substring(2);
    }
    if (num.startsWith("55")) {
      newNum = "245" + num.substring(2);
    }
    if (num.startsWith("59")) {
      newNum = "249" + num.substring(2);
    }
    if (num.startsWith("38")) {
      newNum = "288" + num.substring(2);
    }
    if (num.startsWith("39")) {
      newNum = "289" + num.substring(2);
    }
    if (num.startsWith("265")) {
      newNum = "7165" + num.substring(3);
    }
    if (num.startsWith("651")) {
      newNum = "7351" + num.substring(3);
    }
    if (num.startsWith("486")) {
      newNum = "2586" + num.substring(3);
    }
    if (num.startsWith("487")) {
      newNum = "2587" + num.substring(3);
    }
    if (num.startsWith("428")) {
      newNum = "2128" + num.substring(3);
    }
    if (num.startsWith("487")) {
      newNum = "2587" + num.substring(3);
    }
    if (num.startsWith("428")) {
      newNum = "2128" + num.substring(3);
    }
    if (num.startsWith("448")) {
      newNum = "2148" + num.substring(3);
    }
    if (num.startsWith("404")) {
      newNum = "2144" + num.substring(3);
    }
    if (num.startsWith("405")) {
      newNum = "21458" + num.substring(3);
    }
    if (num.startsWith("543")) {
      newNum = "2143" + num.substring(3);
    }
    if (num.startsWith("546")) {
      newNum = "2146" + num.substring(3);
    }
    if (num.startsWith("547")) {
      newNum = "2147" + num.substring(3);
    }
    if (num.startsWith("538")) {
      newNum = "2138" + num.substring(3);
    }
    if (num.startsWith("539")) {
      newNum = "2139" + num.substring(3);
    }
    if (num.startsWith("398")) {
      newNum = "2998" + num.substring(3);
    }
    if (num.startsWith("606")) {
      newNum = "2406" + num.substring(3);
    }
    if (num.startsWith("600")) {
      newNum = "2400" + num.substring(3);
    }
    if (num.startsWith("601")) {
      newNum = "2147" + num.substring(3);
    }
    if (num.startsWith("602")) {
      newNum = "2402" + num.substring(3);
    }
    if (num.startsWith("603")) {
      newNum = "2403" + num.substring(3);
    }
    if (num.startsWith("605")) {
      newNum = "2405" + num.substring(3);
    }
    if (num.startsWith("661")) {
      newNum = "2161" + num.substring(3);
    }
    if (num.startsWith("262")) {
      newNum = "2162" + num.substring(3);
    }
    if (num.startsWith("271")) {
      newNum = "2631" + num.substring(3);
    }
    if (num.startsWith("263")) {
      newNum = "2663" + num.substring(3);
    }
    if (num.startsWith("260")) {
      newNum = "2660" + num.substring(3);
    }
    if (num.startsWith("660")) {
      newNum = "2860" + num.substring(3);
    }
    if (num.startsWith("261")) {
      newNum = "2861" + num.substring(3);
    }
    //the second page sanjwan
    if (num.startsWith("264")) {
      newNum = "2864" + num.substring(3);
    }
    if (num.startsWith("348")) {
      newNum = "2848" + num.substring(3);
    }
    if (num.startsWith("700")) {
      newNum = "2300" + num.substring(3);
    }
    if (num.startsWith("701")) {
      newNum = "2301" + num.substring(3);
    }
    if (num.startsWith("344")) {
      newNum = "2844" + num.substring(3);
    }
    if (num.startsWith("345")) {
      newNum = "2845" + num.substring(3);
    }
    if (num.startsWith("346")) {
      newNum = "2846" + num.substring(3);
    }
    if (num.startsWith("347")) {
      newNum = "2847" + num.substring(3);
    }
    if (num.startsWith("670")) {
      newNum = "4570" + num.substring(3);
    }
    if (num.startsWith("689")) {
      newNum = "4689" + num.substring(3);
    }
    if (num.startsWith("671")) {
      newNum = "4571" + num.substring(3);
    }
    if (num.startsWith("635")) {
      newNum = "4635" + num.substring(3);
    }
    if (num.startsWith("636")) {
      newNum = "4636" + num.substring(3);
    }
    if (num.startsWith("637")) {
      newNum = "4637" + num.substring(3);
    }
    if (num.startsWith("638")) {
      newNum = "4638" + num.substring(3);
    }
    if (num.startsWith("683")) {
      newNum = "4683" + num.substring(3);
    }
    if (num.startsWith("740")) {
      newNum = "4440" + num.substring(3);
    }
    if (num.startsWith("741")) {
      newNum = "4441" + num.substring(3);
    }
    if (num.startsWith("742")) {
      newNum = "4442" + num.substring(3);
    }
    if (num.startsWith("682")) {
      newNum = "4682" + num.substring(3);
    }
    if (num.startsWith("687")) {
      newNum = "4687" + num.substring(3);
    }
    if (num.startsWith("645")) {
      newNum = "4645" + num.substring(3);
    }
    if (num.startsWith("400")) {
      newNum = "4100" + num.substring(3);
    }
    if (num.startsWith("407")) {
      newNum = "4107" + num.substring(3);
    }
    if (num.startsWith("408")) {
      newNum = "4108" + num.substring(3);
    }
    if (num.startsWith("442")) {
      newNum = "4142" + num.substring(3);
    }
    if (num.startsWith("647")) {
      newNum = "4647" + num.substring(3);
    }
    if (num.startsWith("518")) {
      newNum = "4518" + num.substring(3);
    }
    if (num.startsWith("797")) {
      newNum = "4797" + num.substring(3);
    }
    if (num.startsWith("798")) {
      newNum = "4798" + num.substring(3);
    }
    if (num.startsWith("648")) {
      newNum = "4648" + num.substring(3);
    }
    if (num.startsWith("793")) {
      newNum = "4293" + num.substring(3);
    }
    if (num.startsWith("794")) {
      newNum = "4294" + num.substring(3);
    }
    if (num.startsWith("795")) {
      newNum = "4295" + num.substring(3);
    }
    if (num.startsWith("796")) {
      newNum = "4296" + num.substring(3);
    }
    if (num.startsWith("684")) {
      newNum = "4684" + num.substring(3);
    }
    if (num.startsWith("686")) {
      newNum = "4686" + num.substring(3);
    }
    if (num.startsWith("680")) {
      newNum = "4880" + num.substring(3);
    }
    if (num.startsWith("681")) {
      newNum = "4881" + num.substring(3);
    }
    if (num.startsWith("401")) {
      newNum = "4201" + num.substring(3);
    }
    if (num.startsWith("402")) {
      newNum = "4202" + num.substring(3);
    }
    if (num.startsWith("443")) {
      newNum = "4243" + num.substring(3);
    }
    if (num.startsWith("604")) {
      newNum = "4204" + num.substring(3);
    }
    if (num.startsWith("643")) {
      newNum = "4643" + num.substring(3);
    }
    if (num.startsWith("646")) {
      newNum = "4646" + num.substring(3);
    }
    if (num.startsWith("666")) {
      newNum = "4266" + num.substring(3);
    }
    if (num.startsWith("667")) {
      newNum = "4267" + num.substring(3);
    }
    if (num.startsWith("668")) {
      newNum = "4268" + num.substring(3);
    }
    if (num.startsWith("669")) {
      newNum = "4269" + num.substring(3);
    }
    if (num.startsWith("657")) {
      newNum = "4257" + num.substring(3);
    }
    if (num.startsWith("787")) {
      newNum = "4787" + num.substring(3);
    }
    if (num.startsWith("788")) {
      newNum = "4788" + num.substring(3);
    }
    if (num.startsWith("789")) {
      newNum = "4789" + num.substring(3);
    }
    if (num.startsWith("685")) {
      newNum = "4685" + num.substring(3);
    }
    if (num.startsWith("678")) {
      newNum = "4578" + num.substring(3);
    }
    if (num.startsWith("579")) {
      newNum = "4679" + num.substring(3);
    }
    if (num.startsWith("644")) {
      newNum = "4644" + num.substring(3);
    }
    if (num.startsWith("688")) {
      newNum = "4688" + num.substring(3);
    }
    //the third page bkrama
    if (num.startsWith("859")) {
      newNum = "6859" + num.substring(3);
    }
    if (num.startsWith("852")) {
      newNum = "6252" + num.substring(3);
    }
    if (num.startsWith("569")) {
      newNum = "6969" + num.substring(3);
    }
    if (num.startsWith("850")) {
      newNum = "6650" + num.substring(3);
    }
    if (num.startsWith("851")) {
      newNum = "6651" + num.substring(3);
    }
    if (num.startsWith("764")) {
      newNum = "6764" + num.substring(3);
    }
    if (num.startsWith("765")) {
      newNum = "6765" + num.substring(3);
    }
    if (num.startsWith("766")) {
      newNum = "6766" + num.substring(3);
    }
    if (num.startsWith("267")) {
      newNum = "6767" + num.substring(3);
    }
    if (num.startsWith("268")) {
      newNum = "6768" + num.substring(3);
    }
    if (num.startsWith("856")) {
      newNum = "6356" + num.substring(3);
    }
    if (num.startsWith("568")) {
      newNum = "6868" + num.substring(3);
    }
    if (num.startsWith("857")) {
      newNum = "6457" + num.substring(3);
    }
    if (num.startsWith("562")) {
      newNum = "6262" + num.substring(3);
    }
    if (num.startsWith("563")) {
      newNum = "6263" + num.substring(3);
    }
    if (num.startsWith("588")) {
      newNum = "7188" + num.substring(3);
    }
    if (num.startsWith("693")) {
      newNum = "7993" + num.substring(3);
    }
    if (num.startsWith("784")) {
      newNum = "7184" + num.substring(3);
    }
    if (num.startsWith("785")) {
      newNum = "7185" + num.substring(3);
    }
    if (num.startsWith("786")) {
      newNum = "7186" + num.substring(3);
    }
    if (num.startsWith("871")) {
      newNum = "7271" + num.substring(3);
    }
    if (num.startsWith("872")) {
      newNum = "7272" + num.substring(3);
    }
    if (num.startsWith("274")) {
      newNum = "7274" + num.substring(3);
    }
    if (num.startsWith("665")) {
      newNum = "7365" + num.substring(3);
    }
    if (num.startsWith("609")) {
      newNum = "7309" + num.substring(3);
    }
    if (num.startsWith("641")) {
      newNum = "7441" + num.substring(3);
    }
    if (num.startsWith("691")) {
      newNum = "7991" + num.substring(3);
    }
    if (num.startsWith("653")) {
      newNum = "7353" + num.substring(3);
    }
    if (num.startsWith("608")) {
      newNum = "7308" + num.substring(3);
    }
    if (num.startsWith("694")) {
      newNum = "7994" + num.substring(3);
    }
    if (num.startsWith("656")) {
      newNum = "7356" + num.substring(3);
    }
    if (num.startsWith("692")) {
      newNum = "7992" + num.substring(3);
    }
    if (num.startsWith("658")) {
      newNum = "7358" + num.substring(3);
    }
    if (num.startsWith("480")) {
      newNum = "7680" + num.substring(3);
    }
    if (num.startsWith("481")) {
      newNum = "7681" + num.substring(3);
    }
    if (num.startsWith("485")) {
      newNum = "7685" + num.substring(3);
    }
    if (num.startsWith("582")) {
      newNum = "7682" + num.substring(3);
    }
    if (num.startsWith("586")) {
      newNum = "7686" + num.substring(3);
    }
    if (num.startsWith("695")) {
      newNum = "7995" + num.substring(3);
    }
    if (num.startsWith("640")) {
      newNum = "7440" + num.substring(3);
    }
    if (num.startsWith("690")) {
      newNum = "7990" + num.substring(3);
    }
    if (num.startsWith("630")) {
      newNum = "7530" + num.substring(3);
    }
    if (num.startsWith("872")) {
      newNum = "7272" + num.substring(3);
    }
    if (num.startsWith("631")) {
      newNum = "7531" + num.substring(3);
    }
    if (num.startsWith("537")) {
      newNum = "7337" + num.substring(3);
    }
    if (num.startsWith("536")) {
      newNum = "7336" + num.substring(3);
    }
    if (num.startsWith("488")) {
      newNum = "7888" + num.substring(3);
    }
    if (num.startsWith("489")) {
      newNum = "7889" + num.substring(3);
    }
    if (num.startsWith("659")) {
      newNum = "7359" + num.substring(3);
    }
    if (num.startsWith("429")) {
      newNum = "7129" + num.substring(3);
    }
    if (num.startsWith("403")) {
      newNum = "7103" + num.substring(3);
    }
    if (num.startsWith("406")) {
      newNum = "7106" + num.substring(3);
    }
    if (num.startsWith("430")) {
      newNum = "7130" + num.substring(3);
    }
    if (num.startsWith("524")) {
      newNum = "7124" + num.substring(3);
    }
    if (num.startsWith("525")) {
      newNum = "7125" + num.substring(3);
    }
    if (num.startsWith("791")) {
      newNum = "7291" + num.substring(3);
    }
    if (num.startsWith("792")) {
      newNum = "7292" + num.substring(3);
    }
    if (num.startsWith("642")) {
      newNum = "7542" + num.substring(3);
    }
    if (num.startsWith("654")) {
      newNum = "7254" + num.substring(3);
    }
    if (num.startsWith("655")) {
      newNum = "7255" + num.substring(3);
    }
    if (num.startsWith("252")) {
      newNum = "7252" + num.substring(3);
    }
    if (num.startsWith("253")) {
      newNum = "7253" + num.substring(3);
    }
    if (num.startsWith("777")) {
      newNum = "7577" + num.substring(3);
    }
    if (num.startsWith("778")) {
      newNum = "7578" + num.substring(3);
    }
    if (num.startsWith("779")) {
      newNum = "7579" + num.substring(3);
    }
    if (num.startsWith("276")) {
      newNum = "7576" + num.substring(3);
    }
    if (num.startsWith("774")) {
      newNum = "7674" + num.substring(3);
    }
    if (num.startsWith("775")) {
      newNum = "7675" + num.substring(3);
    }
    if (num.startsWith("776")) {
      newNum = "7676" + num.substring(3);
    }
    if (num.startsWith("277")) {
      newNum = "7677" + num.substring(3);
    }
    if (num.startsWith("278")) {
      newNum = "7678" + num.substring(3);
    }
    if (num.startsWith("482")) {
      newNum = "7482" + num.substring(3);
    }
    if (num.startsWith("483")) {
      newNum = "7483" + num.substring(3);
    }
    if (num.startsWith("780")) {
      newNum = "7580" + num.substring(3);
    }
    if (num.startsWith("781")) {
      newNum = "7581" + num.substring(3);
    }
    if (num.startsWith("782")) {
      newNum = "7582" + num.substring(3);
    }
    if (num.startsWith("783")) {
      newNum = "7583" + num.substring(3);
    }
    if (num.startsWith("280")) {
      newNum = "7380" + num.substring(3);
    }
    if (num.startsWith("284")) {
      newNum = "7584" + num.substring(3);
    }
    if (num.startsWith("710")) {
      newNum = "7710" + num.substring(3);
    }
    if (num.startsWith("711")) {
      newNum = "7711" + num.substring(3);
    }
    if (num.startsWith("712")) {
      newNum = "7712" + num.substring(3);
    }
    if (num.startsWith("713")) {
      newNum = "7713" + num.substring(3);
    }
    if (num.startsWith("719")) {
      newNum = "7719" + num.substring(3);
    }
    if (num.startsWith("650")) {
      newNum = "7350" + num.substring(3);
    }
    // fourth hamam manhal
    if (num.startsWith("516")) {
      newNum = "8761" + num.substring(3);
    }
    if (num.startsWith("514")) {
      newNum = "8714" + num.substring(3);
    }
    if (num.startsWith("580")) {
      newNum = "8280" + num.substring(3);
    }
    if (num.startsWith("534")) {
      newNum = "8934" + num.substring(3);
    }
    if (num.startsWith("584")) {
      newNum = "8484" + num.substring(3);
    }
    if (num.startsWith("517")) {
      newNum = "8717" + num.substring(3);
    }
    if (num.startsWith("812")) {
      newNum = "8612" + num.substring(3);
    }
    if (num.startsWith("816")) {
      newNum = "8616" + num.substring(3);
    }
    if (num.startsWith("511")) {
      newNum = "8611" + num.substring(3);
    }
    if (num.startsWith("513")) {
      newNum = "8613" + num.substring(3);
    }
    if (num.startsWith("770")) {
      newNum = "8670" + num.substring(3);
    }
    if (num.startsWith("771")) {
      newNum = "8671" + num.substring(3);
    }
    if (num.startsWith("772")) {
      newNum = "8672" + num.substring(3);
    }
    if (num.startsWith("773")) {
      newNum = "8673" + num.substring(3);
    }
    if (num.startsWith("676")) {
      newNum = "8676" + num.substring(3);
    }
    if (num.startsWith("581")) {
      newNum = "8481" + num.substring(3);
    }
    if (num.startsWith("574")) {
      newNum = "8574" + num.substring(3);
    }
    if (num.startsWith("677")) {
      newNum = "8577" + num.substring(3);
    }
    if (num.startsWith("761")) {
      newNum = "8761" + num.substring(3);
    }
    if (num.startsWith("762")) {
      newNum = "8762" + num.substring(3);
    }
    if (num.startsWith("227")) {
      newNum = "8767" + num.substring(3);
    }
    if (num.startsWith("228")) {
      newNum = "8768" + num.substring(3);
    }
    if (num.startsWith("877")) {
      newNum = "8777" + num.substring(3);
    }
    if (num.startsWith("878")) {
      newNum = "8778" + num.substring(3);
    }
    if (num.startsWith("879")) {
      newNum = "8779" + num.substring(3);
    }
    if (num.startsWith("870")) {
      newNum = "8770" + num.substring(3);
    }
    if (num.startsWith("672")) {
      newNum = "8772" + num.substring(3);
    }
    if (num.startsWith("673")) {
      newNum = "8773" + num.substring(3);
    }
    if (num.startsWith("674")) {
      newNum = "8774" + num.substring(3);
    }
    if (num.startsWith("675")) {
      newNum = "8775" + num.substring(3);
    }
    if (num.startsWith("573")) {
      newNum = "8973" + num.substring(3);
    }
    if (num.startsWith("587")) {
      newNum = "8487" + num.substring(3);
    }
    if (num.startsWith("747")) {
      newNum = "8947" + num.substring(3);
    }
    if (num.startsWith("748")) {
      newNum = "8948" + num.substring(3);
    }

    if (num.startsWith("583")) {
      newNum = "8483" + num.substring(3);
    }
    if (num.startsWith("811")) {
      newNum = "8511" + num.substring(3);
    }
    if (num.startsWith("512")) {
      newNum = "8512" + num.substring(3);
    }
    if (num.startsWith("510")) {
      newNum = "8510" + num.substring(3);
    }
    if (num.startsWith("585")) {
      newNum = "8485" + num.substring(3);
    }
    if (num.startsWith("864")) {
      newNum = "8464" + num.substring(3);
    }
    if (num.startsWith("865")) {
      newNum = "8465" + num.substring(3);
    }
    if (num.startsWith("266")) {
      newNum = "8466" + num.substring(3);
    }
    if (num.startsWith("898")) {
      newNum = "8998" + num.substring(3);
    }
    if (num.startsWith("899")) {
      newNum = "8999" + num.substring(3);
    }
    if (num.startsWith("895")) {
      newNum = "8695" + num.substring(3);
    }
    if (num.startsWith("697")) {
      newNum = "8697" + num.substring(3);
    }
    if (num.startsWith("888")) {
      newNum = "8288" + num.substring(3);
    }
    if (num.startsWith("565")) {
      newNum = "6165" + num.substring(3);
    }
    if (num.startsWith("560")) {
      newNum = "6160" + num.substring(3);
    }
    if (num.startsWith("570")) {
      newNum = "6470" + num.substring(3);
    }
    if (num.startsWith("571")) {
      newNum = "6471" + num.substring(3);
    }
    if (num.startsWith("851")) {
      newNum = "6151" + num.substring(3);
    }
    if (num.startsWith("853")) {
      newNum = "6153" + num.substring(3);
    }
    if (num.startsWith("854")) {
      newNum = "6154" + num.substring(3);
    }
    if (num.startsWith("855")) {
      newNum = "6155" + num.substring(3);
    }
    if (num.startsWith("289")) {
      newNum = "6159" + num.substring(3);
    }

    if (num.startsWith("855")) {
      newNum = "6555" + num.substring(3);
    }
    if (num.startsWith("610")) {
      newNum = "6610" + num.substring(3);
    }
    if (num.startsWith("611")) {
      newNum = "6611" + num.substring(3);
    }
    if (num.startsWith("612")) {
      newNum = "66121" + num.substring(3);
    }
    if (num.startsWith("613")) {
      newNum = "6613" + num.substring(3);
    }
    if (num.startsWith("614")) {
      newNum = "6614" + num.substring(3);
    }
    if (num.startsWith("615")) {
      newNum = "6615" + num.substring(3);
    }
    if (num.startsWith("616")) {
      newNum = "6616" + num.substring(3);
    }
    if (num.startsWith("619")) {
      newNum = "6619" + num.substring(3);
    }
    if (num.startsWith("566")) {
      newNum = "6466" + num.substring(3);
    }
    if (num.startsWith("564")) {
      newNum = "6464" + num.substring(3);
    }
    if (num.startsWith("567")) {
      newNum = "6467" + num.substring(3);
    }
    if (num.startsWith("858")) {
      newNum = "6858" + num.substring(3);
    }

    //fifth estamo

    if (num.startsWith("617")) {
      newNum = "8727" + num.substring(3);
    }
    if (num.startsWith("896")) {
      newNum = "8796" + num.substring(3);
    }
    if (num.startsWith("897")) {
      newNum = "8797" + num.substring(3);
    }
    if (num.startsWith("769")) {
      newNum = "8669" + num.substring(3);
    }
    if (num.startsWith("767")) {
      newNum = "8667" + num.substring(3);
    }
    if (num.startsWith("768")) {
      newNum = "8668" + num.substring(3);
    }
    if (num.startsWith("533")) {
      newNum = "8633" + num.substring(3);
    }
    if (num.startsWith("880")) {
      newNum = "8180" + num.substring(3);
    }
    if (num.startsWith("881")) {
      newNum = "8181" + num.substring(3);
    }
    if (num.startsWith("882")) {
      newNum = "8182" + num.substring(3);
    }
    if (num.startsWith("883")) {
      newNum = "8183" + num.substring(3);
    }
    if (num.startsWith("884")) {
      newNum = "8184" + num.substring(3);
    }
    if (num.startsWith("885")) {
      newNum = "8185" + num.substring(3);
    }
    if (num.startsWith("886")) {
      newNum = "8186" + num.substring(3);
    }
    if (num.startsWith("887")) {
      newNum = "8187" + num.substring(3);
    }
    if (num.startsWith("889")) {
      newNum = "8189" + num.substring(3);
    }
    if (num.startsWith("576")) {
      newNum = "8576" + num.substring(3);
    }
    if (num.startsWith("572")) {
      newNum = "8572" + num.substring(3);
    }
    if (num.startsWith("814")) {
      newNum = "8914" + num.substring(3);
    }
    if (num.startsWith("515")) {
      newNum = "8915" + num.substring(3);
    }
    if (num.startsWith("548")) {
      newNum = "8748" + num.substring(3);
    }
    if (num.startsWith("549")) {
      newNum = "8749" + num.substring(3);
    }
    if (num.startsWith("540")) {
      newNum = "8740" + num.substring(3);
    }
    if (num.startsWith("541")) {
      newNum = "8741" + num.substring(3);
    }
    if (num.startsWith("542")) {
      newNum = "8742" + num.substring(3);
    }
    if (num.startsWith("743")) {
      newNum = "8743" + num.substring(3);
    }
    if (num.startsWith("744")) {
      newNum = "8744" + num.substring(3);
    }
    if (num.startsWith("745")) {
      newNum = "8745" + num.substring(3);
    }
    if (num.startsWith("746")) {
      newNum = "8746" + num.substring(3);
    }
    if (num.startsWith("873")) {
      newNum = "8473" + num.substring(3);
    }
    if (num.startsWith("874")) {
      newNum = "8474" + num.substring(3);
    }
    if (num.startsWith("875")) {
      newNum = "8475" + num.substring(3);
    }
    if (num.startsWith("876")) {
      newNum = "8476" + num.substring(3);
    }
    if (num.startsWith("530")) {
      newNum = "8930" + num.substring(3);
    }
    if (num.startsWith("577")) {
      newNum = "8977" + num.substring(3);
    }
    if (num.startsWith("575")) {
      newNum = "8975" + num.substring(3);
    }
    if (num.startsWith("578")) {
      newNum = "8978" + num.substring(3);
    }
    if (num.startsWith("531")) {
      newNum = "8931" + num.substring(3);
    }
    if (num.startsWith("532")) {
      newNum = "8932" + num.substring(3);
    }
    if (num.startsWith("860")) {
      newNum = "8360" + num.substring(3);
    }
    if (num.startsWith("861")) {
      newNum = "8361" + num.substring(3);
    }
    if (num.startsWith("862")) {
      newNum = "8362" + num.substring(3);
    }
    if (num.startsWith("863")) {
      newNum = "8363" + num.substring(3);
    }
    if (num.startsWith("866")) {
      newNum = "8366" + num.substring(3);
    }
    if (num.startsWith("867")) {
      newNum = "8367" + num.substring(3);
    }
    if (num.startsWith("868")) {
      newNum = "8368" + num.substring(3);
    }
    if (num.startsWith("869")) {
      newNum = "8369" + num.substring(3);
    }
    if (num.startsWith("830")) {
      newNum = "8830" + num.substring(3);
    }
    if (num.startsWith("831")) {
      newNum = "8831" + num.substring(3);
    }
    if (num.startsWith("832")) {
      newNum = "8832" + num.substring(3);
    }
    if (num.startsWith("833")) {
      newNum = "8833" + num.substring(3);
    }
    if (num.startsWith("834")) {
      newNum = "8834" + num.substring(3);
    }
    if (num.startsWith("835")) {
      newNum = "8835" + num.substring(3);
    }
    if (num.startsWith("836")) {
      newNum = "8836" + num.substring(3);
    }
    if (num.startsWith("837")) {
      newNum = "8837" + num.substring(3);
    }
    if (num.startsWith("838")) {
      newNum = "8838" + num.substring(3);
    }
    if (num.startsWith("813")) {
      newNum = "8533" + num.substring(3);
    }
    if (num.startsWith("817")) {
      newNum = "8537" + num.substring(3);
    }
    if (num.startsWith("818")) {
      newNum = "8538" + num.substring(3);
    }
    if (num.startsWith("810")) {
      newNum = "8710" + num.substring(3);
    }
    if (num.startsWith("815")) {
      newNum = "8715" + num.substring(3);
    }
    if (num.startsWith("4290")) {
      newNum = "21290" + num.substring(4);
    }
    if (num.startsWith("4291")) {
      newNum = "21291" + num.substring(4);
    }
    if (num.startsWith("4292")) {
      newNum = "21292" + num.substring(4);
    }
    if (num.startsWith("4293")) {
      newNum = "21293" + num.substring(4);
    }
    if (num.startsWith("4294")) {
      newNum = "21294" + num.substring(4);
    }
    if (num.startsWith("7490")) {
      newNum = "89490" + num.substring(4);
    }
    if (num.startsWith("7491")) {
      newNum = "89491" + num.substring(4);
    }
    if (num.startsWith("7492")) {
      newNum = "89492" + num.substring(4);
    }
    if (num.startsWith("7493")) {
      newNum = "89493" + num.substring(4);
    }
    if (num.startsWith("7494")) {
      newNum = "89494" + num.substring(4);
    }
    if (num.startsWith("7495")) {
      newNum = "89495" + num.substring(4);
    }
    if (num.startsWith("7496")) {
      newNum = "89496" + num.substring(4);
    }
    if (num.startsWith("7497")) {
      newNum = "89497" + num.substring(4);
    }
    if (num.startsWith("7498")) {
      newNum = "89498" + num.substring(4);
    }
    if (num.startsWith("7499")) {
      newNum = "89499" + num.substring(4);
    }
    if (num.startsWith("4097")) {
      newNum = "21497" + num.substring(4);
    }
    if (newNum != "") return "041$newNum";
    print("newnum: $newNum  oldNum: $num");
    return "041$num";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(56, 133, 223, 1),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.fill
                    ,
                    image: AssetImage("images/top.png"),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      padding: const EdgeInsets.all(24.0),
                      color: Color.fromRGBO(242, 114, 104, 1),
                      elevation: 18,
                      child: Text(
                        "تحويل جميع الارقام الارضية على جوالك",
                        style:
                        TextStyle(color: Colors.white, fontFamily: "aljazeera"),
                      ),
                      onPressed: () {
                        var alert = AlertDialog(
                          title: Center(
                              child: Text(
                                "الرجاء الانتظار لانتهاء التحويل",
                                style: TextStyle(fontFamily: "aljazeera", fontSize: 16),
                              )),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[RefreshProgressIndicator(valueColor: AlwaysStoppedAnimation(Color.fromRGBO(242, 114, 104, 1)))],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        );
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return alert;
                            });
                        _requestPermission();


                      }),

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  "تمت البرمجة من قبل شركة",
                  style: TextStyle(fontFamily: "aljazeera",color: Colors.white),
                ),
              ),
              Expanded(
                child: Image(
                  image: AssetImage("images/bottom.png"),
                ),
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

            ],
          ),


        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
