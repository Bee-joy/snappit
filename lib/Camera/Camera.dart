import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Camera/Gallary.dart';
import 'package:flutter_application_1/Camera/Utils.dart';

class Camera extends StatefulWidget {
  CameraDescription firstCamera;
  String folder;
  Camera({Key? key, required this.firstCamera, required this.folder})
      : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  setImage(String folder, File image) {
    switch (folder) {
      case 'house':
        Utils.houseImage.add(image);
        break;
      case 'car':
        Utils.carImage.add(image);
        break;
      case '4wd':
        Utils.image4wd.add(image);
        break;
      case 'caravan':
        Utils.caravanImage.add(image);
        break;
      case 'motorhome':
        Utils.motorhomeImage.add(image);
        break;
      case 'boat':
        Utils.boatImage.add(image);
        break;
      case 'settings':
        Utils.settings.add(image);
        break;
      case 'motorbike':
        Utils.motorCycleImage.add(image);
        break;
    }
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _controller = CameraController(
      widget.firstCamera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: Image.asset(
          'assets/images/logo.png',
          width: 100,
          height: 60,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        color: Colors.grey[400],
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.grey[400],
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(
                      child: Align(
                        child: Text(
                          "Frame your item int the window above. When you're happy, tap the image (or the button below) to take a photo.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                width: 350,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RawMaterialButton(
                                        onPressed: () async {
                                          try {
                                            await _initializeControllerFuture;
                                            final image =
                                                await _controller.takePicture();
                                            final imageTemporary =
                                                File(image.path);
                                            setState(() {
                                              setImage(widget.folder,
                                                  imageTemporary);
                                            });
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        child: const Icon(Icons.camera_alt),
                                        shape: const CircleBorder(),
                                        fillColor: Colors.black12,
                                      ),
                                      const Text("Take a photo")
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffefab42),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // <-- Radius
                                    ),
                                  ),
                                ),
                              ),
                            )

                            // FloatingActionButton(
                            //   onPressed: () async {
                            //     Navigator.of(context).push(
                            //       MaterialPageRoute(
                            //           builder: (context) => const Album()),
                            //     );
                            //   },
                            //   child: Utils.totalImages().isEmpty
                            //       ? const Icon(Icons.image)
                            //       : CircleAvatar(
                            //           radius: 30,
                            //           backgroundColor: const Color(0xff476cfb),
                            //           child: ClipOval(
                            //             child: SizedBox(
                            //                 width: 60.0,
                            //                 height: 70.0,
                            //                 child: Image.file(
                            //                   Utils.imageList[
                            //                       Utils.totalImages().length - 1],
                            //                   fit: BoxFit.fill,
                            //                 )),
                            //           ),
                            //         ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                width: 350,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => const Album()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RawMaterialButton(
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Album()),
                                          );
                                        },
                                        child: Utils.totalImages().isEmpty
                                            ? const Icon(Icons.image)
                                            : CircleAvatar(
                                                radius: 18,
                                                backgroundColor:
                                                    const Color(0xff476cfb),
                                                child: ClipOval(
                                                  child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: Image.file(
                                                        Utils.imageList[
                                                            Utils.totalImages()
                                                                    .length -
                                                                1],
                                                        fit: BoxFit.fill,
                                                      )),
                                                ),
                                              ),
                                        shape: const CircleBorder(),
                                        fillColor: Colors.black12,
                                      ),
                                      const Text("View images")
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffefab42),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // <-- Radius
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
