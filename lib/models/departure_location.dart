import 'package:travel_app/utils/uuid.dart';

class DepartureLocation {
  late final String id;
  final String name;
  final String description;


  DepartureLocation({
    String? id,
    required this.name,
    required this.description,
  }) : id = id ?? uuid.v4();

  DepartureLocation copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return DepartureLocation(
      id: id ?? this.id,
      name: name?? this.name,
      description: description?? this.description,
    );
  }
}