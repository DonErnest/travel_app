import 'package:flutter/material.dart';
import 'package:travel_app/models/journey.dart';

class JourneyTile extends StatefulWidget {
  final Journey journey;

  const JourneyTile({super.key, required this.journey});

  @override
  State<JourneyTile> createState() => _JourneyTileState();
}

class _JourneyTileState extends State<JourneyTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.journey.name),
      children: [ListTile(title: Text(widget.journey.description))],
    );
  }
}
