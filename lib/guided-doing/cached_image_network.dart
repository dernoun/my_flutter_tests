import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_tests/flavor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class CachedImage extends StatefulWidget {
  @override
  _CachedImageState createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('$flavor Cached Network Image'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CachedNetworkImage(
                //   imageUrl:
                //       'https://guido.ams3.digitaloceanspaces.com/plainies/0fJ3FBGjTL8wa2AS845d/images/KBGeg9KN5BL5Sfuv15Wb',
                //   fit: BoxFit.fill,
                //   placeholder: (context, _) =>
                //       const Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),
                // Image(
                //   image: CachedNetworkImageProvider(
                //       'https://guido.ams3.digitaloceanspaces.com/plainies/0fJ3FBGjTL8wa2AS845d/images/KBGeg9KN5BL5Sfuv15Wb'),
                // )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.umbrella_rounded),
          onPressed: () async {
            // Image _image = Image(
            //   image: CachedNetworkImageProvider(
            //       'https://guido.ams3.digitaloceanspaces.com/plainies/0fJ3FBGjTL8wa2AS845d/images/KBGeg9KN5BL5Sfuv15Wb'),
            // );

            final Directory temp = await getTemporaryDirectory();
            final File imageFile = File(
                '${temp.path}/libCachedImageData/a461d9e0-a9d0-11eb-9d12-f792be7165ed.jpg');
            print(await imageFile.exists());

            await for (var entity
                in temp.list(recursive: true, followLinks: false)) {
              print(entity.path);
            }

            if (await imageFile.exists()) {
              print('File Exists');
            }
            // else {
            // //   Image doesn't exist in cache
            //   await imageFile.create(recursive: true);
            // //   Download the image and write to above file
            // }
          },
        ),
      ),
    );
  }
}
// de986120-a99d-11eb-b7d2-5dcec628dceb.jpg
