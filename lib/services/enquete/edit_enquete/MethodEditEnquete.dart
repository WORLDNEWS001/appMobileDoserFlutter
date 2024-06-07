




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/controller/ControllerEnquette/ControllerEnquette.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';

class MethodEditEnquete{
  
  
  
  GetDataEnqueteWithIdRequest({required BuildContext context, required int? id}) async {
    // get data enquete with id
    
    Map<String, dynamic>? resultRequest = await GetEnqueteRequestDio(id_enquete: id);

    if(resultRequest == null){


    }else{

      EnquetteData enquetteData= EnquetteData.fromJsonRequest(resultRequest["data"], context);

      Logger().w("\n\n\n\n\n\n\n\n object enquetteData -- instance  EnquetteData  :: \n\n $enquetteData \n\n");

      //context.read<ProviderColleteDataEnquete>().DataFormEnquete=enquetteData;

      context.read<ProviderColleteDataEnquete>().UpdateProvidersCollecteByDataEnquete(enquetteData);


    }
  

    /*
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ControllerEnquete()),
    );*/



  /*

    /*
    ///---------------- TEST DATA RECEIVE -----------------///
    print("----data enquette data test ::: id = ${enquetteData.id} ---"
        "\n----data enquette data test ::: accidentDate = ${enquetteData.accidentDate} ---"
        "\n----data enquette data test ::: accidentTime = ${enquetteData.accidentTime} ---"
        "\n----data enquette data test ::: municipality = ${enquetteData.municipality} ---"
        "\n----data enquette data test ::: latitude = ${enquetteData.latitude} ---"
        "\n----data enquette data test ::: longitude = ${enquetteData.longitude} ---"
        "\n----data enquette data test ::: place = ${enquetteData.place} ---"
        "\n----data enquette data test ::: roadType = ${enquetteData.roadType} --- "
        "\n----data enquette data test ::: roadCategory = ${enquetteData.roadCategory} ---"
        "\n----data enquette data test ::: speedLimit = ${enquetteData.speedLimit} ---");


    print("\n\n\n Le Nombre de person que contien EnquetteData est : ${enquetteData.persons?.length} \n\n\n");


    if(enquetteData.persons?.length != 0){
      print("\n\n\n Data person de instance person dans instance EnquetteData "
          "\n  ${enquetteData.persons?[0].traumaSeverity?.value } \n\n\n");
    }
    */




    /*
    ///------- Script qui permet de ranger une liste de EnqueteResquet qui s'appele , ListEnqueteResquet et dont nus avons ListEnquete.ListPerson  qui contient une liste de Person et chaque person contien Une traumaSeverity.value
    ///---Ranger ListEnqueteResquet en fonction de  EnqueteRequest.ListPerson[n].traumaSeverity.value  qui peut etre soit 1,2,3,4,5 ,  plus la valeur est grande plus le person est grave
    ///---  aloes pendant e rangement pour chaque Element de ListEnqueteResquet on doit ranger les ListPerson en fonction de la valeur de traumaSeverity.value , de EnqueteRequest qui a le plus grand niveau de traumatisme a celui qui a le plus petit donc par ordre decroissant de 5 a 1  dans le cas ou la liste est en desordre , si la liste est deja en ordre on ne fait rien
    ///--- EnqueteRequest.ListPerson[n].traumaSeverity.value  peut etre null ,
    ///alors je veux une methode qui prend la liste de EnqueteRequest qui es a ranger ,er qui range pat la suite dans la methode

    //enqueteData.persons?.sort((a, b) => a.traumaSeverity?.value.compareTo(b.traumaSeverity?.value));
   enquetteData.persons?.sort((a, b) => a.traumaSeverity?.value.compareTo(b.traumaSeverity?.value));
    */

   */

  }

}


