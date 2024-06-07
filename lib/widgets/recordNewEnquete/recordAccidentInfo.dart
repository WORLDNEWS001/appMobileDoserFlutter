
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/one_select/view_one_select_form.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:secondtest/services/manage_image/pick_image_data.dart';
import 'package:select_form_field/select_form_field.dart';

import 'package:image_picker/image_picker.dart';




class recordAccidentInfo extends StatefulWidget {
  const recordAccidentInfo({Key? key, required this.onStepUpdated}) : super(key: key);
  final Function(int) onStepUpdated;

  @override
  State<recordAccidentInfo> createState() => _recordAccidentInfoState();
}





class _recordAccidentInfoState extends State<recordAccidentInfo> {

  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    var date_init = DateTime.now(); // Initialisation de selectedDate ici
  }

  //----------FONCTION IMPLEMENT TO UPDATE STEP VALUE--------------//
  void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...

    print("je suis dans la fonction sommeAction du child de record accident info ");
    widget.onStepUpdated(3);

  }
  //--


  //  exemple liste avec option
  /*  ----------Exemple liste avec option

      final List<Map<String, dynamic>> _items_TypeRoad = [
        {
          'value': 'Autoroute',
          'label': 'Autoroute',
          //'icon': Icon(Icons.stop),
        },
        {
          'value': 'RouteExpress',
          'label': 'Route express',
          //'icon': Icon(Icons.fiber_manual_record),
          'textStyle': TextStyle(color: Colors.blue),
        },
        {
          'value': 'RouteUrbaineDoubleSens',
          'label': 'Route urbaine, a double sens',
          'enable': false,
          //'icon': Icon(Icons.grade),
        },
        {
          'value': 'RouteUrbaineSensUnique',
          'label': 'Route urbaine, a sens unique',
          'enable': false,
          //'icon': Icon(Icons.grade),
        },
      ];
  */

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




  late TextEditingController? _dateController;
  late TextEditingController? _timeController;

  late TextEditingController? PlacesAccident;
  late List<String>? listPathImageCrashUrlNetwork = [];

  PickImageData? pickImageDataLocal;



  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
   _dateController = context.watch<ProviderColleteDataEnquete>().date_accident_controller;
    _timeController = context.watch<ProviderColleteDataEnquete>().time_accident_controller;
   PlacesAccident = context.watch<ProviderColleteDataEnquete>().places_accident_controller;
   listPathImageCrashUrlNetwork = context.watch<ProviderColleteDataEnquete>().providerListImgCrash;

    pickImageDataLocal = context.watch<ProviderColleteDataEnquete>().ProviderPickImageDataCrashLocal;


  }






  @override
  Widget build(BuildContext context) {



    return Container(
      child: Column(
        children: <Widget> [

          SizedBox(height: 15,),


          Column(
            children: <Widget>[
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date',
                  suffixIcon: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          );
                          if (date != null) {
                            final formattedDate = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                            _dateController?.text = formattedDate;
                          }
                        },
                      ),
                  )
                ),
              ),
              TextField(
                controller: _timeController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Time',
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueAccent
                    ),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.access_time),
                      onPressed: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          final formattedTime = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
                          _timeController?.text = formattedTime;
                        }
                      },
                    ),
                  )


                ),
              ),
            ],
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


          /*
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
          ),*/


          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                    onPressed: (()=> captureImageCrash(context, "camera") //--- Boucle For
                    ),
                    child: Icon(Icons.camera_alt_outlined)
                ),
                ElevatedButton(
                  onPressed: (()=> captureImageCrash(context, "gallery")  //--- Boucle For
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

          Container(
            height: MediaQuery.of(context).size.height/3.5,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[100],
            child: Padding(
                padding: EdgeInsets.all(8),
                child:
                GridView.builder(
                  itemCount: pickImageDataLocal?.ListPathImages?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return
                      ClipRRect(
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
                            File(pickImageDataLocal!.ListPathImages![index]),
                            fit:BoxFit.cover,
                          )

                          /*
                          Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            margin: EdgeInsets.all(5),
                          )

                           */
                        )
                    );
                  },
                )


            ),
          ),

            /*
            //  :
          Container(
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[500],
            child: Padding(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                itemCount: listPathImageCrash.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index){
                  return
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: /*Image.file(
                          File(listPathImageCrash[index]),
                          fit:BoxFit.cover,
                        )*/
                      Image.asset(
                          'assets/icon_doser/car_record/car_crash.png',
                          fit: BoxFit.contain,
                          scale: 1.0
                      ),

                    );
                },
              ),
            ),
          ),
        */



          //---------------------Generate this Widget select type de route -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().cityRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_city,
            labelText: "Ville",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/ville.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------




          //---------------------Generate this Widget select type de Municipalité -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().municipalityRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_municipality,
            labelText: "Municipalité",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/municipalite.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------

         
          //---------------------Generate this Widget select type de Type d'accident  -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().accidentTypeRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_accident_type,
            labelText: "Type d'accident",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/accident.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------











          //---------------------Generate this Widget select type de Conditions Climatiques -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().climaticConditionRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_climatic_condition,
            labelText: "Conditions Climatiques",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/climate.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------









          //---------------------Generate this Widget select type de Conditions Type d'impact -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().impactTypeRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_impact_type,
            labelText: "Type d'impact",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/impact.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------







          //---------------------Generate this Widget select type de  Condition Luminosité -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().brightnessConditionRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_brightness_condition,
            labelText: "Condition Luminosité",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/brightness.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------







          //---------------------Generate this Widget select type de  Gravité de l'accident-----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().accidentSeverityRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_accident_severity,
            labelText: "Gravité de l'accident",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/gravi_accident.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------



        ],
      ),
    );
  }











  Future<void> captureImageCrash(BuildContext context , String methode ) async {
    if(methode == "camera"){

      await pickImageDataLocal?.pickImageCamera().then((value){
        setState(() {
          print("la liste des paths est de ::  ${pickImageDataLocal?.ListPathImages}");
        });
      });

    }else if(methode == "gallery"){
      await pickImageDataLocal?.pickImageGallerie().then((value) {
        setState(() {
          print("la liste des paths est de ::  ${pickImageDataLocal?.ListPathImages}");
        });
      });

    }

  }

}
