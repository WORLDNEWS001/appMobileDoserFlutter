
import 'package:flutter/material.dart';
import 'package:secondtest/authentificator/requestAPI.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/model/Class_setting/List_accident_load_service/Option_accident.dart';
import 'package:secondtest/model/Class_setting/List_accident_load_service/type_option.dart';


class TypeOptionProvider with ChangeNotifier {

  //-------------------- Requette Obtention de la liste des Accident de la circulation-----



    //-------------------- Prise de decision sur les Option de la liste d'accident a Deactiver et a activer  ---------
    bool DecisionEnableOption(
        {required String statusAccident, required TypeOption typeOption}) {
      switch (statusAccident) {
        case "ACCEPTED":
          switch (typeOption) {
            case TypeOption.consulter:
              return true;
              break;
            case TypeOption.generer_rapport:
              return true;
              break;
            case TypeOption.generer_pv:
              return true;
              break;
            default:
              return false;
          }

        case "REJECTED":
          switch (typeOption) {
            case TypeOption.consulter:
              return true;
              break;
            case TypeOption.modifier:
              return true;
              break;
            case TypeOption.ajouter_croquis:
              return true;
              break;
            case TypeOption.creation_pv:
              return true;
              break;
            case TypeOption.teminer_pv:
              return true;
              break;
            default:
              return false;
          }
        case "OPENED":
          switch (typeOption) {
            case TypeOption.consulter:
              return true;
              break;
            case TypeOption.modifier:
              return true;
              break;
            case TypeOption.ajouter_croquis:
              return true;
              break;
            case TypeOption.creation_pv:
              return true;
              break;
            case TypeOption.teminer_pv:
              return true;
              break;
            default:
              return false;
          }
        case "READY":
          switch (typeOption) {
            case TypeOption.consulter:
              return true;
              break;
            default:
              return false;
          }
          break;
        default:
          return false;
      }
    }


    List<OptionAccident> listOptionAccident = [
      OptionAccident(id: 1,
          textDisplay: "Consulté",
          typeOption: TypeOption.consulter),
      OptionAccident(id: 2,
          textDisplay: "Modifier",
          typeOption: TypeOption.modifier),
      OptionAccident(id: 3,
          textDisplay: "Ajouté un Croquis",
          typeOption: TypeOption.ajouter_croquis),
      OptionAccident(id: 4,
          textDisplay: "Constituer le PV",
          typeOption: TypeOption.creation_pv),
      OptionAccident(id: 5,
          textDisplay: "Terminer le PV",
          typeOption: TypeOption.teminer_pv),
      OptionAccident(id: 6,
          textDisplay: "Generer le PV",
          typeOption: TypeOption.generer_pv),
      OptionAccident(id: 7,
          textDisplay: "Generer le Rapport",
          typeOption: TypeOption.generer_rapport),
    ];


    executeOption({required TypeOption typeOption, required int idAccident}) {
      switch (typeOption) {
        case TypeOption.consulter:
          {
            print(
                "********** Consultation  de l'accident id == ${idAccident}**************");
          }
          break;
        case TypeOption.modifier:
          {
            print(
                "********* Modification de l'accident id == ${idAccident}**************");
          }
          break;
        case TypeOption.ajouter_croquis:
          {
            print(
                "********* ajouter_croquis de l'accident id == ${idAccident}**************");
          }
          break;
        case TypeOption.creation_pv:
          {
            print(
                "********* creation_pv de l'accident id == ${idAccident}**************");
          }
          break;
        case TypeOption.teminer_pv:
          {
            print(
                "********* terminer_pv de l'accident id == ${idAccident}**************");
          }
          break;
        case TypeOption.generer_pv:
          {
            print(
                "********* generer_pv de l'accident id == ${idAccident}**************");
          }
          break;
        case TypeOption.generer_rapport:
          {
            print(
                "********* generer_rapport de l'accident id == ${idAccident}**************");
          }
          break;
        default:
          print("********* Errorrr This option is no Exist **************");
      }
    }


    //------------ Generation Liste Option One Accident ---------------------
    List<PopupMenuItem<OptionAccident>> generateurOptionAccident(
        {required int idAccident, required String statusAccident}) {
      //List<OptionAccident> listOptionAccidentWatch = context.watch<TypeOptionProvider>().listOptionAccident;
      List<OptionAccident> listOptionAccidentWatch = listOptionAccident;

      print("***************-------  Je suis dans generateurOptionAccident j'imprime le id de l'accident ${idAccident} et son Statut est de ${statusAccident} ");

      List<PopupMenuItem<OptionAccident>> popUpOptionAccident = listOptionAccidentWatch.where((optionAccident) => (DecisionEnableOption(statusAccident: statusAccident, typeOption: optionAccident.typeOption))).map((OptionAccident optionAccident) {
        return PopupMenuItem<OptionAccident>(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(optionAccident.textDisplay,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                optionAccident.typeOption.getIconOption(),
              ],
            ),
            value: optionAccident,
            enabled: DecisionEnableOption(statusAccident: statusAccident, typeOption: optionAccident.typeOption)
        );
      }
      ).toList();
      print(
          "********** DEBUG ------ Je suis dans generateur Option Accident------");
      return popUpOptionAccident;
    }
//**************** End
  }
