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
  final String userId;
  final String journeyId;
  final int participantsNumber;
  final ParticipationStatus status;

  Participation({
    String? id,
    required this.userId,
    required this.journeyId,
    required this.participantsNumber,
    required this.status,
  }) : id = id ?? uuid.v4();

  Participation copyWith({
    String? id,
    String? userId,
    String? journeyId,
    int? participantsNumber,
    ParticipationStatus? status,
  }) {
    return Participation(
      id: id ?? this.id,
      userId: userId?? this.userId,
      journeyId: journeyId?? this.journeyId,
      participantsNumber: participantsNumber?? this.participantsNumber,
      status: status?? this.status,
    );
  }
}