import 'package:travel_app/models/participation.dart';


Participation expressInterest(String userId, String journeyId) {
  return Participation(
    userId: userId,
    journeyId: journeyId,
    participantsNumber: 1,
    status: ParticipationStatus.interested,
  );
}
