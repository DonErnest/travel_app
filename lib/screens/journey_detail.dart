import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/app_routes.dart';
import 'package:travel_app/models/journey.dart';
import 'package:travel_app/models/participation.dart';
import 'package:travel_app/providers/journey_provider.dart';
import 'package:travel_app/providers/participation_provider.dart';
import 'package:travel_app/providers/user_provider.dart';
import 'package:travel_app/widgets/canvas.dart';

import '../services/participation.dart';

class JourneyDetailed extends StatefulWidget {
  const JourneyDetailed({super.key});

  @override
  State<JourneyDetailed> createState() => _JourneyDetailedState();
}

class _JourneyDetailedState extends State<JourneyDetailed> {
  late Journey journey;
  late JourneyProvider journeyProvider;
  late UserProvider userProvider;
  late ParticipationProvider participationProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    journeyProvider = context.watch<JourneyProvider>();
    userProvider = context.watch<UserProvider>();
    participationProvider = context.watch<ParticipationProvider>();

    final journeyId = ModalRoute.of(context)!.settings.arguments as String;
    journey = journeyProvider.journeys.firstWhere(
      (journey) => journey.id == journeyId,
    );
  }

  void goToPayment() {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.participation, arguments: journey.id);
  }

  @override
  Widget build(BuildContext context) {
    final userParticipation = participationProvider.getParticipation(
      userProvider.user!.id,
      journey.id,
    );
    return ScreenCanvas(
      widgets: [
        Text(journey.name),
        Image.network(journey.imageUrl, width: double.infinity),
        Divider(),
        SingleChildScrollView(child: Text(journey.description)),
        Divider(),
        Text("Длительность: ${journey.duration.display}"),
        Divider(),
        Text("Цен: ${journey.price}"),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (userParticipation == null)
              TextButton(
                onPressed: () {
                  final participation = expressInterest(
                    userProvider.user!.id,
                    journey.id,
                  );
                  participationProvider.participate(participation);
                },
                child: Text("Интересует"),
              ),
            if (userParticipation == null ||
                (userParticipation.status == ParticipationStatus.interested))
              TextButton(onPressed: goToPayment, child: Text("Записаться")),
          ],
        ),
      ],
    );
  }
}
