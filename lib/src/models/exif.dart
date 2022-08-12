import 'dart:convert';

class Exif {
  const Exif(
      {this.make,
      this.model,
      this.exposureTime,
      this.aperture,
      this.focalLength,
      this.isoSpeedEatings});
  final String? make;
  final String? model;
  final String? exposureTime;
  final String? aperture;
  final String? focalLength;
  final int? isoSpeedEatings;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'make': make,
      'model': model,
      'exposure_time': exposureTime,
      'aperture_value': aperture,
      'focal_length': focalLength,
      'iso_speed_ratings': isoSpeedEatings,
    };
  }

  factory Exif.fromMap(Map<String, dynamic> map) {
    return Exif(
      make: map['make'],
      model: map['model'],
      exposureTime: map['exposure_time'],
      aperture: map['aperture'],
      focalLength: map['focal_length'],
      isoSpeedEatings: map['iso'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Exif.fromJson(String source) =>
      Exif.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exif(make: $make, model: $model, exposureTime: $exposureTime, aperture: $aperture, focalLength: $focalLength, isoSpeedEatings: $isoSpeedEatings)';
  }
}
