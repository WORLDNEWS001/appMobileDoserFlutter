import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secondtest/GlobalConstantData.dart';

class PickImageData {

  BuildContext? context;


  PickImageData({
    this.context,
    this.ListPathImages,
  })  {
    requestAllPermissionStorage();
    if(ListPathImages == null){
      ListPathImages = [];
    }else{
      convertStringPathToXfile(ListPathImages!);
    }
  }


  List<XFile>? imageXfile;
  ImagePicker imagePickerInstance= ImagePicker();
  File? fileImage;
  List<String>? ListPathImages;



  pickImageGallerie() async {
    final List<XFile>? selectedImages = await imagePickerInstance.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      imageXfile?.addAll(selectedImages);
      for (XFile image in selectedImages) {
        String pathImageCompress = await compressAndSavePathImage(image);
        ListPathImages?.add(pathImageCompress);
      }
    }
  }

  Future<List<String>?> pickImageCamera() async {
    final XFile? CaptureImage = await imagePickerInstance.pickImage(
        source: ImageSource.camera);
    if (CaptureImage != null) {
      imageXfile?.add(CaptureImage);
      String pathImageCompress = await compressAndSavePathImage(CaptureImage);
      ListPathImages?.add(pathImageCompress);
      return ListPathImages;
    }
  }





  Future<String> compressAndSavePathImage(XFile imageFile) async {


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
    String? PathSaveData = await CheckPathAndCreateIfNoExist("File_Image");

    print("\n  ++++++++++++++++++++++++ Le documentsPath de sauvegarde Image est de ===  ${PathSaveData}  ------------ \n");

    // Création du chemin d'enregistrement avec une extension png (ou jpg selon le format)
    String imagePath = '$PathSaveData/${DateTime.now().millisecondsSinceEpoch}.png';

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



  Future<String?> CheckPathAndCreateIfNoExist(String namePath) async {

    Directory? documentsDirectory =  await getExternalStorageDirectory();
    String fullPath = documentsDirectory!.path;
    String prefix = fullPath.substring(0, fullPath.indexOf('/Android/'));
    print("le prefixe sous android retrouver est de  ----> ${prefix}  <----");
    String PathSaveData = "${prefix}/${Constants.NamePathRacineProject}/${namePath}";

    // -- verifier si le chemin PathSaveData existe et cree si il n'existe pas
    if (!await Directory(PathSaveData).exists()) {
      await Directory(PathSaveData).create(recursive: true);
      print('Le dossier : $namePath :::  vient d etre cree ');
    } else {
      print('Le dossier ::  $namePath  :: existe déjà.');
    }

    return PathSaveData;

  }








  static Future<void> requestStoragePermission() async {

    // Vérifier si la permission est déjà accordée
    var status = await Permission.storage.status;

    //print('\n \n ----////---------- La permission de stockage est déjà accordée. ------////------- \n \n');

    if (status.isGranted) {

      // La permission est déjà accordée, vous pouvez effectuer des opérations de lecture/écriture ici
      //print('La permission de stockage est déjà accordée.');

      //var statusVerify = await Permission.storage.status;
      //print('\n \n Confirmation dans Page Chois Site La permission de stockage est déjà accordée  -->> $statusVerify. \n \n ');

    } else {

      // La permission n'est pas accordée, demandez-la à l'utilisateur
      var result = await Permission.storage.request();

      if (result.isGranted) {
        // L'utilisateur a accordé la permission
        //print('La permission de stockage a été accordée par l utilisateur.');
      } else {
        // L'utilisateur a refusé la permission
        //print('La permission de stockage a été refusée par l\'utilisateur.');
      }


    }
  }

  static Future<void> requestStoragePermissionExterne() async {

    // Vérifier si la permission est déjà accordée
    var status = await Permission.manageExternalStorage.status;

    if (status.isGranted) {
      // La permission est déjà accordée, vous pouvez effectuer des opérations de lecture/écriture ici
      //print('La permission de stockage  requestStoragePermissionExterne  est déjà accordée.');
      //var statusVerify = await Permission.manageExternalStorage.status;

    } else {

      // La permission n'est pas accordée, demandez-la à l'utilisateur
      var result = await Permission.manageExternalStorage.request();

      if (result.isGranted) {
        // L'utilisateur a accordé la permission
        // print('La permission de requestStoragePermissionExterne stockage a été accordée par l utilisateur.');
      } else {
        // L'utilisateur a refusé la permission
        //print('La permission requestStoragePermissionExterne de stockage a été refusée par l\'utilisateur.');
      }
    }
  }

  static Future<void> requestAllPermissionStorage() async {
    // Demander la permission de stockage interne
    await requestStoragePermission();
    // Demander la permission de stockage externe
    await requestStoragePermissionExterne();
    //print("Permission de stockage demander avec succès.;");
  }


  //---- methode to convert des string path to Xfile
 convertStringPathToXfile(List<String> listPath) async {
    List<XFile> listXfile = [];
    for (String path in listPath) {
      listXfile.add(XFile(path));
    }
    imageXfile =listXfile;
    //return listXfile;

  }





}