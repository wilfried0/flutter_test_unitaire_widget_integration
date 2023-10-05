import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/providers/album_find_all_provider.dart';
import 'package:test_app/providers/album_find_by_id_provider.dart';

class ListAlbum extends StatelessWidget {
  const ListAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des albums", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (ctx, ref, _) {
          final data = ref.watch(albumFindAllProvider);
          return data.when(
              data: (data) {
                List<Album> albums = data.map((e) => e).toList();
                return ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.black54,
                                    child: Text('${albums[index].id}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                title: Text('${albums[index].title}'),
                                onTap: () {
                                  ref.read(albumFindByIdProvider.notifier).findById(id: albums[index].id!);
                                  context.go('/albums/detail');
                                },
                              ),
                            )),
                      );
                    }
                );
              },
              error: (Object error, StackTrace stackTrace) => Center(child: Text(error.toString(), key: const Key('error')),),
              loading: () => const Center(child: CircularProgressIndicator(),)
          );
        }
      ),
    );
  }
}
