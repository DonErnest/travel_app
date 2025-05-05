import 'package:travel_app/utils/uuid.dart';

enum ParticipationStatus {
  interested("Interested"),
  applied("Applied"),
  confirmed("Confirmed");

  final String display;
  const ParticipationStatus(this.display);
}


class Participation {
  late final String id;
  final int userId;
  final int journeyId;
  final ParticipationStatus status;

  Participation({
    String? id,
    required this.userId,
    required this.journeyId,
    required this.status,
  }) : id = id ?? uuid.v4();

  Participation copyWith({
    String? id,
    int? userId,
    int? journeyId,
    ParticipationStatus? status,
  }) {
    return Participation(
      id: id ?? this.id,
      userId: userId?? this.userId,
      journeyId: journeyId?? this.journeyId,
      status: status?? this.status,
    );
  }
}