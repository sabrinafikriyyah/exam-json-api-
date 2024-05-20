import 'package:flutter/material.dart';
import 'package:exam_json/models/user.dart';
import 'package:exam_json/service/album.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Album> lastAlbum = [];
  bool isLoading = true;

  void fetchAlbum() async {
    final result = await AlbumService.fetchAlbum();
    lastAlbum = result;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Json & Rest Api'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: lastAlbum.length,
              itemBuilder: (context, index) {
                final album = lastAlbum[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(album.thumbnailUrl),
                    ),
                    title: Text('${album.id} ${album.title}'),
                    subtitle: Text(album.url),
                    trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              
                            },
                            icon: const Icon(Icons.edit),
                            color: Colors.green[600],
                          ),
                          IconButton(
                            onPressed: () {
                              
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ],
                      ),
                  ),
                );
              }),
    );
  }
}
