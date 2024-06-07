import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:select_form_field/select_form_field.dart';


class RecordNewPerson extends StatefulWidget {
  const RecordNewPerson({Key? key,  this.title,  this.subtitle}) : super(key: key);
  final String? title;
  final String? subtitle;


  /*Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
       print("L'autorisation a été accordée, vous pouvez accéder au stockage externe ici");
    } else {
       print("L'autorisation a été refusée, vous pouvez afficher un message d'erreur ou demander à nouveau l'autorisation plus tard");
    }
  }*/


  void saveDataNewCar() async  {

    //requestStoragePermission();
    print("save data 222");

    // Obtention du répertoire de téléchargement externe
    Directory? downloadDirectory = await getExternalStorageDirectory();
    String? downloadPath = downloadDirectory?.path;

    // Chemin complet du fichier JSON
    String filePath = '$downloadPath/data.json';


          print("documentsPath filePath est  ${downloadDirectory}");
          print("filePath  filePath est  ${filePath}");
          print("downloag path est  ${downloadDirectory}");
    // Vérification si le répertoire "download" existe, sinon le créer
    // Vérification si le répertoire "download" existe, sinon le créer
    Directory downloadDir = Directory('$downloadPath/download');
    if (!await downloadDir.exists()) {
      await downloadDir.create(recursive: true);
    }
    // Écriture des données dans le fichier JSON
    Map<String, dynamic> data = {
    'name': 'John Doe',
    'age': 30,
    'email': 'johndoe@example.com',
    };
    File jsonFile = File(filePath);
    jsonFile.writeAsStringSync(jsonEncode(data));

    print('Fichier JSON créé et données écrites.');

    // Lecture des données à partir du fichier JSON
    String fileContent = await jsonFile.readAsString();
    Map<String, dynamic> jsonData = jsonDecode(fileContent);

    // Affichage des données sur la console
    print('Données du fichier JSON :');
    print('Nom : ${jsonData['name']}');
    print('Âge : ${jsonData['age']}');
    print('Email : ${jsonData['email']}');
  }




  void cancelDataNewCar() {

    print("cancel action add car");

  }


  @override
  State<RecordNewPerson> createState() => _RecordNewPersonState();
}

class _RecordNewPersonState extends State<RecordNewPerson> {



