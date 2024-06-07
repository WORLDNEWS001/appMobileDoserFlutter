import 'package:flutter/material.dart';
import 'package:secondtest/global_method.dart';

import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/accident_severity_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/accident_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/brightness_condition_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/city_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/climatic_condition_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/impact_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/municipality_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Images.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeResp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/action_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_consumption_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_result_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_status_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/gender_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/occupant_restraint_system_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/person_drug_use_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/professionResp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/seating_place_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/seating_range_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/trauma_severity_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/wearing_helmet_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/block_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/control_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_category_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_intersection_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_slop_section_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_state_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/virage_resp.dart';

import 'package:intl/intl.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/brand_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/special_function_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_action_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_model_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_type_resp.dart';
import 'package:secondtest/model/other_class_object/GeoPosition.dart';
import 'package:secondtest/services/manage_image/pick_image_data.dart';


class ProviderColleteDataEnquete with ChangeNotifier {


  Map<String, dynamic>? data_new_enquette;

  EnquetteData? DataFormEnquete = EnquetteData();

  UpdateDataFormEnquete(){

    //-----------------------------/////--- info Road Enquete ---//////-----------------------------//
    DataFormEnquete?.latitude = data_enq_accident_position?.lat;
    DataFormEnquete?.longitude = data_enq_accident_position?.lon;

    DataFormEnquete?.causes = [];

    DataFormEnquete?.speedLimit = data_enq_limite_vitesse;
    DataFormEnquete?.roadType = data_enq_road_type;
    DataFormEnquete?.roadState = data_enq_road_state;
    DataFormEnquete?.roadSlopSection = data_enq_slop_section;
    DataFormEnquete?.roadTrafficControl = data_enq_control;
    DataFormEnquete?.roadCategory = data_enq_road_category;
    DataFormEnquete?.block = data_enq_block;
    DataFormEnquete?.roadIntersection = data_enq_road_intersection;
    DataFormEnquete?.virage = data_enq_virage;


    //-----------------------------/////--- info Accident Enquete ---//////-----------------------------//
    DataFormEnquete?.accidentDate = date_accident_controller?.text;
    DataFormEnquete?.accidentTime = time_accident_controller?.text;
    DataFormEnquete?.place = places_accident_controller?.text;
    DataFormEnquete?.city = data_enq_city;
    DataFormEnquete?.municipality = data_enq_municipality;
    DataFormEnquete?.accidentType = data_enq_accident_type;
    DataFormEnquete?.climaticCondition = data_enq_climatic_condition;
    DataFormEnquete?.impactType = data_enq_impact_type;
    DataFormEnquete?.brightnessCondition = data_enq_brightness_condition;
    DataFormEnquete?.accidentSeverity = data_enq_accident_severity;

    //---------------------// Vehicule Enquete //----------------------------//
    DataFormEnquete?.vehicules = list_data_enq_vehicules;

    //---------------------// Person Enquete //----------------------------//
    DataFormEnquete?.persons = data_enq_persons;

    print(
        "\n\n\n  ---- Data -- Place is ::: ${DataFormEnquete?.place}  \n\n\n\n");

    notifyListeners();
  }


  UpdateProvidersCollecteByDataEnquete (EnquetteData enquetteData){

    DataFormEnquete = enquetteData;


    data_enq_accident_position?.lat = DataFormEnquete?.latitude;
    data_enq_accident_position?.lon = DataFormEnquete?.longitude;


    //------------- Collect Road Data -----------------//
    data_enq_limite_vitesse = DataFormEnquete?.speedLimit;
    data_enq_road_type = DataFormEnquete?.roadType;
    data_enq_road_state = DataFormEnquete?.roadState;
    data_enq_slop_section = DataFormEnquete?.roadSlopSection;
    data_enq_control = DataFormEnquete?.roadTrafficControl;
    data_enq_road_category = DataFormEnquete?.roadCategory;
    data_enq_block = DataFormEnquete?.block;
    data_enq_road_intersection = DataFormEnquete?.roadIntersection;
    data_enq_virage = DataFormEnquete?.virage;

    //------------- Collect Accident Data -----------------//
    date_accident_controller?.text = DataFormEnquete?.accidentDate ?? "";
    time_accident_controller?.text = DataFormEnquete?.accidentTime ?? "";
    places_accident_controller?.text = DataFormEnquete?.place ?? "";
    data_enq_city = DataFormEnquete?.city;
    data_enq_municipality = DataFormEnquete?.municipality;
    data_enq_accident_type = DataFormEnquete?.accidentType;
    data_enq_climatic_condition = DataFormEnquete?.climaticCondition;
    data_enq_impact_type = DataFormEnquete?.impactType;
    data_enq_brightness_condition = DataFormEnquete?.brightnessCondition;
    data_enq_accident_severity = DataFormEnquete?.accidentSeverity;

    //---------------------// Vehicule Enquete //----------------------------//
    list_data_enq_vehicules = DataFormEnquete?.vehicules;

    //---------------------// Person Enquete //----------------------------//
    data_enq_persons = DataFormEnquete?.persons;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }















