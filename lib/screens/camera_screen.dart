import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/main.dart';
import 'package:whatsapp/screens/displayTakenPicture.dart';
import 'package:images_picker/images_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_gallery/photo_gallery.dart';

List<Medium> allMedia = [];

class Images extends StateNotifier<AsyncValue<List<Media>>> {
  Images() : super(AsyncLoading());
  Future<void> getImage() async {
    state = AsyncLoading();
    List<Album>? _albums = await PhotoGallery.listAlbums(
      mediumType: MediumType.image,
    );
    for (int i = 0; i < _albums.length; i++) {
      MediaPage imagePage = await _albums[i].listMedia(
        newest: false,
        skip: 5,
        take: 10,
      );
      allMedia = [
        ...imagePage.items,
        //...videoPage.items,
      ];
    }
  }
}

final imageDataNotifier =
    StateNotifierProvider<Images, AsyncValue<List<Media>>>((ref) {
  return Images();
});

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool flash = false;
  @override
  initState() {
    Future.wait([context.read(imageDataNotifier.notifier).getImage()]);
    super.initState();
  }

  Widget _buildGalleryBar() {
    final barHeight = 90.0;
    final vertPadding = 10.0;
    return Consumer(builder: (context, watch, child) {
      final userData = watch(imageDataNotifier);
      return Container(
          height: barHeight,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: vertPadding),
              scrollDirection: Axis.horizontal,
              itemCount: allMedia.length,
              itemBuilder: (BuildContext context, int x) {
                return Container(
                  padding: EdgeInsets.only(right: 5.0),
                  width: 70.0,
                  height: barHeight - vertPadding * 2,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('images/default_dp.png'),
                    image: PhotoProvider(
                      mediumId: allMedia[x].id,
                    ),
                  ),
                );
              }));
    });
  }

  _buildControlBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.flash_auto),
          onPressed: () {
            if (flash) {
              cameraController.setFlashMode(FlashMode.off);
              flash = false;
            } else {
              cameraController.setFlashMode(FlashMode.always);
              flash = true;
            }
          },
        ),
        GestureDetector(
          onTap: () async {
            final image = await cameraController.takePicture();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DisplayPictureScreen(imagePath: image.path),
              ),
            );
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
            ),
          ),
        ),
        IconButton(
          // <-- Switch camera
          color: Colors.white,
          icon: Icon(Icons.switch_camera),
          onPressed: () {
            _toggleCameraLens();
          },
        ),
      ],
    );
  }

  void _toggleCameraLens() {
    // get current lens direction (front / rear)
    final lensDirection = cameraController.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = cameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = cameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }

    if (newDescription != null) {
      initCameraController(newDescription);
    } else {
      print('Asked camera not available');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: [
        MaterialApp(
          home: CameraPreview(cameraController),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          _buildGalleryBar(),
          _buildControlBar(),
          //_buildTapForPhotoText(),
        ]),
      ],
    );
  }
}
