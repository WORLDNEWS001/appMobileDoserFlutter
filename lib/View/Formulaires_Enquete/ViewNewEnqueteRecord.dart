import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/model/Class_setting/role.dart';
import 'package:secondtest/model/Class_setting/user.dart';
import 'package:secondtest/model/api_network_request/accident/list_accident_request.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteEnCour.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordNewCar.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordNewPerson.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordRoad.dart';
//import 'package:secondtest/widgets/recordNewEnquete_test_old/widgetFormNewEnquete.dart';
//import 'package:secondtest/widgets/recordRoad.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordAccidentInfo.dart';
//import 'package:secondtest/widgets/recordNewEnquete/brouillons/recordInfoAccidentTest_CallBack.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordCar.dart';

import 'package:secondtest/widgets/recordNewEnquete/recordPersonAccidente.dart';





var GlobalEndStep=3;
var Validation_after_traitement = 2; // si egale 1 alors toute les donnee des formulaires sont corectement saisit si non c'est 2


class ViewNewEnqueteRecord extends StatefulWidget {

  final EnquetteData enquetteData;
  final Function() createNewEnquete;
  final Function() editEnquete;


  const ViewNewEnqueteRecord({
    Key? key,
    required this.enquetteData,
    required this.createNewEnquete,
    required this.editEnquete,
  }) : super(key: key);

  @override
  State<ViewNewEnqueteRecord> createState() => _ViewNewEnqueteRecordState();
}


