import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordNewPerson.dart';

final List<MyData> dataList = [
  MyData(
    title: 'Person Accidenté n° 2222',
    subtitle: 'Sous-titre 1',
  ),
  MyData(
    title: 'Person Accidenté n° 21',
    subtitle: 'Sous-titre 2',
  ),
  MyData(
    title: 'Person Accidenté n° 22',
    subtitle: 'Sous-titre 1',
  ),
  MyData(
    title: 'Person Accidenté n° 21',
    subtitle: 'Sous-titre 2',
  ),
  MyData(
    title: 'Person Accidenté n° 22',
    subtitle: 'Sous-titre 1',
  ),
  MyData(
    title: 'Person Accidenté n° 21',
    subtitle: 'Sous-titre 2',
  ),
  MyData(
    title: 'Person Accidenté n° 22',
    subtitle: 'Sous-titre 1',
  ),
  MyData(
    title: 'Person Accidenté n° 21',
    subtitle: 'Sous-titre 2',
  ),
  MyData(
    title: 'Person Accidenté n° 22',
    subtitle: 'Sous-titre 1',
  ),
  MyData(
    title: 'Person Accidenté n° 21',
    subtitle: 'Sous-titre 2',
  ),
  MyData(
    title: 'Person Accidenté n° 22',
    subtitle: 'Sous-titre 1',
  ),
  MyData(
    title: 'Person Accidenté n° 2111111111',
    subtitle: 'Sous-titre 2',
  ),

  // Ajoutez les autres éléments de votre liste de données ici
];



class RecordPersonAccidente extends StatefulWidget {
  final Function(int) onStepUpdated;
  List<PersonResp>? listPerson = [];

  RecordPersonAccidente(
      {Key? key, required this.onStepUpdated, this.listPerson})
      : super(key: key);

  void testvalfile() async {
    // Obtention du répertoire de téléchargement externe
    Directory? downloadDirectory = await getExternalStorageDirectory();
    String? downloadPath = downloadDirectory?.path;

    // Chemin complet du fichier JSON
    String filePath = '$downloadPath/data.json';
    print("documentsPath filePath est  ${downloadDirectory}");
     print("filePath  filePath est  ${filePath}");
     File jsonFile = File(filePath);
     // Lecture des données à partir du fichier JSON
     String fileContent = await jsonFile.readAsString();
     Map<String, dynamic> jsonData = jsonDecode(fileContent);

     // Affichage des données sur la console
     print('Données du fichier JSON :');
     print('Nom : ${jsonData['name']}');
     print('Âge : ${jsonData['age']}');
     print('Email : ${jsonData['email']}');
   }

   void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    print("je suis dans la fonction somme action du child de record Road ");
    onStepUpdated(2);
  }

  //--------------------  for update value step (MAKE function Some Action)

  @override
  State<RecordPersonAccidente> createState() => _RecordPersonAccidenteState();
}




class _RecordPersonAccidenteState extends State<RecordPersonAccidente> {

  List<PersonResp>? listPersonRecord = [];

  @override
  void initState() {
    super.initState();
    // Votre initialisation ou logique d'état ici
    //widget.someAction();
    //widget.testvalfile();
    listPersonRecord =
        context.read<ProviderColleteDataEnquete>().data_enq_persons;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    listPersonRecord =
        context.watch<ProviderColleteDataEnquete>().data_enq_persons;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //widget.testvalfile();
    return ListView.builder(
      itemCount: listPersonRecord?.length,
      itemBuilder: (BuildContext context, int index) {
        PersonResp? person = listPersonRecord?[index];

        return Card(
          child: ListTile(
            title: Text(
              "${person?.firstName ?? ''} ${person?.lastName ?? ''} - Gravité : ${person?.traumaSeverity?.value ?? ''}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
                "Vehicule Numero : ${person?.vehicleAccidentNumber ?? ''} - Genre : ${person?.gender?.value ?? ''} "),
            trailing: Icon(
              Icons.person,
              size: 50,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordNewPerson(
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







/*
class Actionari {
  void someActiona() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    var recordInfoAccidentInstance = RecordPersonAccidente(onStepUpdated: (step) {
      print("je suis executé instance du parent");
      //updateCurrentStep(step);

    });

    //print("je suis dans la fonction somme action du child de record Road ");
    recordInfoAccidentInstance.onStepUpdated(2);


  }

  static void printMessage(String message) {
    print(message);
  }
}


class MyUtils {
  static void printMessage(String message) {
    print(message);
  }

  static int sum(int a, int b) {
    return a + b;
  }
}
*/