  //----------------------- Collect data Road -----------------//

  TextEditingController? controller_limite_vitesse = TextEditingController();



  int? data_enq_limite_vitesse;

  RoadTypeResp? data_enq_road_type;

  RoadStateResp? data_enq_road_state;

  RoadSlopSectionResp? data_enq_slop_section;

  ControlResp? data_enq_control;

  RoadCategoryResp? data_enq_road_category;

  BlockResp? data_enq_block;

  RoadIntersectionResp? data_enq_road_intersection;

  VirageResp? data_enq_virage;


  //--------------- Localisation data Accident -----------------//
  GeoPosition? data_enq_accident_position;
  Update_data_enq_accident_position({required GeoPosition? data_enq_receive}){
    data_enq_accident_position = data_enq_receive;

    notifyListeners();
  }



  //---------- Collect Data Accident -----------------------//

  CityResp? data_enq_city;
  MunicipalityResp? data_enq_municipality;
  AccidentTypeResp? data_enq_accident_type;
  ClimaticConditionResp? data_enq_climatic_condition;
  ImpactTypeResp? data_enq_impact_type;
  BrightnessConditionResp? data_enq_brightness_condition;
  AccidentSeverityResp? data_enq_accident_severity;

  TextEditingController? date_accident_controller = TextEditingController();
  String? date_accident_data;

  TextEditingController? time_accident_controller = TextEditingController();
  String? time_accident_data;

  TextEditingController? places_accident_controller = TextEditingController();
  String? places_accident_data;

  //---- PICK IMAGE CRASH LOCAL --//
  PickImageData? ProviderPickImageDataCrashLocal = PickImageData();

  List<String>? providerListImgCrash = [];
  Update_providerListImgCrash({required List<String>? data_enq_receive}){
    providerListImgCrash = data_enq_receive;
    notifyListeners();
  }


  //-------####---------------- Collect data Car Crash -----------------//
  List<VehiculeResp>? list_data_enq_vehicules = [];

  Update_list_data_enq_vehicules() {
    data_enq_vehicleAccidentNumber_vehicule =
        data_enq_vehicleAccidentNumber_vehicule! + 1;

    VehiculeResp vehiculeResp = VehiculeResp(
      id: 0,
      vehicleAccidentNumber: 0,
      plate: data_enq_num_immatriculation?.text,
      chassis: data_enq_num_chassis?.text,
      vehicleId: 0,
      type: data_enq_vehicle_type,
      brand: data_enq_brand,
      model: data_enq_vehicleModel,
      fabricationYear: int.tryParse((data_enq_year_model_vehicule?.text)?? ""),
      cylinderCapacity: int.tryParse((data_enq_nbr_cylindre?.text) ?? ""),
      specialFunction: data_enq_specialFunction,
      vehicleAction: vehicleActionRespListSelect,
      vehicleImages: [],

    );
    list_data_enq_vehicules?.add(vehiculeResp);

    notifyListeners();
  }

  TextEditingController? data_enq_num_vehicule_controller = TextEditingController();
  String? num_vehicule_data;

  TextEditingController? data_enq_num_immatriculation = TextEditingController();
  String? num_immatriculation_data;

  TextEditingController? data_enq_num_chassis = TextEditingController();
  String? num_chassis_data;

  TextEditingController? data_enq_year_model_vehicule  = TextEditingController();
  String? year_model_vehicule_data;

  TextEditingController? data_enq_nbr_cylindre  = TextEditingController();
  String? nbr_cylindre_data;

  BrandResp? data_enq_brand;

  VehicleTypeResp? data_enq_vehicle_type;

  VehicleModelResp? data_enq_vehicleModel;

  SpecialFunctionResp? data_enq_specialFunction;

  VehicleActionResp? vehicleActionRespListSelect;

  late int? data_enq_vehicleAccidentNumber_vehicule = 0;

  //-------#####-------- Method Record Form Person Crash Data- ----------------//

  List<PersonResp>? data_enq_persons = [];

