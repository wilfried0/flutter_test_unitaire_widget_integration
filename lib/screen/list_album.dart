import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/services/album_service.dart';

class ListAlbum extends StatelessWidget {
  const ListAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des albums"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Album>>(
          future: AlbumProvider.fetchListAlbum(),
          builder:(context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              leading: CircleAvatar(child: Text('${snapshot.data[index].id}')),
                              title: Text('${snapshot.data[index].title}'),
                              onTap: () => context.go('/albums/detail'),
                            ),
                          )),
                    );
                  }
              );
            }
          }
      ),
    );
  }
}
