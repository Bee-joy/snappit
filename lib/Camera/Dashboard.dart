import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Camera/Camera.dart';

class Dashboard extends StatelessWidget {
  late CameraDescription firstCamera;
  getCamera() async {
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    getCamera();
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
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.grey,
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[800],
                                child: Image.asset("assets/images/home.png")),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Camera(
                                    firstCamera: firstCamera,
                                    folder: 'house',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[800],
                                child: Image.asset("assets/images/car.png")),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Camera(
                                    firstCamera: firstCamera,
                                    folder: 'car',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[800],
                                child: Image.asset("assets/images/4wd.png")),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Camera(
                                    firstCamera: firstCamera,
                                    folder: '4wd',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[800],
                                child:
                                    Image.asset("assets/images/caravan.png")),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Camera(
                                    firstCamera: firstCamera,
                                    folder: 'caravan',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[800],
                                child:
                                    Image.asset("assets/images/motorhome.png")),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Camera(
                                    firstCamera: firstCamera,
                                    folder: 'motorhome',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[800],
                                child: Image.asset("assets/images/boat.png")),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Camera(
                                    firstCamera: firstCamera,
                                    folder: 'boat',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[800],
                                child:
                                    Image.asset("assets/images/motorbike.png")),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Camera(
                                    firstCamera: firstCamera,
                                    folder: 'motorbike',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[800],
                                child:
                                    Image.asset("assets/images/settings.png")),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Camera(
                                    firstCamera: firstCamera,
                                    folder: 'settings',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
