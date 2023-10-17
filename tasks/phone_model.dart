class Phone {
  const Phone({
    required this.model,
    required this.os,
    required this.imei,
    this.phoneNumber,
    required this.diskSize,
    this.camera,
  });
  final String model;
  final String? phoneNumber;
  final OS os;
  final String imei;
  static const DeviceType _deviceType = DeviceType.smartphone;
  final int diskSize;

  final Camera? camera;

  static void call({required String phone}) => print('Звоним по номеру $phone');

  static Phone template() =>
      Phone(model: 'iPhone', os: OS.iOS, imei: '212323232', diskSize: 512);
}

class Camera {
  Camera({required this.cameraNumbers, required this.mpx});
  final int cameraNumbers;
  final double mpx;
}

enum OS { android, iOS, aurora, selfishOS, windowsPhone }

enum DeviceType { smartphone, fax, laptop, calculator }
