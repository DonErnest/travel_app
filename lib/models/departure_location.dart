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

final departureCenter = DepartureLocation(name: "Остановка Московская Тыныстанова", description: "Точка сбора - магазин Берекет на пер. Московской и Тыныстанова");
final departureSouth = DepartureLocation(name: "Остановка Южные ворота", description: "Точка сбора - парк Южные ворота");
final departureEast = DepartureLocation(name: "Остановка БЦ Victory", description: "Точка сбора - сквер Победы у БЦ Victory");
