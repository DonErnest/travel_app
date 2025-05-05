import 'package:decimal/decimal.dart';
import 'package:travel_app/utils/uuid.dart';


enum JourneyDifficulty {
  easy("easy"),
  medium("medium"),
  hard("hard");


  final String display;
  const JourneyDifficulty(this.display);
}

enum JourneyDuration {
  oneDay("One-day"),
  severalDays("Several days"),
  individual("Individual");

  final String display;
  const JourneyDuration(this.display);
}


class Journey {
  late final String id;
  final String name;

  final JourneyDifficulty difficultyLevel ;
  final JourneyDuration duration;

  final String description;
  final Decimal price;

  final double startLongitude;
  final double startLatitude;

  final int departLocationId;

  Journey({
    String? id,
    required this.name,
    required this.difficultyLevel,
    required this.duration,
    required this.description,
    required this.price,
    required this.startLongitude,
    required this.startLatitude,
    required this.departLocationId,
  }) : id = id ?? uuid.v4();

  Journey copyWith({
    String? id,
    String? name,
    JourneyDifficulty? difficultyLevel,
    JourneyDuration? duration,
    String? description,
    Decimal? price,
    double? startLongitude,
    double? startLatitude,
    int? departLocationId
  }) {
    return Journey(
      id: id ?? this.id,
      name: name?? this.name,
      difficultyLevel: difficultyLevel?? this.difficultyLevel,
      duration: duration?? this.duration,
      description: description?? this.description,
      price: price?? this.price,
      startLongitude: startLongitude?? this.startLongitude,
      startLatitude: startLatitude?? this.startLatitude,
      departLocationId: departLocationId?? this.departLocationId
    );
  }
}
