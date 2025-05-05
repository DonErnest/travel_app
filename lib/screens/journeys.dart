import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/journey_provider.dart';
import 'package:travel_app/widgets/canvas.dart';
import 'package:travel_app/widgets/journey_tile.dart';

class JourneysList extends StatefulWidget {
  const JourneysList({super.key});

  @override
  State<JourneysList> createState() => _JourneysListState();
}

class _JourneysListState extends State<JourneysList> {
  late JourneyProvider journeyProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    journeyProvider = context.watch<JourneyProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        Expanded(
          child: ListView.builder(
            itemBuilder:
                (ctx, idx) => JourneyTile(journey: journeyProvider.journeys[idx]),
            itemCount: journeyProvider.journeys.length,
          ),
        ),
      ],
    );
  }
}
