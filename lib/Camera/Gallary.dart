import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Camera/Dashboard.dart';
import 'package:flutter_application_1/Camera/Utils.dart';

class Gallary extends StatelessWidget {
  late List<File> imageList;
  Gallary({Key? key, required this.imageList}) : super(key: key);
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
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3.0 / 4.6,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Image.file(imageList[index]),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(imageList[index], index, imageList);
                  }));
                },
              );
            }),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  File imageUrl;
  late List<File> imageList;
  int index;
  DetailScreen(this.imageUrl, this.index, this.imageList, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          width: 100,
          height: 60,
        ),
        backgroundColor: Colors.grey[700],
        leading: IconButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Dashboard();
                })),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              child: Hero(
                  tag: 'imageHero',
                  child: Image.file(
                    imageUrl,
                    fit: BoxFit.fill,
                  )),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            color: Colors.grey[700],
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Back'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          imageList.removeAt(index);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Dashboard();
                          }));
                        },
                        child: const Text('Delete'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Album extends StatelessWidget {
  const Album({Key? key}) : super(key: key);

  // Widget albums(BuildContext context, String folder, List<File> imageList) {
  //   return imageList.isNotEmpty
  //       ? InkWell(
  //           child: Column(
  //             children: [
  //               Expanded(
  //                   child: Image.file(Utils.imageList[imageList.length - 1])),
  //               Text(
  //                 folder,
  //                 style: const TextStyle(color: Colors.white),
  //               )
  //             ],
  //           ),
  //           onTap: () => Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) => Gallary(
  //                 imageList: Utils.imageList,
  //               ),
  //             ),
  //           ),
  //         )
  //       : const SizedBox.shrink();
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  "Albums",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  color: Colors.grey,
                  padding: const EdgeInsets.all(10),
                  child: GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisSpacing: 8.0,
                    children: [
                      Utils.houseImage.isNotEmpty
                          ? InkWell(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.file(Utils.houseImage[
                                          Utils.houseImage.length - 1])),
                                  const Text(
                                    "house",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gallary(
                                    imageList: Utils.houseImage,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Utils.carImage.isNotEmpty
                          ? InkWell(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.file(Utils.carImage[
                                          Utils.carImage.length - 1])),
                                  const Text(
                                    "car",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gallary(
                                    imageList: Utils.carImage,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Utils.image4wd.isNotEmpty
                          ? InkWell(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.file(Utils.image4wd[
                                          Utils.image4wd.length - 1])),
                                  const Text(
                                    "4wd",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gallary(
                                    imageList: Utils.image4wd,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Utils.caravanImage.isNotEmpty
                          ? InkWell(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.file(Utils.caravanImage[
                                          Utils.caravanImage.length - 1])),
                                  const Text(
                                    "caravan",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gallary(
                                    imageList: Utils.caravanImage,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Utils.motorhomeImage.isNotEmpty
                          ? InkWell(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.file(Utils.motorhomeImage[
                                          Utils.motorhomeImage.length - 1])),
                                  const Text(
                                    "motorhome",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gallary(
                                    imageList: Utils.motorhomeImage,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Utils.boatImage.isNotEmpty
                          ? InkWell(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.file(Utils.boatImage[
                                          Utils.boatImage.length - 1])),
                                  const Text(
                                    "boat",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gallary(
                                    imageList: Utils.boatImage,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Utils.motorCycleImage.isNotEmpty
                          ? InkWell(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.file(Utils.motorCycleImage[
                                          Utils.motorCycleImage.length - 1])),
                                  const Text(
                                    "motorbike",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gallary(
                                    imageList: Utils.motorCycleImage,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Utils.settings.isNotEmpty
                          ? InkWell(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.file(Utils.settings[
                                          Utils.settings.length - 1])),
                                  const Text(
                                    "settings",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gallary(
                                    imageList: Utils.settings,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                      // albums(context, "house", Utils.houseImage),
                      // albums(context, "car", Utils.carImage),
                      // albums(context, "4wd", Utils.image4wd),
                      // albums(context, "caravan", Utils.caravanImage),
                      // albums(context, "motorhome", Utils.motorhomeImage),
                      // albums(context, "boat", Utils.boatImage),
                      // albums(context, "motorbike", Utils.motorCycleImage),
                      // albums(context, "settings", Utils.settings),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