class _ViewNewEnqueteRecordState extends State<ViewNewEnqueteRecord> {


  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    print("initiation de la page new enquette step wizard terminer ----");
  }

  //myRecordCarCrash.someAction();

  void updateCurrentStep (int step){
    setState(() {
      currentStep = step;
    });

  }
  void onStepContinue() {
    setState(() {
      if (currentStep < 3) {
        currentStep += 1;
      }
    });
  }
  void onStepCancel() {

    setState(() {
      if (currentStep > 0) {
        currentStep -= 1;
      }
    });

  }


  void formCreateNewCarCrash() {
    print("je suis dans la fonction somme action du child de record New Car ");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordNewCar(),
      ),
    );
  }

  void formCreateNewPersonCrash() {
    print("je suis dans la fonction somme action du child de record New Person ");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordNewPerson(),
      ),
    );
  }



  void onStepFinal() {


    print(" \n\n\n\n +++++++++++++++ Creation Accident +++++++++++++++ \n\n");


    //------------- TEST CREATE ACCIDENT DART
    //await ListAccidentRequest(context: context).testCreateAccidentRequest();
    //------------- END TEST CREATE ACCIDENT DART


    //-----------------  TEST CREATE ACCIDENT OTHER TEST 2
    //widget.createNewEnquete();

    //-----------------  END TEST CREATE ACCIDENT OTHER TEST 2 with provider
    //CreateAccidentRequestProvider(context: context);

    //-------------------- other test
    //sendAccidentReport(context);

    //----------------------other send accident with DIo
    //sendAccidentReportDio(context);




    //------------ CONFIRM SCRIPT -----------


    //-------
    widget.createNewEnquete().then((value) {
      setState(() {
        print(" \n\n\n\n +++++++++++++++ FIN Creation Accident +++++++++++++++ \n\n");
      });
    });



  }















  @override
  Widget build(BuildContext context) {

    //----------------- DImentionnement
    var heightScreen =MediaQuery.of(context).size.height;
    var widthScreen =MediaQuery.of(context).size.width;
    var surfaceScreen = heightScreen * widthScreen;
    print("taille ecran ; hauteur : ${heightScreen} px ,  Largeur : ${widthScreen} px Et la Surface Global est de : ${surfaceScreen}  px");
    //-------Fin Test de dimentionnement --------

    //----------phone android
    //309248.0  px ----- vertical position
    //300032.0  px ----- horizontal position
    //---------phone Tablette
    //555600.0  px ----- vertical position
    //543840.0  px ----- horizontal position




    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle Enquête"),
        centerTitle: true,
      ),
      body: Center(
        //width: 900,
        //height: 1000,
        //padding: EdgeInsets.all(5),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: (){

            final isLastStep = currentStep == getSteps().length - 1;
            if(isLastStep){
              print("Complete step record Road");
              /// Send data in server

            }else{
              setState(() {
                currentStep += 1;
              });
            }


          },
          onStepCancel: (){
            currentStep==0 ? null: setState(() => currentStep -=1 );
            print(currentStep);
            //currentStep = 2;

          },
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
              print(currentStep);
            });
          },



          controlsBuilder: (BuildContext context, ControlsDetails? controlsDetails) {




            return checkPermission(user, "create_accident")
                ?
            Container()
                :
            SizedBox.shrink();


            //return SizedBox.shrink();
          },

        ),
      ),

      floatingActionButton:  (currentStep == 2 || currentStep == 3) ? FloatingActionButton(
        onPressed: () {
          // Action à effectuer lors du clic sur le FloatingActionButton
          if(currentStep == 2 ){
            print("je suis dans le floatingActionButton de l'ajout d'un Vehicule ");
            formCreateNewCarCrash();
          }
          else if(currentStep == 3){
            print("je suis dans le floatingActionButton de l'ajout d'un accidenté ");
            formCreateNewPersonCrash();
          }
        },
        child: (currentStep == 2 )
            ?
        Icon(Icons.car_crash_rounded)
            :
        Icon(Icons.person_add_alt_1_outlined),
      ) : null,

      bottomNavigationBar: BottomAppBar(
          child:
          (currentStep != GlobalEndStep)
              ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              ElevatedButton.icon(
                onPressed: onStepCancel,
                icon: Icon(Icons.arrow_circle_left_outlined,
                    size: 50),
                label: Text('Retour'),
              ),
              ElevatedButton.icon(
                onPressed: onStepContinue,
                label: Text('Continuer'),
                //label: Text('Continuer'),
                //style: Colors(),
                icon: Icon(Icons.arrow_circle_right_outlined, size: 50),
              ),
            ],
          )
              :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              ElevatedButton.icon(
                onPressed: onStepCancel,
                icon: Icon(Icons.arrow_circle_left_outlined,
                    size: 50),
                label: Text('Retour'),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                   onStepFinal();

                  /*
                  var uri = Uri.parse('http://51.195.11.202:8099/api/v1/accidents/');

                  //-----------------------------Generate Token ---------------------------//
                  print("+++++++++++++++++ DEBUT  GENERATEUR DE TOKEN  pour test create ACCIDENT++++++++++++++++++++++");
                  await TokenManager.getToken();
                  print("+++++++++++++++++ END  GENERATEUR DE TOKEN  pour test create ACCIDENT++++++++++++++++++++++");
                  //-----------------------------print Token In LOG -----------------------//

                  print("---------------------  print DEBUT REQUETTE CREATE ACCIDENT ------------");
                  //--------------- Ajout du jeton d'authentification dans l'en-tête
                  String? token = Constants.accessToken; // Remplacez par votre véritable jeton
                  Map<String, String> headers = {
                    'Authorization': 'Bearer $token',
                  };


                  Map<String, dynamic> data_reqAccident_json_all = context.read<ProviderColleteDataEnquete>().data_new_enquette ?? {};

                  var request = http.MultipartRequest('POST', uri)
                    ..headers['Authorization'] = 'Bearer $token'
                    ..fields['accidentReq'] = json.encode(data_reqAccident_json_all);

                  // Ajoutez les images si nécessaire
                  // request.files.add(await http.MultipartFile.fromPath(
                  //   'crashImage',
                  //   'path_to_image',
                  // ));

                  try {
                    var response = await request.send();
                    if (response.statusCode == 200) {
                      var responseData = await response.stream.toBytes();
                      var responseString = String.fromCharCodes(responseData);
                      var map = json.decode(responseString);
                      print(map);
                    } else {
                      print('La requête a échoué avec le statut: ${response.statusCode}.');
                    }
                  } catch (e) {
                    print('Une erreur est survenue lors de l\'envoi de la requête: $e');
                  }


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => listAccident()),
                  );

                   */


                },
                label: Text('Terminer'),
                style: ElevatedButton.styleFrom(
                  primary: Validation_after_traitement == 1 ? Colors.green : Colors.green, // Changer la couleur d'arrière-plan
                  //onPrimary: Colors.green, // Changer la couleur du texte
                  //shadowColor: Colors.grey, // Changer la couleur de l'ombre
                ),
                //label: Text('Continuer'),
                //style: Colors(),
                icon: Icon(Icons.gpp_good, size: 50),
              ),
            ],
          )

      ),
    );


  }


  List<Step> getSteps() => [
    Step(
      isActive: currentStep >=0,
      title: Text("Route",
        style: TextStyle(
            fontSize: (currentStep==0)? MediaQuery.of(context).size.width * 0.0275 : MediaQuery.of(context).size.width * 0.025,
            fontWeight: (currentStep==0)?FontWeight.w700 : FontWeight.w300,
            color: (currentStep==0)
                ?Colors.blue
                : Colors.black
        ),
      ),
      content: recordNewRoad(
        onStepUpdated: updateCurrentStep,
      ),
    ),
    Step(
      isActive: currentStep >=1,
      title: Text('Accident',
        style: TextStyle(
            fontSize: (currentStep==1)? MediaQuery.of(context).size.width * 0.0275 : MediaQuery.of(context).size.width * 0.025,
            fontWeight: (currentStep==1)?FontWeight.w700 : FontWeight.w300,
            color: (currentStep==1)
                ?Colors.blue
                : Colors.black
        ),
      ),
      content: recordAccidentInfo(
        onStepUpdated: updateCurrentStep,
      ),
    ),
    Step(
      isActive: currentStep >=2,
      title: Text('Vehicules',
        style: TextStyle(
            fontSize: (currentStep==2)? MediaQuery.of(context).size.width * 0.0275 : MediaQuery.of(context).size.width * 0.025,
            fontWeight: (currentStep==2)?FontWeight.w700 : FontWeight.w300,
            color: (currentStep==2)
                ?Colors.blue
                : Colors.black
        ),
      ),
      content: Container(
        height: (MediaQuery.of(context).size.height)-230,
        child: recordCarCrash(
          onStepUpdated: updateCurrentStep,
        ),
      ),

    ),

    Step(
      isActive: currentStep >=3,
      title: Text('Accidentés',
        style: TextStyle(
            fontSize: (currentStep==3)? MediaQuery.of(context).size.width * 0.0275 : MediaQuery.of(context).size.width * 0.025,
            fontWeight: (currentStep==3)?FontWeight.w700 : FontWeight.w300,
            color: (currentStep==3)
                ?Colors.blue
                : Colors.black
        ),
      ),
      content:Container(
        height: (MediaQuery.of(context).size.height)-230,
        child: RecordPersonAccidente(
          onStepUpdated: updateCurrentStep,
        ),
      ),
    ),

    // Ajoutez les autres étapes ici
  ];


}










