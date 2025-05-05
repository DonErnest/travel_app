import 'package:flutter/material.dart';
import 'package:travel_app/models/participation.dart';

class ParticipationProvider extends ChangeNotifier {
  List<Participation> _participations = [];

  List<Participation> get participations => _participations;
}