  void initState() {
    super.initState();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      // L'autorisation a été accordée, vous pouvez accéder au stockage externe ici
    } else {
      // L'autorisation a été refusée, vous pouvez afficher un message d'erreur ou demander à nouveau l'autorisation plus tard
    }
  }



  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController PlacesAccident = TextEditingController();


  // ----------Ville Accident
  final List<Map<String, dynamic>> _items_Ville = [
    {
      'value': 'Autoroute',
      'label': 'Autoroute',

    },
    {
      'value': 'RouteExpress',
      'label': 'Route express',

    },
    {
      'value': 'RouteUrbaineDoubleSens',
      'label': 'Route urbaine, a double sens',

    },
    {
      'value': 'RouteUrbaineSensUnique',
      'label': 'Route urbaine, a sens unique',

    },
  ];

  //--------- Municipalité Accident
  final List<Map<String, dynamic>> _items_Municipalite = [
    {
      'value': 'Seche',
      'label': 'Seche',
    },
    {
      'value': 'Neige',
      'label': 'Neige',
    },
    {
      'value': 'Glissante',
      'label': 'Glissante',
    },
    {
      'value': 'Humide',
      'label': 'Humide',
    },
  ];

  //--------- Type Accident
  final List<Map<String, dynamic>> _item_TypeAccident = [
    {
      'value': 'Seche',
      'label': 'Seche',
    },
    {
      'value': 'Neige',
      'label': 'Neige',
    },
    {
      'value': 'Glissante',
      'label': 'Glissante',
    },
    {
      'value': 'Humide',
      'label': 'Humide',
    },
  ];

  // --------------------- item Condition climatique
  final List<Map<String, dynamic>> _items_ConditionClimatique = [
    {
      'value': 'Seche',
      'label': 'Seche',
    },
    {
      'value': 'Neige',
      'label': 'Neige',
    },
    {
      'value': 'Glissante',
      'label': 'Glissante',
    },
    {
      'value': 'Humide',
      'label': 'Humide',
    },
  ];

  // ---------------item type d'impact
  final List<Map<String, dynamic>> _item_TypeImpact = [
    {
      'value': 'Seche',
      'label': 'Seche',
    },
    {
      'value': 'Neige',
      'label': 'Neige',
    },
    {
      'value': 'Glissante',
      'label': 'Glissante',
    },
    {
      'value': 'Humide',
      'label': 'Humide',
    },
  ];

  // ---------------item Condition luminosité
  final List<Map<String, dynamic>> _item_BrithnessCondition = [
    {
      'value': 'Seche',
      'label': 'Seche',
    },
    {
      'value': 'Neige',
      'label': 'Neige',
    },
    {
      'value': 'Glissante',
      'label': 'Glissante',
    },
    {
      'value': 'Humide',
      'label': 'Humide',
    },
  ];

  // ---------------item Gravité Accident
  final List<Map<String, dynamic>> _item_GraviteAccident = [
    {
      'value': 'Seche',
      'label': 'Seche',
    },
    {
      'value': 'Neige',
      'label': 'Neige',
    },
    {
      'value': 'Glissante',
      'label': 'Glissante',
    },
    {
      'value': 'Humide',
      'label': 'Humide',
    },
  ];






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enregitrement Accidentés(Victimes)"),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              /*
              Text("Letitre recue est  title ${widget.title}"),
              Text("le sous titres hein ${widget.subtitle}"),

               */

              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 10),
                child: Image.asset(
                    'assets/icon_doser/person_record/person_crash.png',
                    fit: BoxFit.contain,
                    scale: 1.0
                ),
              ),

              SizedBox(height: 15,),

              TextFormField(
                controller: PlacesAccident,

                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: 'Places'),

                validator: (value){
                  if(value!.isEmpty){
                    return "Veuillez Entrer L'emplacement (N° rue) de l'accident";
                  }
                },
              ),

              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.location_pin),
                  labelText: 'Ville',
                  items: _items_Ville,
                  onChanged: (val) {
                    print(val);
                    //updateCurrentStep(2);
                    setState(() {

                    });

                  },

                  onSaved: (val) => print(val),

                ),
              ),

              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.location_pin),
                  labelText: 'Municipalité',
                  items: _items_Municipalite,
                  onChanged: (val) {
                    print(val);
                    //updateCurrentStep(2);
                    setState(() {

                    });

                  },
                  onSaved: (val) => print(val),

                ),
              ),

              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.car_crash_outlined),
                  labelText: "Type d'accident",
                  items: _item_TypeAccident,
                  onChanged: (val) {
                    print(val);
                    //updateCurrentStep(2);
                    setState(() {

                    });

                  },
                  onSaved: (val) => print(val),

                ),
              ),

              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.wind_power),
                  labelText: "Conditions Climatiques",
                  items: _items_ConditionClimatique,
                  onChanged: (val) {
                    print(val);
                    //updateCurrentStep(2);
                    setState(() {

                    });

                  },
                  onSaved: (val) => print(val),

                ),
              ),

              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.minor_crash_outlined),
                  labelText: "Type d'impact",
                  items: _item_TypeImpact,
                  onChanged: (val) {
                    print(val);
                    //updateCurrentStep(2);
                    setState(() {

                    });

                  },
                  onSaved: (val) => print(val),

                ),
              ),

              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.sunny),
                  labelText: "Condition Luminosité",
                  items: _item_BrithnessCondition,
                  onChanged: (val) {
                    print(val);
                    //updateCurrentStep(2);
                    setState(() {

                    });

                  },
                  onSaved: (val) => print(val),

                ),
              ),

              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.minor_crash_sharp),
                  labelText: "Gravité de l'accident",
                  items: _item_GraviteAccident,
                  onChanged: (val) {
                    print(val);
                    //updateCurrentStep(2);
                    setState(() {

                    });

                  },
                  onSaved: (val) => print(val),

                ),
              ),

            ],
          )
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: widget.cancelDataNewCar,
              icon: Icon(Icons.cancel, size: 50),
              label: Text('Annuler'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Changer la couleur d'arrière-plan
                //onPrimary: Colors.green, // Changer la couleur du texte
                //shadowColor: Colors.grey, // Changer la couleur de l'ombre
              ),
            ),
            ElevatedButton.icon(
              onPressed: widget.saveDataNewCar,
              icon: Icon(Icons.add_circle, size: 50),
              label: Text('Continuer'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[300], // Changer la couleur d'arrière-plan
                //onPrimary: Colors.green, // Changer la couleur du texte
                //shadowColor: Colors.grey, // Changer la couleur de l'ombre
              ),
            ),
          ],
        ),
      ),
    );






  }
}
