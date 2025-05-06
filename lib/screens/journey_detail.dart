import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/journey.dart';
import 'package:travel_app/providers/journey_provider.dart';
import 'package:travel_app/widgets/canvas.dart';

class JourneyDetailed extends StatefulWidget {
  const JourneyDetailed({super.key});

  @override
  State<JourneyDetailed> createState() => _JourneyDetailedState();
}

class _JourneyDetailedState extends State<JourneyDetailed> {
  late Journey journey;
  late JourneyProvider journeyProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    journeyProvider = context.watch<JourneyProvider>();
    final journeyId = ModalRoute.of(context)!.settings.arguments as String;
    journey = journeyProvider.journeys.firstWhere((journey) => journey.id == journeyId);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(widgets: [
      Text(journey.name),

      Image.network(journey.imageUrl, width: double.infinity,),
      Divider(),
      SingleChildScrollView(child: Text(journey.description),),

      Text("Длительность: ${journey.duration.display}"),

      Text("Цен: ${journey.price}")
    ]);
  }
}
