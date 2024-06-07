
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Images.dart';
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
import 'package:secondtest/model/class_data_oms_type/Route/road_type_resp.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';

class PersonResp {
  int? id;
  String? firstName;
  String? lastName;
  String? cni;
  String? telephone;
  int? personAccidentNumber;
  int? vehicleAccidentNumber;
  int? vehicleLinkedPedestrian;
  String? birthDate;
  GenderResp? gender;
  RoadTypeResp? roadType;
  SeatingRangeResp? range;
  SeatingPlaceResp? place;
  TraumaSeverityResp? traumaSeverity;
  WearingHelmetResp? wearingHelmet;
  OccupantRestraintSystemResp? occupantRestraintSystem;
  ActionResp? personAction;
  AlcoholConsumptionResp? alcoholConsumption;
  AlcoholTestStatusResp? testStatus;
  AlcoholTestTypeResp? testType;
  AlcoholTestResultResp? testResult;
  PersonDrugUseResp? drugUse;
  String? drivingLicenceYear;
  int? care;
  int? personId;
  List<Images?>? images;
  ProfessionResp? profession;
  String? nopermis;
  int? typepermis;
  String? dateCreate;
  String? StatusRequest;
  int? vgt_id;
  int? originalIndex;
  String? types;

  PersonResp({
    this.id,
    this.firstName,
    this.lastName,
    this.cni,
    this.telephone,
    this.personAccidentNumber,
    this.vehicleAccidentNumber,
    this.vehicleLinkedPedestrian,
    this.birthDate,
    this.gender,
    this.roadType,
    this.range,
    this.place,
    this.traumaSeverity,
    this.wearingHelmet,
    this.occupantRestraintSystem,
    this.personAction,
    this.alcoholConsumption,
    this.testStatus,
    this.testType,
    this.testResult,
    this.drugUse,
    this.drivingLicenceYear,
    this.care,
    this.personId,
    this.images,
    this.profession,
    this.nopermis,
    this.typepermis,
    this.dateCreate,
    this.StatusRequest,
    this.vgt_id,
    this.originalIndex,
    this.types,
  });

factory PersonResp.fromJson(Map<String, dynamic>? json) {
  return PersonResp(
    id: json?['id'],
    firstName: json?['firstName'],
    lastName: json?['lastName'],
    cni: json?['cni'],
    telephone: json?['telephone'],
    personAccidentNumber: json?['personAccidentNumber'],
      vehicleAccidentNumber: json?['vehicleAccidentNumber'],
      vehicleLinkedPedestrian: json?['vehicleLinkedPedestrian'],
      birthDate: json?['birthDate'],
      gender: GenderResp.fromJson(json?['gender']),
      roadType: RoadTypeResp.fromJson(json?['roadType']),
      range: SeatingRangeResp.fromJson(json?['range']),
      place: SeatingPlaceResp.fromJson(json?['place']),
      traumaSeverity: TraumaSeverityResp.fromJson(json?['traumaSeverity']),
      wearingHelmet: WearingHelmetResp.fromJson(json?['wearingHelmet']),
      occupantRestraintSystem: OccupantRestraintSystemResp.fromJson(
          json?['occupantRestraintSystem']),
      personAction: ActionResp.fromJson(json?['personAction']),
      alcoholConsumption:
          AlcoholConsumptionResp.fromJson(json?['alcoholConsumption']),
      testStatus: AlcoholTestStatusResp.fromJson(json?['testStatus']),
      testType: AlcoholTestTypeResp.fromJson(json?['testType']),
      testResult: AlcoholTestResultResp.fromJson(json?['testResult']),
      drugUse: PersonDrugUseResp.fromJson(json?['drugUse']),
      drivingLicenceYear: json?['drivingLicenceYear'],
      care: json?['care'],
      personId: json?['personId'],
      images: (json?['images'] as List).map((i) => Images.fromJson(i)).toList(),
      profession: ProfessionResp.fromJson(json?['profession']),
      nopermis: json?['nopermis'],
    typepermis: json?['typepermis'],
    dateCreate: json?['dateCreate'],
    StatusRequest: json?['StatusRequest'],
    vgt_id: json?['vgt_id'],
    originalIndex: json?['originalIndex'],
    types: json?['types'],

  );
}



