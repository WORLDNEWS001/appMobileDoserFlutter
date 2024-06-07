import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/ViewNewEnqueteRecord.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/services/enquete/edit_enquete/MethodEditEnquete.dart';

class ControllerEnquete extends StatefulWidget {
  int? idEnquete;
  ControllerEnquete({
    super.key,
    this.idEnquete
  });

  @override
  State<ControllerEnquete> createState() => _ControllerEnqueteState();
}

class _ControllerEnqueteState extends State<ControllerEnquete> {

 EnquetteData enquetteData = EnquetteData();


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //enquetteData = Pro
   if(widget.idEnquete != null){
     MethodEditEnquete().GetDataEnqueteWithIdRequest(context: context, id: widget.idEnquete);
   }
  }



  @override
  Widget build(BuildContext context) {
    return ViewNewEnqueteRecord(
      enquetteData: enquetteData,
      createNewEnquete: createNewEnquete,
      editEnquete: editEnquete,
    );
  }





  //------------------ Script interne  to edit Enquette --------------









 //****************----------------- Create Enquete -----------------****************//

  Future<Map<String, dynamic>?> createNewEnquete() async {
   print("--------/////////---  Create New Enquette  ---/////////--------");

   EnquetteData? enquetteData=context.read<ProviderColleteDataEnquete>().DataFormEnquete;

   Map<String, dynamic>? resultRequest;
   if (widget.idEnquete != null) {
     enquetteData?.id = widget.idEnquete;

     resultRequest = await enquetteData?.executeRequestEditEnquete().then((value) async {
       await Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => listAccident()),
       );
       await Future.delayed(Duration(milliseconds: 1));

       setState(() {
         print("Traitement data");
       });
     });

   }else{
     resultRequest = await enquetteData?.executeRequestCreateEnquete().then((value) async {
       await Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => listAccident()),
       );
       await Future.delayed(Duration(milliseconds: 1));

       setState(() {
         print("Traitement data");
       });
     });
   }





   //----- attente de 1 miliseconde
   await Future.delayed(Duration(milliseconds: 1));



   print(" \n\n\n\n +++++++++++++++ FIN Creation Accident +++++++++++++++ \n\n\n\n");
   return resultRequest;

  }













  //****************----------------- Edit Enquete -----------------****************//


  editEnquete(){
    print("--------/////////---  Edit Enquette  ---/////////--------");


  }

}
