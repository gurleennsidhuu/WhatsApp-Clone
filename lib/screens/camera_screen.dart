import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/main.dart';
import 'package:whatsapp/screens/displayTakenPicture.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool flash = false;
  @override
  initState() {
    super.initState();
  }

  Widget _buildGalleryBar() {
    final barHeight = 90.0;
    final vertPadding = 10.0;
    return Container(
        height: barHeight, // <-- Parent container with height limit
        child: ListView.builder(
            // <-- Gallery bar which will scroll horizontally
            padding: EdgeInsets.symmetric(vertical: vertPadding),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int _) {
              return Container(
                  // <-- Each Image
                  padding: EdgeInsets.only(right: 5.0),
                  width: 70.0,
                  height: barHeight - vertPadding * 2,
                  child: Image(
                    image: AssetImage("images/default_dp.png"),
                    fit: BoxFit.cover,
                  ));
            }));
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
