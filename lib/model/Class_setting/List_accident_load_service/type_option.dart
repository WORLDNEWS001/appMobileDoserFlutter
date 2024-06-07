import 'package:flutter/material.dart';

enum TypeOption {
  consulter,
  modifier,
  ajouter_croquis,
  creation_pv,
  teminer_pv,
  generer_pv,
  generer_rapport;


  Icon getIconOption(){
    switch (this){
      case TypeOption.consulter: return const Icon(Icons.remove_red_eye, color: Colors.blueAccent,);
      case TypeOption.modifier: return const Icon(Icons.edit, color: Colors.blueAccent,);
      case TypeOption.ajouter_croquis : return const Icon(Icons.draw_outlined, color: Colors.blueAccent,);
      case TypeOption.teminer_pv : return const Icon(Icons.folder_copy_rounded, color: Colors.blueAccent,);
      case TypeOption.creation_pv : return const Icon(Icons.lock_outline, color: Colors.blueAccent,);
      case TypeOption.generer_pv : return const Icon(Icons.print, color: Colors.blueAccent,);
      case TypeOption.generer_rapport : return const Icon(Icons.print, color: Colors.blueAccent,);

    }
  }

}