  Update_list_Person() {
    data_enq_personAccidentNumber = data_enq_personAccidentNumber! + 1;

    PersonResp personResp = PersonResp(
      id: 0,
      firstName: data_enq_firstName?.text,
      lastName: data_enq_lastName?.text,
      cni: data_enq_cni?.text,
      telephone: data_enq_telephone?.text,
      personAccidentNumber: data_enq_personAccidentNumber,
      vehicleAccidentNumber: data_enq_vehicleAccidentNumber_person,
      vehicleLinkedPedestrian: data_enq_vehicleLinkedPedestrian,
      birthDate: data_enq_birthDate?.text,
      gender: data_enq_gender,
      roadType: data_enq_roadType,
      range: data_enq_range,
      place: data_enq_place,
      traumaSeverity: data_enq_traumaSeverity,
      wearingHelmet: data_enq_wearingHelmet,
      occupantRestraintSystem: data_enq_occupantRestraintSystem,
      personAction: data_enq_personAction,
      alcoholConsumption: data_enq_alcoholConsumption,
      testStatus: data_enq_testStatus,
      testType: data_enq_testType,
      testResult: data_enq_testResult,
      drugUse: data_enq_drugUse,
      drivingLicenceYear: data_enq_drivingLicenceYear?.text,
      care: data_enq_care,
      personId: data_enq_personId,
      //images: data_enq_images,
      profession: data_enq_Profession,
      nopermis: data_enq_nopermis?.text,
      typepermis: 1,
      dateCreate: data_enq_personDateCreate,
      vgt_id: data_enq_data_enq_vgt_id,
      originalIndex: data_enq_originalIndex,
      types: data_enq_types,
    );
    data_enq_persons?.add(personResp);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  TextEditingController? data_enq_ = TextEditingController();

  AlcoholTestResultResp? data_enq_alcoholTestResult;
  AlcoholTestTypeResp? data_enq_alcoholTestType;
  AlcoholTestStatusResp? data_enq_alcoholTestStatus;

  TextEditingController? data_enq_firstName = TextEditingController();
  TextEditingController? data_enq_lastName = TextEditingController();
  TextEditingController? data_enq_cni = TextEditingController();
  TextEditingController? data_enq_telephone = TextEditingController();
  int? data_enq_personAccidentNumber = 0;

  TextEditingController? data_enq_vehicleChoise = TextEditingController();
  late int? data_enq_vehicleAccidentNumber_person =
      int.tryParse(data_enq_vehicleChoise?.text ?? "");
  late int? data_enq_vehicleLinkedPedestrian =
      int.tryParse(data_enq_vehicleChoise?.text ?? "");

  TextEditingController? data_enq_birthDate = TextEditingController();

  GenderResp? data_enq_gender;
  RoadTypeResp? data_enq_roadType;
  SeatingRangeResp? data_enq_range;
  SeatingPlaceResp? data_enq_place;
  TraumaSeverityResp? data_enq_traumaSeverity;
  WearingHelmetResp? data_enq_wearingHelmet;
  OccupantRestraintSystemResp? data_enq_occupantRestraintSystem;
  ActionResp? data_enq_personAction;
  AlcoholConsumptionResp? data_enq_alcoholConsumption;
  AlcoholTestStatusResp? data_enq_testStatus;
  AlcoholTestTypeResp? data_enq_testType;
  AlcoholTestResultResp? data_enq_testResult;
  PersonDrugUseResp? data_enq_drugUse;

  TextEditingController? data_enq_drivingLicenceYear = TextEditingController();
  int? data_enq_care = 0;
  int? data_enq_personId = 0;

  List<Images?>? data_enq_images;

  ProfessionResp? data_enq_Profession;

  TextEditingController? data_enq_nopermis = TextEditingController();

  String? data_enq_personDateCreate = DateTime.now().toString();

  int? data_enq_data_enq_vgt_id;
  int? data_enq_originalIndex;
  String? data_enq_types;

/*
  1--////////-- Chauffeur -- /////----
  123+++ "id": 0,
  123+++ "care": 0
  123+++ "roadType": 1,
  123+++ "place": 3,
  123+++ "range": 2,
  123+++ "wearingHelmet": 2,
  123+++ "occupantRestraintSystem": 4,




  123+++ "lastName": "TEST NOM CHAUFFEUR CAR 2",
  123+++ "firstName": "test joel car 2",
  123+++ "birthDate": "23/05/2022",
  1++(Chauffeur)  "nopermis": "9988",
  1++(Chauffeur)  "typepermis": 1,
  1++(Chauffeur)  "drivingLicenceYear": "23/05/2022",

*/



//--------------- Method Record Form Road Data- ----------------//
  Update_data_enq_limite_vitesse({required TextEditingController? data_enq_receive}){
    controller_limite_vitesse = data_enq_receive;
    data_enq_limite_vitesse = int.tryParse(controller_limite_vitesse!.text);
    notifyListeners();
    print("Data -------  Update_data_enq_limite_vitesse ------ == $data_enq_limite_vitesse");

  }

//--------------- Method Record Form Accident Data- ----------------//
  Update_date_accident_controller({required TextEditingController? data_enq_receive}){
    date_accident_controller = data_enq_receive;
    date_accident_data = (date_accident_controller?.text).toString();
    notifyListeners();

    print("Data -------  Update_date_accident_controller ------ == $date_accident_data");

  }

  Update_time_accident_controller({required TextEditingController? data_enq_receive}){
    time_accident_controller = data_enq_receive;
    time_accident_data = (time_accident_controller?.text).toString();
    notifyListeners();

    print("Data -------  Update_time_accident_controller ------ == $time_accident_data");

  }

  Update_places_accident_controller({required TextEditingController? data_enq_receive}){
    places_accident_controller = data_enq_receive;
    places_accident_data = (places_accident_controller?.text).toString();
    notifyListeners();

    print("Data -------  Update_places_accident_controller ------ == $places_accident_data");

  }







  //--------------- Method Record All Select data Enquette - ----------------//

  Update_data_enq(Object? data_enq_receive){

    switch (data_enq_receive.runtimeType) {

    //-------- Collect ROAD data Accident Formulaire ----//

      case RoadTypeResp:
        {

          data_enq_road_type = data_enq_receive as RoadTypeResp?;
          print("Dans le Update_data_enq_road_type je reçois et je fais l'équivalence ${data_enq_receive?.value}");

        }break;

      case RoadStateResp:
        {

          data_enq_road_state = data_enq_receive as RoadStateResp?;

        }break;

      case RoadSlopSectionResp:
        {

          data_enq_slop_section = data_enq_receive as RoadSlopSectionResp?;

        }break;

      case ControlResp:
        {

          data_enq_control = data_enq_receive as ControlResp?;

        }break;

      case RoadCategoryResp:
        {

          data_enq_road_category = data_enq_receive as RoadCategoryResp?;

        }break;

      case BlockResp:
        {

          data_enq_block = data_enq_receive as BlockResp?;

        }break;

      case RoadIntersectionResp:
        {

          data_enq_road_intersection = data_enq_receive as RoadIntersectionResp?;

        }break;

      case VirageResp:
        {

          data_enq_virage = data_enq_receive as VirageResp?;

        }break;


      //-------- Collect ACCIDENT data Accident Formulaire ----//


      case CityResp:
        {

          data_enq_city = data_enq_receive as CityResp?;
          print("Dans le Update_data_enq_road_type je recoit  ${data_enq_receive?.value}");
          print("Dans le Update_data_enq_road_type je recoit et je fais l'equivalence  ${data_enq_city?.value}");

        }break;


      case MunicipalityResp:
        {

          data_enq_municipality = data_enq_receive as MunicipalityResp?;

        }break;

      case AccidentTypeResp:
        {

          data_enq_accident_type = data_enq_receive as AccidentTypeResp?;

        }break;

      case ClimaticConditionResp:
        {

          data_enq_climatic_condition = data_enq_receive as ClimaticConditionResp?;

        }break;

      case ImpactTypeResp:
        {

          data_enq_impact_type = data_enq_receive as ImpactTypeResp?;

        }break;

      case BrightnessConditionResp:
        {

          data_enq_brightness_condition = data_enq_receive as BrightnessConditionResp?;

        }break;

      case AccidentSeverityResp:
        {

          data_enq_accident_severity = data_enq_receive as AccidentSeverityResp?;

        }break;

      case BrandResp:
        {

          data_enq_brand = data_enq_receive as BrandResp?;

        }break;

      case VehicleTypeResp:
        {

          data_enq_vehicle_type = data_enq_receive as VehicleTypeResp?;

        }break;





      /*

              VehicleTypeResp? data_enq_vehicle_type;

              VehicleModelResp? data_enq_vehicleModel;

              SpecialFunctionResp? data_enq_specialFunction;

              VehicleActionResp? vehicleActionRespListSelect;

       */


    //-------- Collect data Accident Vehicule ----//

        default:
        {
          print("object*********************** Errorrrrr Data Receive in Provider Collecte Data enquette+++++++++++  Errorrrrr++++++++++++++");
        }



    }


    UpdateDataFormEnquete();

    data_new_enquette = {
      //"accidentReq": {
        "latitude": 4.915832801313164,
        "longitude": 9.140625000000002,
        "causes": [
          {"id": 2, "name": "Problème mécanique"},
          {"id": 4, "name": "Téléphone au volant"}
        ],

        "accidentType": data_enq_accident_type?.id ?? 1,
        "impactType": data_enq_impact_type?.id ?? 1,
        "climaticCondition": data_enq_climatic_condition?.id ?? 1,
        "brightnessCondition": data_enq_brightness_condition?.id ?? 1,
        "roadType": data_enq_road_type?.id ?? 1,
        "roadState": data_enq_road_state?.id ?? 2,
        "roadIntersection": data_enq_road_intersection?.id ?? 2,
        "block": data_enq_block?.id ?? 1,
        "roadTrafficControl":data_enq_control?.id ?? 2,
        "virage": data_enq_virage?.id ?? 2,
        "roadSlopSection": data_enq_slop_section?.id ?? 1,
        "accidentSeverity": data_enq_accident_severity?.id ?? 2,
        "accidentDate":GlobalMethod.convertirDateFrancais(date_accident_controller?.text),
        "city": data_enq_city?.id ?? 7,
        "municipality": data_enq_municipality?.id ?? 1 ,
        "place": "new MOB ${places_accident_controller?.text}",
        "roadCategory": data_enq_road_category?.id ?? 1,
        "accidentTime": time_accident_controller?.text ?? "11:14",
        "road": 0,
        "status": "OPENED",
        "vehicules": [],
        "persons": [],
        "crashImages": [],
        "id": 0
     // }
    };

    //--------- this is OK--------
/*
    data_new_enquette = {
      "accidentReq": {
        "latitude": 4.915832801313164,
        "longitude": 9.140625000000002,
        "causes": [
          {"id": 2, "name": "Problème mécanique"},
          {"id": 4, "name": "Téléphone au volant"}
        ],

        "accidentType": data_enq_accident_type?.code ?? 1,
        "impactType": data_enq_impact_type?.code ?? 1,
        "climaticCondition": data_enq_climatic_condition?.code ?? 1,
        "brightnessCondition": data_enq_brightness_condition?.code ?? 1,
        "roadType": data_enq_road_type?.code ?? 1,
        "roadState": data_enq_road_state?.id ?? 2,
        //"roadState": 1,
        "roadIntersection": data_enq_road_intersection?.code ?? 2,
        "block": data_enq_block?.code ?? 1,
        //"roadTrafficControl": 2,
        "roadTrafficControl":data_enq_control?.code ?? 2,
        "virage": data_enq_virage?.code ?? 2,
        //"roadSlopSection": 1,
        "roadSlopSection": data_enq_slop_section?.id ?? 1,
        "accidentSeverity": data_enq_accident_severity?.code ?? 2,
        "accidentDate":convertirDateFrancais(date_accident_controller?.text),
        "city": data_enq_city?.id ?? 7,
        "municipality": data_enq_municipality?.id ?? 1 ,
        "place": "MOB ${places_accident_controller?.text}",
        "roadCategory": data_enq_road_category?.code ?? 1,
        "accidentTime": time_accident_controller?.text ?? "11:14",
        "road": 0,
        "status": "OPENED",
        "vehicules": [],
        "persons": [],
        "crashImages": [],
        "id": 0
      }
    };
*/

    notifyListeners();
  }

/*
  String convertirDateFrancais(String? dateStr) {
    // Vérifier le format de la date d'entrée (optionnel)
    // ...

    // Convertir la chaîne de caractères en un objet DateTime
    if(dateStr == null || dateStr.isEmpty || dateStr == ""){
      dateStr = "2024-03-19";
      return "19/03/2024";
    }else{
      DateTime date = DateTime.parse(dateStr);

      // Formater la date selon le format français (jj/mm/aaaa)
      DateFormat formatter = DateFormat('dd/MM/yyyy');
      String formattedDate = formatter.format(date);

      return formattedDate;
    }

  }
*/


  resetDataForm(){
    data_enq_accident_type=null;
    data_enq_impact_type=null;
    data_enq_climatic_condition=null;



    data_enq_limite_vitesse = 0;

    data_enq_road_type=null;

    data_enq_road_state=null;

    data_enq_slop_section=null;

    data_enq_control=null;

    data_enq_road_category= null;

    data_enq_block= null;

    data_enq_road_intersection= null;

    data_enq_virage= null;


    data_enq_city=null;
    data_enq_municipality=null;
    data_enq_accident_type=null;
    data_enq_climatic_condition=null;
    data_enq_impact_type=null;
    data_enq_brightness_condition=null;
    data_enq_accident_severity=null;

    date_accident_controller = TextEditingController();


    time_accident_controller = TextEditingController();


    places_accident_controller = TextEditingController();

    notifyListeners();

  }




}