  factory PersonResp.fromJsonRequest(Map<String, dynamic>? json, BuildContext context) {
    DataOmsSelectProvider StateProviderData = context.read<DataOmsSelectProvider>();

    return PersonResp(
      id: json?['id'],
      firstName: json?['firstName'],
      lastName: json?['lastName'],
      cni: json?['cni'],
      telephone: json?['telephone'],
      personAccidentNumber: json?['personAccidentNumber'],
      vehicleAccidentNumber: json?['vehicleAccidentNumber'],
      vehicleLinkedPedestrian: json?['vehicleLinkedPedestrian'],
      birthDate: json?['birthDate'],
      gender: StateProviderData.getGenderRespById(json?['gender']),
      roadType: StateProviderData.getRoadTypeRespById(json?['roadType']),
      range: StateProviderData.getSeatingRangeRespById(json?['range']),
      place: StateProviderData.getSeatingPlaceRespById(json?['place']),
      traumaSeverity:
          StateProviderData.getTraumaSeverityRespById(json?['traumaSeverity']),
      wearingHelmet:
          StateProviderData.getWearingHelmetRespById(json?['wearingHelmet']),
      occupantRestraintSystem:
          StateProviderData.getOccupantRestraintSystemRespById(
              json?['occupantRestraintSystem']),
      personAction: StateProviderData.getActionRespById(json?['personAction']),
      alcoholConsumption: StateProviderData.getAlcoholConsumptionRespById(
          json?['alcoholConsumption']),
      testStatus:
          StateProviderData.getAlcoholTestStatusRespById(json?['testStatus']),
      testType: StateProviderData.getAlcoholTestTypeRespById(json?['testType']),
      testResult:
          StateProviderData.getAlcoholTestResultRespById(json?['testResult']),
      drugUse: StateProviderData.getPersonDrugUseRespById(json?['drugUse']),
      drivingLicenceYear: json?['drivingLicenceYear'],
      care: json?['care'],
      personId: json?['personId'],
      images: (json?['images'] as List<dynamic>?)
          ?.map((item) => Images.fromJson(item as Map<String, dynamic>))
          .toList(),
      profession: StateProviderData.getProfessionRespById(json?['profession']),
      nopermis: json?['nopermis'],
      typepermis: json?['typepermis'],
      dateCreate: json?['dateCreate'],
      StatusRequest: json?['StatusRequest'],
      vgt_id: json?['vgt_id'],
      originalIndex: json?['originalIndex'],
      types: json?['types'],

    );
  }



Map<String, dynamic> toJson() {
  return {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'cni': cni,
    'telephone': telephone,
    'personAccidentNumber': personAccidentNumber,
    'vehicleAccidentNumber': vehicleAccidentNumber,
    'vehicleLinkedPedestrian': vehicleLinkedPedestrian,
    'birthDate': birthDate,
    'gender': gender?.toJson(),
    'roadType': roadType?.toJson(),
    'range': range?.toJson(),
    'place': place?.toJson(),
    'traumaSeverity': traumaSeverity?.toJson(),
    'wearingHelmet': wearingHelmet?.toJson(),
    'occupantRestraintSystem': occupantRestraintSystem?.toJson(),
    'personAction': personAction,
    'alcoholConsumption': alcoholConsumption?.toJson(),
    'testStatus': testStatus?.toJson(),
    'testType': testType?.toJson(),
    'testResult': testResult?.toJson(),
    'drugUse': drugUse?.toJson(),
    'drivingLicenceYear': drivingLicenceYear,
    'care': care,
    'personId': personId,
    'images': images?.map((i) => i?.toJson()).toList(),
    'profession': profession?.toJson(),
    'nopermis': nopermis,
    'typepermis': typepermis,
    'dateCreate': dateCreate,
    'StatusRequest': StatusRequest,
    'vgt_id': vgt_id,
    'originalIndex': originalIndex,
    'types': types,
  };
}



  factory PersonResp.fromString(String data) {
    return PersonResp.fromJson(json.decode(data));
  }


  String toString() {
    return json.encode(this.toJson());
  }



      //------
    PersonResp copyWith({
      int? id,
      String? firstName,
      String? lastName,
      String? cni,
      String? telephone,
      int? personAccidentNumber,
    int? vehicleAccidentNumber,
    int? vehicleLinkedPedestrian,
    String? birthDate,
    GenderResp? gender,
    RoadTypeResp? roadType,
    SeatingRangeResp? range,
    SeatingPlaceResp? place,
    TraumaSeverityResp? traumaSeverity,
    WearingHelmetResp? wearingHelmet,
    OccupantRestraintSystemResp? occupantRestraintSystem,
    ActionResp? personAction,
    AlcoholConsumptionResp? alcoholConsumption,
    AlcoholTestStatusResp? testStatus,
    AlcoholTestTypeResp? testType,
    AlcoholTestResultResp? testResult,
    PersonDrugUseResp? drugUse,
    String? drivingLicenceYear,
    int? care,
    int? personId,
    List<Images>? images,
    ProfessionResp? profession,
    String? nopermis,
    int? typepermis,
    String? dateCreate,
    String? StatusRequest,
    int? vgt_id,
    int? originalIndex,
    String? types,
  }) {
      return PersonResp(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        cni: cni ?? this.cni,
        telephone: telephone ?? this.telephone,
        personAccidentNumber: personAccidentNumber ?? this.personAccidentNumber,
        vehicleAccidentNumber: vehicleAccidentNumber ?? this.vehicleAccidentNumber,
        vehicleLinkedPedestrian: vehicleLinkedPedestrian ?? this.vehicleLinkedPedestrian,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        roadType: roadType ?? this.roadType,
        range: range ?? this.range,
        place: place ?? this.place,
        traumaSeverity: traumaSeverity ?? this.traumaSeverity,
        wearingHelmet: wearingHelmet ?? this.wearingHelmet,
        occupantRestraintSystem: occupantRestraintSystem ?? this.occupantRestraintSystem,
        personAction: personAction ?? this.personAction,
        alcoholConsumption: alcoholConsumption ?? this.alcoholConsumption,
        testStatus: testStatus ?? this.testStatus,
        testType: testType ?? this.testType,
        testResult: testResult ?? this.testResult,
        drugUse: drugUse ?? this.drugUse,
        drivingLicenceYear: drivingLicenceYear ?? this.drivingLicenceYear,
        care: care ?? this.care,
        personId: personId ?? this.personId,
        images: images ?? this.images,
        profession: profession ?? this.profession,
        nopermis: nopermis ?? this.nopermis,
        typepermis: typepermis ?? this.typepermis,
        dateCreate: dateCreate ?? this.dateCreate,
        StatusRequest: StatusRequest ?? this.StatusRequest,
        vgt_id: vgt_id ?? this.vgt_id,
        originalIndex: originalIndex ?? this.originalIndex,
        types: types ?? this.types,
      );
    }


}



