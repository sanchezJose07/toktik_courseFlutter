import 'package:flutter/cupertino.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';
import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier{
  bool initialLoading = true;
  List<VideoPost> videos =[];

  Future<void> loadNextPage() async{
    await Future.delayed(const Duration(seconds: 2));   //GENERAMOS UN RETARDO DE 2 SEG

    final List<VideoPost> newVideos = videoPosts.map( //CREAMOS UNA LISTA CON LA ESTRUCTURA DE video_post.dart
        (video) => LocalVideoModel.fromJson(video).toVideoPostEntity() //MAPEAMOS LA LISTA DE LOS VIDEOS  DEL local_video_posts.dart
    ).toList(); //CONVERTIMOS A LISTA YA QUE EL MAPEO RETORNA UN ITERABLE

    videos.addAll(newVideos); //AGREGAMOS LA LISTA DE VIDEOS A NUESTRA LISTA DE VIDEO POST LLAMADA videos.
    initialLoading = false;  //BAJAMOS LA BANDERA, YA QUE SE HIZO LA CARGA DE INICIALIZACION
    notifyListeners();
  }
}