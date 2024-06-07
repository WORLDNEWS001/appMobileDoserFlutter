import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Route/control_resp.dart';
import 'package:secondtest/model/data_samples/data_enquette_sample.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';
import 'View/Liste_Accident/Tile_One_Accident/Profil_Image_Accident.dart';
import 'model/provider/list_accident_provider/option_accident/type_option_provider.dart';
import 'screen/authentificateScreens/connexionScreen.dart';
import 'main.dart';
import 'main.dart';
import 'package:permission_handler/permission_handler.dart';




import 'widgets/recordNewEnquete/recordCar.dart';

//***************screen/

import 'screen/accidentScreens/listAccident.dart';

//**********************************************//****************************//




//-----------------------------------------///////

import 'widgets/recordNewEnquete/test.dart';

import 'ressource/saveDataJson.dart';

//------------------------------------------

import 'authentificator/request_Token.dart';
import 'authentificator/requestAPI.dart';




//*******screen/testScriptProjet/

//import 'screen/testScriptProjetCd/newEnqueteCallapse.dart';

//***************************************//**********************//





//********* External Projet test *************//

import 'screen/brouillon_Time/testScript/test_sms_receive.dart'; //---good
//import 'screen/testScript/test_sms_receive2.dart';

//*************************************//****************************//


import 'package:secondtest/model/classData/modelDataEnquette.dart';


//*******screen/enquette/


//***************************************//**********************//


//----------------------test file


import 'package:secondtest/TestWidget.dart';

//-----------------------




Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized(); // Initialisation du binding de Flutter

  //testdata.exec();
//----------------------------------------------------------------------
  //runApp(SecondApp());

  runApp(
      MultiProvider(
        providers: [
            ChangeNotifierProvider(create: (_)=> TypeOptionProvider()),
            ChangeNotifierProvider(create: (_)=> DataListAccidentProvider()),
            ChangeNotifierProvider(create: (_)=> DataOmsSelectProvider()),
            ChangeNotifierProvider(create: (_)=> ProviderColleteDataEnquete()),
        ],
        child: MyApp(),
      )

  );
}

class MyApp extends StatelessWidget{


  bool activateUpdateData=true;



  @override
  Widget build(BuildContext context){

    WidgetsBinding.instance.addPostFrameCallback((_)  {



      Logger().e("+++++++++++ START EXECUTE BUILD  MYAPP  +++++++++");

      if(activateUpdateData){

        //------------ TEST SCRIPT --------------//

        EditEnqueteRequestDio(json_data_send: SampleDataSendToEdit_oneEnquette_old);

        //------ END TES SCRIPT --------------//



         context.read<DataOmsSelectProvider>().UpdateDataOmsSelectProvider(context: context).then((value) {
              /*
           DataOmsSelectProvider dataOmsSelectProvider=  context.read<DataOmsSelectProvider>();
           List<ControlResp> listControlResp = dataOmsSelectProvider.controlRespListSelect;
           Logger().e("\n\n\n\n+++++++++++ Afficher les données de  listControlResp recuperer::\n\n Get data by code :: ${dataOmsSelectProvider.getControlRespById(2)} -------- \n\n ${listControlResp}  +++++++++\n\n\n\n");
              */
        });
         //context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider(context: context).then((val){
           //TestDataEnquette().getEnquetteDataTest(context);
           //TestDataEnquette().getEnquetteRequestTest();
        // });
        activateUpdateData=false;
      }


    });




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //home: FormScreen(),

      //home: testing(),

      //home: newEnqueteRecord(),


      //-----------
      //home: recordCarCrash(),

      //home: StepperPage(),

      //home: ParentScreen(),

      home: listAccident(),

      //home:

      //home: newEnqueteRecord(),

      //home: FormScreen(),







      //****** external project ****//
      //home: MyWidget(),

      //-------home: TestWidget()
      //****************************



    );


  }
}


