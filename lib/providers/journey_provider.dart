import 'package:flutter/material.dart';
import 'package:travel_app/models/journey.dart';

class JourneyProvider extends ChangeNotifier {
  List<Journey> _journeys = [];

  List<Journey> get journeys => _journeys;
}