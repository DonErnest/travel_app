import 'package:flutter/material.dart';
import 'package:travel_app/models/participation.dart';

class ParticipationProvider extends ChangeNotifier {
  List<Participation> _participations = [];

  List<Participation> get participations => _participations;

  void participate(Participation participation) {
    _participations = [..._participations, participation];
  }

  void editParticipation(Participation editedParticipation) {
    final partIdx = _participations.indexWhere(
      (participation) => participation.id == editedParticipation.id,
    );
    _participations[partIdx] = editedParticipation;
  }

  Participation? getParticipation(String userId, String journeyId) {
    return _participations.firstWhere(
      (participation) =>
          participation.journeyId == journeyId &&
          participation.userId == userId,
    );
  }
}
