import 'package:flutter/material.dart';
import 'package:travel_app/models/journey.dart';

class JourneyProvider extends ChangeNotifier {
  List<Journey> _journeys = sampleJourneys;

  List<Journey> get journeys => _journeys;
}