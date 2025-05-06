import 'package:flutter/material.dart';
import 'package:travel_app/app_routes.dart';
import 'package:travel_app/models/journey.dart';

class JourneyTile extends StatefulWidget {
  final Journey journey;

  const JourneyTile({super.key, required this.journey});

  @override
  State<JourneyTile> createState() => _JourneyTileState();
}

class _JourneyTileState extends State<JourneyTile> {
  void goToDetails() {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.journeyDetail, arguments: widget.journey.id);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.journey.name),
      children: [
        ListTile(title: Text(widget.journey.description)),
        TextButton(onPressed: goToDetails, child: Text("Подробнее")),
      ],
    );
  }
}
