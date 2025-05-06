import 'package:decimal/decimal.dart';
import 'package:travel_app/utils/uuid.dart';

import 'departure_location.dart';


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

  final String imageUrl;

  final JourneyDifficulty difficultyLevel ;
  final JourneyDuration duration;

  final String description;
  final Decimal price;

  final String departLocationId;

  Journey({
    String? id,
    required this.name,
    required this.imageUrl,
    required this.difficultyLevel,
    required this.duration,
    required this.description,
    required this.price,
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
    String? departLocationId
  }) {
    return Journey(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name?? this.name,
      difficultyLevel: difficultyLevel?? this.difficultyLevel,
      duration: duration?? this.duration,
      description: description?? this.description,
      price: price?? this.price,
      departLocationId: departLocationId?? this.departLocationId
    );
  }
}


final sampleJourneys = [
  Journey(name: "Ош", imageUrl: "https://ticketon.kz/media/upload/41414u56103_osh.jpg", difficultyLevel: JourneyDifficulty.easy, duration: JourneyDuration.severalDays, description: "Ош Весенний - Ошская область — это хранилище самых удивительных чудес природы и исторического достояния времен Великого Шелкового пути. За такой короткий период времени не возможно все охватить но мы подобрали для вас самые интересные места ошской области, которые непременно нужно увидеть.", price: Decimal.parse("18000"), departLocationId: departureCenter.id),
  Journey(name: "Ледниковое озеро Адыгене", imageUrl: "https://www.travelbar.kg/template/images/listings/775/2.jpg", difficultyLevel: JourneyDifficulty.hard, duration: JourneyDuration.oneDay, description: "Трек к озеру проходит по ущелью Адыгене, где на протяжении всего пути пейзажи будут очень разнообразны. От крутых склонов до нетронутых пастбищ, от густого леса до голой морены. Виды на прекрасные пики порадую глаз любого туриста.", price: Decimal.parse("1500"), departLocationId: departureSouth.id),
  Journey(name: "Бурана + 2 ущелья", imageUrl: "https://www.baibol.kg/img/attraction_gallery/152413578972880.jpg", difficultyLevel: JourneyDifficulty.easy, duration: JourneyDuration.oneDay, description: "Посещение Бураны и 2 близлезжащих ущелий", price: Decimal.parse("1300"), departLocationId: departureEast.id)
];