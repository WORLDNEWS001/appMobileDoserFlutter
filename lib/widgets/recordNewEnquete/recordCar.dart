import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';

import 'package:secondtest/widgets/recordNewEnquete/recordNewCar.dart';

final List<MyData> dataList = [
  MyData(
    title: 'Vehicule Accidenté n° 2222',
    subtitle: 'Sous-titre 1',
  ),
  MyData(
    title: 'Vehicule Accidenté n° 21',
    subtitle: 'Sous-titre 2',
  ),


  // Ajoutez les autres éléments de votre liste de données ici
];




class recordCarCrash extends StatefulWidget {
  recordCarCrash({Key? key, required this.onStepUpdated, this.listVehicule})
      : super(key: key);
  final Function(int) onStepUpdated;
  List<VehiculeResp>? listVehicule = [];

  /*void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    print("je suis dans la fonction somme action du child de record Road ");
    onStepUpdated(3);
  } */
  //--------------------  for update value step (MAKE function Some Action)

  static int someAction(Function(int) onStepUpdated) {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    onStepUpdated(3);
    print("je suis dans la fonction somme action du child de record Road ");
    return 22222;
  }


  @override
  State<recordCarCrash> createState() => _recordCarCrashState();
}

class _recordCarCrashState extends State<recordCarCrash> {
  List<VehiculeResp>? listVehiculeRecord = [];

  @override
  void initState() {
    super.initState();
    print("initiation de la page Record Car terminer ----");

    listVehiculeRecord =
        context.read<ProviderColleteDataEnquete>().list_data_enq_vehicules;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    listVehiculeRecord =
        context.watch<ProviderColleteDataEnquete>().list_data_enq_vehicules;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listVehiculeRecord?.length,
      itemBuilder: (BuildContext context, int index) {
        VehiculeResp? oneVehicule = listVehiculeRecord?[index];
        return Card(
          child: ListTile(
            title: Text(
                "Car Numero ${oneVehicule?.vehicleAccidentNumber ?? 'No Number'} - Immatricule : ${oneVehicule?.plate ?? 'No plate'} "),
            subtitle: Text(
                "${oneVehicule?.type?.value}  -  ${oneVehicule?.brand?.value}  -  ${oneVehicule?.model?.value}}"),
            onTap: () {
              //-----------recovery
              recordCarCrash.someAction((p0) => null);
              //------------test recovery

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordNewCar(
                    title: dataList[index].title,
                        subtitle: dataList[index].subtitle,
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}





class MyData {
  final String title;
  final String subtitle;

  MyData({
    required this.title,
    required this.subtitle,
  });
}



