import 'dart:io';

class Utils {
  static List<File> imageList = [];
  static List<File> houseImage = [];
  static List<File> carImage = [];
  static List<File> image4wd = [];
  static List<File> caravanImage = [];
  static List<File> motorhomeImage = [];
  static List<File> boatImage = [];
  static List<File> motorCycleImage = [];
  static List<File> settings = [];

  static totalImages() {
    imageList = houseImage +
        carImage +
        image4wd +
        caravanImage +
        motorCycleImage +
        motorhomeImage +
        boatImage +
        settings;
    return imageList;
  }
}
