

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';

class GlobalMethod{


  Future<String> compressAndSaveImage_Path_method(XFile imageFile) async {


    // Récupération du poids de l'image avant la compression
    File originalImageFile = File(imageFile.path);
    double originalSizeInBytes = originalImageFile.lengthSync() / (1024 * 1024); // Convertir en Mo
    print("\n  ------------------ Taille de l'image avant la compression : ===  $originalSizeInBytes Mo  ------------------ \n");



    // Compression de l'image
    List<int> compressedBytes = await FlutterImageCompress.compressWithList(
      await imageFile.readAsBytes(),
      //minHeight: 1920, // La hauteur maximale de l'image compressée
      //minWidth: 1080, // La largeur maximale de l'image compressée
      minHeight: 1280, // La hauteur maximale de l'image compressée
      minWidth: 720, // La largeur maximale de l'image compressée
      quality: 20, // La qualité de compression (0 - 100)
      format: CompressFormat.png, // Le format de compression (jpeg ou png)
      //autoCorrectionAngle: true, // Corriger l'angle de rotation de l'image
      //rotate: 0, // Appliquer une rotation arbitraire à l'image
      keepExif: true,
      //includeExif: , // Conserver les données EXIF de l'image
    );

    // Récupération du répertoire de documents
    Directory? documentsDirectory = await getExternalStorageDirectory();
    // Obtenez le chemin complet
    String fullPath = documentsDirectory!.path;
    // Obtenez le préfixe souhaité
    String prefix = fullPath.substring(0, fullPath.indexOf('/Android/'));
    print("le prefixe sous android retrouver est de  ----> ${prefix}  <----");
    String PathSaveData2 = "${prefix}/secondtest/Files/imageAsset";

    //String documentsPath = PathSaveData2;
    String documentsPath = fullPath;

    print("\n  ++++++++++++++++++++++++ Le documentsPath de sauvegarde Image est de ===  ${documentsPath}  ------------ \n");

    // Création du chemin d'enregistrement avec une extension png (ou jpg selon le format)
    String imagePath = '$documentsPath/${DateTime.now().millisecondsSinceEpoch}.png';

    // Sauvegarde de l'image compressée
    await File(imagePath).writeAsBytes(compressedBytes);

    print("\n  ++++++++++++++++++++++++ Le CHEMIN COMPLET DE  Image est de ===  ${imagePath}  ------------ \n");


    // Récupération du poids de l'image après la compression
    double compressedSizeInBytes = File(imagePath).lengthSync() / (1024 * 1024); // Convertir en Mo
    print("\n  ------------------ Taille de l'image après la compression : $compressedSizeInBytes Mo  ------------------ \n");


    if(imagePath != null ){
      return imagePath;
    }else{
      return "";
    }


  }





   Future<List<String>> pickPhotoProfilMulti_Path_method2NoThread(BuildContext context, ImageSource source) async {

    List<XFile> ListfileImageProfil = [];
    ImagePicker pickPictureProfil_Multi = ImagePicker();
    File? fileImageProfil;
    List<String> ListPathImage = [];

    if (ListfileImageProfil.length <= 3) {
      if (source == ImageSource.gallery) {
        final List<XFile>? selectedImages = await pickPictureProfil_Multi.pickMultiImage();
        if (selectedImages != null && selectedImages.isNotEmpty) {
          ListfileImageProfil.addAll(selectedImages);
        }
      } else if (source == ImageSource.camera) {
        final XFile? CaptureImage = await ImagePicker().pickImage(
            source: source);
        if (CaptureImage != null) {
          ListfileImageProfil.add(CaptureImage);
        }
      }

      MyDialogLoader.showLoadingDialog(context, "Changement de l'Image");

      for (var elementOneImage in ListfileImageProfil) {
        fileImageProfil = File(elementOneImage.path);

        if (fileImageProfil != null) {
          String? PathName_ImageSave_String = await GlobalMethod().compressAndSaveImage_Path_method(elementOneImage);
          print("\n  ------------------ Data PathName_ImageSave  After Save And Compress is -->>>  ${PathName_ImageSave_String}  <<<---  \n");

          ListPathImage.add(PathName_ImageSave_String);
          // print("\n+++++++++++++++ Le Nombre de Images Base 64 dans le Live Stream Data est de ${ListBase64Image.length}   ----------\n");
          //context.read<ProviderColleteDataEnquete>().DataImagebaseConvert = PathName_ImageSave_String;
          //context.read<ProviderColleteDataEnquete>().urlImageReturn = "";
        } else {
          print(" \n  \n +++++++++ L'image est nulle ou non définie. \n  \n  ");
        }
      }

      MyDialogLoader.hideLoadingDialog(context);

      /*
      if (ListfileImageProfil.length > 2) {
        context.read<ProviderDataAsset>().UpdateListImageBase64Save(ListBase64Image);
        print("+++++++ DEUXIEME ---- >> ++++++++ Le Nombre de Images Base 64 dans le Live Stream Data est de ${context.read<ProviderDataAsset>().DataListImagebase64Convert?.length}");
      }

      } else {
        MyAlertDialogCust(
          message: "Désolé, vous avez dépassé le nombre d'images à enregistrer. Vous pouvez supprimer des images et recommencer à prendre de nouvelles images.\n Nous Considerons juste les 3 premières images. \n Si vous rajoutez encore des images, les images vont êtres supprimer.",
        ).show(context);
      }
       */

    }
    return ListPathImage;
  }


  static String convertirDateFrancais(String? dateStr) {
    // Vérifier le format de la date d'entrée (optionnel)
    // ...

    // Convertir la chaîne de caractères en un objet DateTime
    if(dateStr == null || dateStr.isEmpty || dateStr == ""){
      dateStr = "2024-03-19";
      return "19/03/2024";
    }else{

    //-- verifir si la date est de la forme dd/mm/yyyy
    if(dateStr != null && dateStr.contains("/")){
      return dateStr;
    }else{

        DateTime date = DateTime.parse(dateStr);

        // Formater la date selon le format français (jj/mm/aaaa)
        DateFormat formatter = DateFormat('dd/MM/yyyy');
        String formattedDate = formatter.format(date);

        return formattedDate;
      }
    }



  }








}