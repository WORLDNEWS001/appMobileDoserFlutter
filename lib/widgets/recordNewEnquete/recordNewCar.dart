import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/one_select/view_one_select_form.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:select_form_field/select_form_field.dart';


class RecordNewCar extends StatefulWidget {

  final String? title;
  final String? subtitle;
  List<VehiculeResp>? listVehicule = [];

   RecordNewCar({Key? key,
     this.title,
     this.subtitle,
      this.listVehicule
   }) : super(key: key);



  void saveDataNewCar() {

    print("save data ");

  }

  void cancelDataNewCar() {

    print("cancel action add car");

  }


  @override
  State<RecordNewCar> createState() => _RecordNewCarState();
}

class _RecordNewCarState extends State<RecordNewCar> {


  TextEditingController NumeroAccident = TextEditingController();
  TextEditingController plaqueMatricule = TextEditingController();
  TextEditingController anneeModeleCar = TextEditingController();
  TextEditingController cylindre = TextEditingController();

  //--------- Type Accident
  final List<Map<String, dynamic>> _items_MarqueVehicule = [
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
  final List<Map<String, dynamic>> _items_TypeVehicule = [
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
  final List<Map<String, dynamic>> _items_ModeleVehicule = [
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
  final List<Map<String, dynamic>> _item_FunctionSpecial = [
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
  final List<Map<String, dynamic>> _items_ManoevreVehicule = [
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


  List<String> listPathImageCrashCar = [];

  Future<void> captureImage(BuildContext context , String methode ) async {
    if(methode == "camera"){
      //await pickPhotoProfilMulti(ImageSource.camera);
      //await pickPhotoProfilMulti_Path_method2(ImageSource.camera);
      listPathImageCrashCar = await GlobalMethod().pickPhotoProfilMulti_Path_method2NoThread(context, ImageSource.camera);
    }else if(methode == "gallery"){
      //await pickPhotoProfilMulti(ImageSource.gallery);
      //await pickPhotoProfilMulti_Path_method2(ImageSource.gallery);
      listPathImageCrashCar = await GlobalMethod().pickPhotoProfilMulti_Path_method2NoThread(context, ImageSource.gallery);
    }
    print("-------//////////////-------------------- listPathImageCrashCar  -----------/////////////////-----------");
    print(" la liste de image du car crasher est de :::::::::::: $listPathImageCrashCar");
    print("----------  END  ------ listPathImageCrashCar  ----------------------");
    setState(() {
      listPathImageCrashCar = listPathImageCrashCar;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enregitrement Vehicule"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                    'assets/icon_doser/car_record/car_crash.png',
                    fit: BoxFit.contain,
                      scale: 1.0

                  ),
                ),



                SizedBox(height: 15,),



                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                          onPressed: (()=> captureImage(context, "camera") //--- Boucle For
                          ),
                          child: Icon(Icons.camera_alt_outlined)
                      ),
                      ElevatedButton(
                        onPressed: (()=> captureImage(context, "gallery")  //--- Boucle For
                        ),
                        child: Icon(Icons.photo_library_outlined),
                      ),
                      /*ElevatedButton(
                        onPressed: (()=> InitializeImages()
                        ),
                        child: Icon(Icons.delete_forever),
                      ),
                       */

                    ]
                ),


                listPathImageCrashCar != null && listPathImageCrashCar.length == 3
                    ?
                Container(
                  height: MediaQuery.of(context).size.height/3.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[100],
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: GridView.builder(
                        itemCount: listPathImageCrashCar.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                color: Colors.cyan[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: //_buildImage(index)
                              Image.file(
                                File(listPathImageCrashCar[index],),
                                fit: BoxFit.cover,
                              ),
                            )
                          );
                        },
                      )
                  ),
                )

                    :
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[100],
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: GridView.builder(
                      itemCount: listPathImageCrashCar.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (BuildContext context, int index){
                        return
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(listPathImageCrashCar[index]),
                                fit:BoxFit.cover,
                              )
                          );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 15,),





                TextFormField(
                  controller: NumeroAccident,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(),
                      labelText: 'Numéro du Véhicule'),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Veuillez Entrer Le numero du vehicule";
                    }
                  },
                ),
                SizedBox(height: 10,),

                TextFormField(
                  controller: plaqueMatricule,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: "Plaque d'immatriculation",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Veuillez Entrer la plaque immatriculation du vehicule";
                    }
                  },
                ),
                SizedBox(height: 10,),

                TextFormField(
                  controller: anneeModeleCar,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: "Année modèle du Véhicule",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Veuillez Entrer Année du model du vehicule";
                    }
                  },
                ),

                SizedBox(height: 10,),

                TextFormField(
                  controller: cylindre,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: "Cylindrée",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Veuillez Entrer le nombre de cylindre du vehicule";
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
                    icon: Icon(Icons.branding_watermark_outlined),
                    labelText: 'Marque Du Véhicule',
                    items: _items_MarqueVehicule,
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


/*
                //----------------Chois de la marque du vehicule -----------

                //---------------------Generate this Widget select marque du vehicule -----------------
                ViewOneSelectForm(
                  liste_de_type: context.watch<DataOmsSelectProvider>().brandRespListSelect,
                  default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_brand,
                  labelText: "Marque Du Vehicule",
                  //iconData:Icons.edit_road,
                  path_asset_image_icon: "assets/icon_doser/accident_info/municipalite.png",
                  function_onChanged: (selectedValue) {
                    print(selectedValue?.value);
                    context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
                  },
                ),

                //---------------------End Generate this Widget select -----------------
*/










                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    initialValue: 'circle',
                    icon: Icon(Icons.location_pin),
                    labelText: 'Type du Véhicule',
                    items: _items_TypeVehicule,
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
                    labelText: 'Modèle du Véhicule',
                    items: _items_ModeleVehicule,
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
                    labelText: "Fonction spéciale du vehicule",
                    items: _item_FunctionSpecial,
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
                    labelText: "Manoeuvre du Véhicule",
                    items: _items_ManoevreVehicule,
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
