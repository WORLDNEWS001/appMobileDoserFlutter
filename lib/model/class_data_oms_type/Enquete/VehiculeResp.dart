//---- create class vehicule resp

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeImageResp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/brand_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/special_function_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_action_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_model_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_type_resp.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';

class VehiculeResp {


      int? id;
      int? vehicleAccidentNumber;
      String? plate;
      String? chassis;
      int? vehicleId;
      VehicleTypeResp? type;
      BrandResp? brand;
      VehicleModelResp? model;
      int? fabricationYear;
      int? cylinderCapacity;
      SpecialFunctionResp? specialFunction;
      VehicleActionResp? vehicleAction;
      List<VehiculeImageResp?>? vehicleImages;


  VehiculeResp({
         this.id,
         this.vehicleAccidentNumber,
         this.plate,
         this.chassis,
         this.vehicleId,
         this.type,
         this.brand,
         this.model,
         this.fabricationYear,
         this.cylinderCapacity,
         this.specialFunction,
         this.vehicleAction,
         this.vehicleImages,
  });


  //----------------- les 5 methode comme dans d'autre class ----------------
  
  //-- cerate Methode FromJson
  factory VehiculeResp.fromJson(Map<String, dynamic>? json) {
    return VehiculeResp(
      id: json?['id'],
      vehicleAccidentNumber: json?['vehicleAccidentNumber'],
      plate: json?['plate'],
      chassis: json?['chassis'],
      vehicleId: json?['vehicleId'],
      type: VehicleTypeResp.fromJson(json?['type']),
      brand: BrandResp.fromJson(json?['brand']),
      model: VehicleModelResp.fromJson(json?['model']),
      fabricationYear: json?['fabricationYear'],
      cylinderCapacity: json?['cylinderCapacity'],
      specialFunction: SpecialFunctionResp.fromJson(json?['specialFunction']),
      vehicleAction: VehicleActionResp.fromJson(json?['vehicleAction']),
      vehicleImages: json?['vehicleImages'],
    );
  }


  factory VehiculeResp.fromJsonRequest(Map<String, dynamic>? json, BuildContext context) {

    DataOmsSelectProvider StateProviderData = context.read<DataOmsSelectProvider>();

    return VehiculeResp(
      id: json?['id'],
      vehicleAccidentNumber: json?['vehicleAccidentNumber'],
      plate: json?['plate'],
      chassis: json?['chassis'],
      vehicleId: json?['vehicleId'],
      type: StateProviderData.getVehicleTypeRespById(json?['type'] ),
      brand: StateProviderData.getBrandRespById(json?['brand'] ?? null),
      model: StateProviderData.getVehicleModelRespById(json?['model']),
      fabricationYear: json?['fabricationYear'],
      cylinderCapacity: json?['cylinderCapacity'],
      specialFunction:  StateProviderData.getSpecialFunctionRespById(json?['specialFunction']),
      vehicleAction: StateProviderData.getVehicleActionRespById(json?['vehicleAction']) ,
      vehicleImages: (json?['vehicleImages'] as List<dynamic>?)?.map((item) => VehiculeImageResp.fromJson(item)).toList(),
    );
  }



  //--- methode to json ----
  Map<String, dynamic> toJson() => {
    'id': id,
    'vehicleAccidentNumber': vehicleAccidentNumber,
    'plate': plate,
    'chassis': chassis,
    'vehicleId': vehicleId,
    'type': type,
    'brand': brand,
    'model': model,
    'fabricationYear': fabricationYear,
    'cylinderCapacity': cylinderCapacity,
    'specialFunction': specialFunction,
    'vehicleAction': vehicleAction,
    'vehicleImages': vehicleImages,
  };

  //--- methode from string
  factory VehiculeResp.fromString(String jsonString) =>
      VehiculeResp.fromJson(json.decode(jsonString));

  //--- methode to string
  String toString() => json.encode(toJson());




}

