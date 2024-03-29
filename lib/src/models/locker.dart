// DEFINE LOCKER SITE CLASS
class LockerSite {
  final String id;
  final String name;
  final String address;
  final GeoLocation location;
  final List<LockerCompartment> compartments;
  final int v;

  LockerSite({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.compartments,
    required this.v,
  });

  factory LockerSite.fromJson(Map<String, dynamic> json) {
    return LockerSite(
      id: json['_id'],
      name: json['name'],
      address: json['address'],
      location: GeoLocation.fromJson(json['location']),
      compartments: (json['compartments'] as List<dynamic>)
          .map((compartmentJson) => LockerCompartment.fromJson(compartmentJson))
          .toList(),
      v: json['__v'],
    );
  }
}

class GeoLocation {
  final String type;
  final List<double> coordinates;

  GeoLocation({required this.type, required this.coordinates});

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      type: json['type'],
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((coordinate) => coordinate is int
              ? coordinate.toDouble()
              : (coordinate as double))
          .toList(),
    );
  }
}

class LockerCompartment {
  final String compartmentNumber;
  final String size;
  final bool isAvailable;
  final String id;

  LockerCompartment({
    required this.compartmentNumber,
    required this.size,
    required this.isAvailable,
    required this.id,
  });

  factory LockerCompartment.fromJson(Map<String, dynamic> json) {
    return LockerCompartment(
      compartmentNumber: json['compartmentNumber'],
      size: json['size'],
      isAvailable: json['isAvailable'],
      id: json['_id'],
    );
  }
}

class LockerAvailabilityResponse {
  late String lockerId;
  late String lockerName;
  late Map<String, int> availableCompartmentsBySize;

  LockerAvailabilityResponse({
    required this.lockerId,
    required this.lockerName,
    required this.availableCompartmentsBySize,
  });

  factory LockerAvailabilityResponse.fromJson(Map<String, dynamic> json) {
    return LockerAvailabilityResponse(
      lockerId: json['lockerId'] ?? '',
      lockerName: json['lockerName'] ?? '',
      availableCompartmentsBySize:
          (json['availableCompartmentsBySize'] as Map<String, dynamic>?)
                  ?.map((key, value) => MapEntry(key, value as int)) ??
              {},
    );
  }
}

class LockerCount {
  final String lockerId;
  final int orderCount;

  LockerCount(this.lockerId, this.orderCount);

  factory LockerCount.fromJson(Map<String, dynamic> json) {
    return LockerCount(json['lockerId'], json['orderCount']);
  }
}
