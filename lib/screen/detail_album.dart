import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/album_find_by_id_provider.dart';

class DetailAlbum extends StatelessWidget {
  const DetailAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails de l'album", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Consumer(
          builder: (context, ref, _) {
            final info = ref.watch(albumFindByIdProvider);
            return info.isLoading ? const Center(child: CircularProgressIndicator()):
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Text('${info.album.id}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                  title: Text('${info.album.title}'),
                ),
              );
          }
        ),
      ),
    );
  }
}
