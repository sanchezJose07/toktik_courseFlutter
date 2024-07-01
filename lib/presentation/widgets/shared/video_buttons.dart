 import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/huma_format.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video
  });

   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         _CustomIconButton(iconData: Icons.favorite, value: video.likes, iconColor: Colors.red ),
         const SizedBox( height: 20,),
         _CustomIconButton(iconData: Icons.remove_red_eye_outlined, value: video.views ),
          const SizedBox( height: 20,),
          SpinPerfect(
              infinite: true,
              duration: const Duration( seconds: 5 ),
              child: const _CustomIconButton(iconData: Icons.play_circle_outline  , value: 0 )
           ),
       ],
     );
   }
 }

 
 class _CustomIconButton extends StatelessWidget {
  final int value;                    //VALORES DE INTERES PARA LOS BOTONES
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({         //CONSTRUCTOR DEL WIDGET
    required this.value,
    required this.iconData,
    iconColor
  }):color = iconColor ?? Colors.white;   //SE ESTABLECE UN COLOR POR DEFECTO EN CASO DE QUE NO SE ASIGNE NINGUNO
 
   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         IconButton(
             onPressed: () {},
             icon: Icon(iconData, color: color, size: 30 ),
         ),
         if(value > 0 )
           Text( HumaFormat.humanReadbleNumber(value.toDouble()) ),
       ],
     );
   }
 }
 