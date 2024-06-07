import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/ViewNewEnqueteRecord.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';

class ControllerEnquete extends StatefulWidget {
  const ControllerEnquete({super.key});

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
  }



  @override
  Widget build(BuildContext context) {
    return ViewNewEnqueteRecord(
      enquetteData: enquetteData,
      createNewEnquete: createNewEnquete,
      editEnquete: editEnquete,
    );
  }


  Future<Map<String, dynamic>?> createNewEnquete() async {
   print("--------/////////---  Create New Enquette  ---/////////--------");


   EnquetteData? enquetteData=context.read<ProviderColleteDataEnquete>().DataFormEnquete;
   Map<String, dynamic>? resultRequest = await enquetteData?.executeRequestCreateEnquete();
   return {};

  }


  editEnquete(){
    print("--------/////////---  Edit Enquette  ---/////////--------");


  }

}
