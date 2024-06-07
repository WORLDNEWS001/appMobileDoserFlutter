

import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/ViewNewEnqueteRecord.dart';
import 'package:secondtest/controller/ControllerEnquette/ControllerEnquette.dart';
import 'package:secondtest/model/api_network_request/accident/list_accident_request.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteEnCour.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteCloture.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteAnnuler.dart';
import 'package:flutter/material.dart';


import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/authentificator/requestAPI.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/GlobalConstantData.dart';

//*******screen/testScriptProjet/


//import 'package:secondtest/screen/testScriptProjetCd/newEnqueteCallapse.dart';

import 'package:secondtest/screen/testScriptProjetCd/testListVictime.dart';
import 'package:secondtest/screen/testScriptProjetCd/testListAlertAccident.dart';


//***************************************//**********************//

//-----------------------------------External test


/*
    Future<void> repDataAccident() async {
      print(
      "/--------------------------- Debut execution Section Class Request API Method Get Data Accident------------------");
      logger.i(
      "/--------------------------- Debut Execution Section Class Request API Method Get Data Accident------------------");

      // Création d'une variable Map<String, dynamic> vide
      Map<String, dynamic> myMapDataOms = {};

      // URL de l'API et paramètres de la requête
      String url = 'http://141.95.103.210:8099/api/v1/accidents';
      Map<String, String> queryParams = {
      'page': '0',
      'size': '10',
      'search': '',
      };

      // Ajout du jeton d'authentification dans l'en-tête
      String? token = Constants
          .accessToken; // Remplacez par votre véritable jeton
      Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      };

      // Construction de l'URL complète avec les paramètres de requête
      String queryString = Uri(queryParameters: queryParams).query;
      String requestUrl = '$url?$queryString';

      // Envoi de la requête GET avec l'en-tête d'authentification
      http.Response response = await http.get(
      Uri.parse(requestUrl), headers: headers);

      // Vérification du code de statut de la réponse
      if (response.statusCode == 200) {
      // Traitement de la réponse
      String responseBody = response.body;
      print('Réponse Body Api data oms string is: $responseBody');
      print('Réponse ALL COMPLET Api data oms string is: ${response.body}');
      // Conversion du JSON en une variable de type Map<String, dynamic>
      Map<String, dynamic> jsonData = jsonDecode(responseBody);


      List<dynamic> respDataAccident = jsonData['data']['content'] ?? [];

      // Affichage d'un exemple d'accès aux données
      print('Accident data:');
      for (var item in respDataAccident) {
        print('ID: ${item['id']}, Code: ${item['code']}, city: ${item['city']} , place: ${item['place']} , crashDate: ${item['crashDate']} , crashTime: ${item['crashTime']}');
      }

      /*--------------------------------------------
                      // Vérification du contenu de la réponse JSON
                            print(responseBody);

                      // Conversion du JSON en une variable de type Map<String, dynamic>
                            Map<String, dynamic> jsonData = jsonDecode(responseBody);

                      // Accès aux données dans la variable jsonData
                            List<dynamic> accidentSeverityResp = jsonData['data']['accidentSeverityResp'] ?? [];
                            List<dynamic> accidentTypeResp = jsonData['data']['accidentTypeResp'] ?? [];
                            List<dynamic> actionResp = jsonData['data']['actionResp'] ?? [];
                            List<dynamic> brandResp = jsonData['data']['brandResp'] ?? [];

                      // Affichage d'un exemple d'accès aux données
                            print('Accident Severity Resp:');
                            for (var item in accidentSeverityResp) {
                              print('ID: ${item['id']}, Code: ${item['code']}, Value: ${item['value']}');
                            }
            ------------------------------------------------------------*/

      } else {
      // Affichage du message d'erreur en cas d'échec de la requête
      print('Erreur de requête : ${response.statusCode}');
      }

      print(
      "/---------------------------End Section Class Request API Method Get Data Accident------------------");
      logger.i(
      "/---------------------------End Section Class Request API Method Get Data Accident------------------");
    }

*/

//










class listAccident  extends StatefulWidget {
  const listAccident ({Key? key}) : super(key: key);

  @override
  State<listAccident> createState() => _listAccidentState();
}

class _listAccidentState extends State<listAccident> {
  int _buttonIndex = 0;

