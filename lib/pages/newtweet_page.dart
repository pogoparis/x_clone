import 'dart:io';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class NewTweetPage extends StatefulWidget {
  const NewTweetPage({super.key});

  @override
  State<NewTweetPage> createState() => _NewTweetPageState();
}

class _NewTweetPageState extends State<NewTweetPage> {
  File? fileImage;
  bool showMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Nouveau Tweet')),
        body: Column(children: [
          TextFormField(
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
                hintText: "Quest ce qui se passe ?",
                labelText: "Nouveau Tweet"),
          ),
          fileImage != null
              ? Image.file(
                  fileImage!,
                  height: 100,
                )
              : Container(),
          Row(children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    showMap = !showMap;
                  });
                },
                icon: const Icon(Icons.map)),
            IconButton(
                onPressed: () async {
                  FilePickerResult? fp =
                      await FilePicker.platform.pickFiles(type: FileType.media);
                  setState(() {
                    fileImage = fp?.files[0].path != null
                        ? File(fp!.files[0].path!)
                        : null;
                  });
                },
                icon: const Icon(Icons.image)),
            const Spacer(),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Hero(tag: "edit", child: Icon(Icons.edit)),
                label: const Text("Post"))
          ]),
          showMap
              ? Flexible(
                  child: FlutterMap(
                      options: MapOptions(
                          center: const LatLng(47.227138, -1.6395439),
                          zoom: 15.2
                      ),
                      children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                    ]))
              : Container()
        ]));
  }
}
