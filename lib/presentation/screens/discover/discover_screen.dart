import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';

import '../../widgets/shared/video_scrollabble_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>(); //PARA COMPROBAR SI SE HAN REALIZADO CAMBIOS

    return Scaffold(
      body: discoverProvider.initialLoading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2,),)
          : VideoScrollabbleView(videos: discoverProvider.videos )
    );
  }
}