  List<dynamic> listAccidentWidgets =[



    enqueteEnCour(),
    //---- good

    listVictimeRecord(),
    // ---- good

    listAlertAccident(),
    // ---- good

    enqueteEnCour(),
    // ---- good

    //enqueteCloturer(),

    //enqueteAnnuler(),

    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
     // return newEnqueteRecord();
    // })),

    //enqueteEnCour(),

    //genere moi un code qui va me permettre de d'afficher un dialog avec deux bouton d'option oui ou non et une icon au dessus du dialog.
    
    


  ] ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider();
    context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider();
  }




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('DOSER'),
        centerTitle: true,
        actions: [

          Center(
            child: Text('Actualiser',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
          Card(
            color: Colors.blue[300],
            elevation: 10,
            margin: EdgeInsets.all(8),
            child:IconButton(
              icon: Icon(Icons.update_sharp),
              onPressed: () {
                // Action lorsque l'icône de recherche est pressée.
                context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider();
              },
            ),
          )



        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Police',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return enqueteCloturer();
                }));
              },
              leading: Icon(Icons.dock_sharp),
              title: Text('Pv Enquêtes'),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return enqueteAnnuler();
                }));
              },
              leading: Icon(Icons.cancel_rounded),
              title: Text('Enquêtes Annuler'),
            ),


            ListTile(

              leading: Icon(Icons.settings),
              title: Text('Paramettres'),
            ),
          ],
        ),
      ),
        body:Container(
          color: Colors.blue[50],
          child: Padding(
            padding: EdgeInsets.only(top:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:15),
                  child: Text(
                     listAccidentWidgets[_buttonIndex].TextTitle(),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),

                SizedBox(height: 5,),
                Container(
                  alignment: Alignment.center,

                  child: Card(

                    color: Colors.blue[50],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Wrap(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        runSpacing: 5,
                        spacing: 0,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children:<Widget> [
                          InkWell(
                            onTap: (){
                              print("object");
                              setState(() {
                                _buttonIndex =0;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _buttonIndex ==0  ? Colors.blue[300] : Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "06",
                                      style: TextStyle(
                                        fontSize: _buttonIndex == 0
                                            ? 30
                                            : 20,
                                        fontWeight: FontWeight.bold,
                                        color: _buttonIndex == 0  ? Colors.white : Colors.black38,
                                      ),
                                    ),
                                    Text(
                                      "En Cour...",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: _buttonIndex == 0  ? Colors.white : Colors.black38,
                                      ),
                                    ),
                                  ],
                                )


                            ),
                          ),
                          InkWell(
                            onTap: (){
                              print("object");
                              setState(() {
                                _buttonIndex =1;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _buttonIndex ==1  ? Colors.blue[300] : Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "12",
                                    style: TextStyle(
                                      fontSize: _buttonIndex == 1
                                          ? 30
                                          : 20,
                                      fontWeight: FontWeight.bold,
                                      color: _buttonIndex == 1
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                  Text(
                                    "Accidentés",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: _buttonIndex == 1
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              print("object");
                              setState(() {
                                _buttonIndex =2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _buttonIndex == 2
                                    ? Colors.blue[300]
                                    : Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "04",
                                    style: TextStyle(
                                      fontSize: _buttonIndex == 2
                                          ? 30
                                          : 20,
                                      fontWeight: FontWeight.bold,
                                      color: _buttonIndex == 2
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                  Text(
                                    "Alert Accident",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: _buttonIndex == 2
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              print("object");
                              setState(() {
                                _buttonIndex =3;
                              });

                              //------------- TEST CREATE ACCIDENT DART
                              await context.read<ProviderColleteDataEnquete>().resetDataForm();
                              //------------- END TEST CREATE ACCIDENT DART

                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                //return newEnqueteRecord();
                                return ControllerEnquete();
                                //return ViewNewEnqueteRecord();
                              }));

                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _buttonIndex == 3
                                    ? Colors.blue[300]
                                    : Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[

                                  Icon(Icons.add_circle_outline_rounded,
                                    size: _buttonIndex == 3
                                        ? 50
                                        : 40,
                                    color: _buttonIndex == 3
                                        ? Colors.white
                                        : Colors.black38,),
                                  Text(
                                    "Nouvelle",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: _buttonIndex == 3
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ) ,
                ),
                SizedBox(
                  height: 10,
                ),

                Expanded(
                  child:  listAccidentWidgets[_buttonIndex],
                )
              ],
            ),
          ),
        ),



    );








  }
}

