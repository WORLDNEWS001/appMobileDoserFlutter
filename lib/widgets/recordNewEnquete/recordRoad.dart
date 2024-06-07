import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/one_select/view_one_select_form.dart';
import 'package:secondtest/View/Formulaires_Enquete/one_text_form/view_one_text_form_field.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/other_class_object/GeoPosition.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:secondtest/services/localisation/location_service.dart';


//import 'package:location/location.dart' ;



class recordNewRoad extends StatefulWidget {

  const recordNewRoad({Key? key, required this.onStepUpdated}) : super(key: key);

  final Function(int) onStepUpdated;

  @override
  State<recordNewRoad> createState() => recordNewRoadState();
}

class recordNewRoadState extends State<recordNewRoad> {


  //------------ les variable  de localisation ------------
  GeoPosition? AccidentPosition;
  late TextEditingController controllerLocalisation;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerLocalisation = TextEditingController();
  }






  void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    print("je suis dans la fonction somme action du child de record Road ");
    widget.onStepUpdated(3);
  }
  //--------------------  for update value step (MAKE function Some Action)


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[



          /*
          ViewOneTextFormField(
              label_text_form: "Entrez la vitesse",
              controller_text_form_field: context.watch<ProviderColleteDataEnquete>().controller_limite_vitesse,
          ),

           */

          SizedBox(height: 5,),


          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text("Localisation",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child:  Container(
                      height: 70,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child:
                      TextFormField(
                        enabled: false,
                        onChanged: (value) {
                          print(value);
                        },
                        controller: controllerLocalisation,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.location_on),
                            border: OutlineInputBorder(),
                            labelText: 'Localisation'),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Localisator";
                          }
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                          ImplementLocationServices();
                      },
                      child: Center(
                            child: Icon(Icons.location_on_outlined,
                                    size: 30,
                                  )
                      )



                  )
                ],
              )


            ],
          ),





          //---------------------Generate this Widget select type de route -----------------
          ViewOneSelectForm(
              liste_de_type: context.watch<DataOmsSelectProvider>().roadTypeRespListSelect,
              default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_road_type,
              labelText: "Type Route",
              //iconData:Icons.edit_road,
              path_asset_image_icon: "assets/icon_doser/route/type_route.png",
              function_onChanged: (selectedValue) {
                print(selectedValue?.value);
                context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
              },
          ),

          //---------------------End Generate this Widget select -----------------



          //---------------------Generate this Widget select etat de la route -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().roadStateRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_road_state,
            labelText: "Etat de la Route",
            //iconData: Icons.remove_road_rounded,
            path_asset_image_icon: "assets/icon_doser/route/etat_route.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------- End



          //---------------------Generate this Widget select Pente Du Tronçon de la Route -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().roadSlopSectionRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_slop_section,
            labelText: "Pente Du Tronçon de la Route",
            //iconData: Icons.remove_road_rounded,
            path_asset_image_icon: "assets/icon_doser/route/pente.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------- End



          //---------------------Generate this Widget select Controle de la circulation au careffour -----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().controlRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_control,
            labelText: "Controle de circulation au carrefour",
            //iconData: Icons.edit_road_rounded,
            path_asset_image_icon: "assets/icon_doser/route/carrefour_control.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------- End



          //---------------------Generate this Widget select Categorie Fonctonnelle des routes-----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().roadCategoryRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_road_category,
            labelText: "Categorie de la route",
            //iconData: Icons.edit_road_rounded,
            path_asset_image_icon: "assets/icon_doser/route/autoroute.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------- End




          //---------------------Generate this Widget select Obstacle Routier----------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().blockRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_block,
            labelText: "Obstacle Routier",
            //iconData: Icons.block_outlined,
            path_asset_image_icon: "assets/icon_doser/route/obstacle.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------- End




          //---------------------Generate this Widget select Instersection Carrefour---------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().roadIntersectionRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_road_intersection,
            labelText: "Intersection carrefour",
            path_asset_image_icon: "assets/icon_doser/route/carrefour.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------- End



          //---------------------Generate this Widget select type de virage---------------
          ViewOneSelectForm(
            liste_de_type: context.watch<DataOmsSelectProvider>().virageRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_virage,
            labelText: "Type de virage",
            path_asset_image_icon: "assets/icon_doser/route/direction.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------- End


        ],
      ),
    );










  }




  ImplementLocationServices() async {

    MyDialogLoader.showLoadingDialog(context, "Localisation en cours...");
    GeoPosition? location_accident = await LocationService().getCity().then((location_accident) {
      if(location_accident != null){
        AccidentPosition = location_accident;
        controllerLocalisation.text = "${AccidentPosition?.city} ${AccidentPosition?.lat} ${AccidentPosition?.lon}";
        context.read<ProviderColleteDataEnquete>().Update_data_enq_accident_position(data_enq_receive: location_accident);
        print("je print les coodonnee gps++++++++++++++////////////+++++++++ ${AccidentPosition}");
      }
    });
    MyDialogLoader.hideLoadingDialog(context);
    setState(() {

    });
  }






/*

  Future<String?> LocalisationService() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    // Vérifiez si le service de localisation est activé
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return "";
      }
    }

    // Vérifiez si l'autorisation de localisation est accordée
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return "";
      }
    }

    // Obtenez les données de localisation
    try {
      LocationData NowGpsData = await location.getLocation();
      print("j'ai localisé avec succès ");
      String? dataGpsOutPut = "${NowGpsData.longitude};${NowGpsData.latitude};${NowGpsData.verticalAccuracy};";
      print("les données GPS sont de -----------${dataGpsOutPut}");

      context.read<ProviderDataAsset>().updateLocator(dataloc: "dataGpsOutPut___edzffge");
      return dataGpsOutPut.toString();
    } catch (e) {
      print("Erreur lors de la récupération de la localisation --- erreur $e");
      return "";
    }
  }
*/



}
