import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/journey.dart';
import 'package:travel_app/models/participation.dart';
import 'package:travel_app/providers/journey_provider.dart';
import 'package:travel_app/providers/participation_provider.dart';
import 'package:travel_app/providers/user_provider.dart';
import 'package:travel_app/widgets/canvas.dart';

class ParticipationScreen extends StatefulWidget {
  const ParticipationScreen({super.key});

  @override
  State<ParticipationScreen> createState() => _ParticipationScreenState();
}

class _ParticipationScreenState extends State<ParticipationScreen> {
  late JourneyProvider journeyProvider;
  late UserProvider userProvider;
  late ParticipationProvider participationProvider;

  late Journey journey;

  final participantsController = TextEditingController();
  int displayedParticipants = 1;

  @override
  void initState() {
    super.initState();
    participantsController.text = 1.toString();
    participantsController.addListener(
      _changeDisplayParticipants,
    );
  }

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

  void payForParticipation() {
    final participation = participationProvider.getParticipation(
      userProvider.user!.id,
      journey.id,
    );
    if (participation != null) {
      final editedParticipation = participation.copyWith(
        status: ParticipationStatus.confirmed,
        participantsNumber: int.parse(participantsController.text),
      );
      participationProvider.editParticipation(editedParticipation);
    } else {
      final participation = Participation(
        userId: userProvider.user!.id,
        journeyId: journey.id,
        participantsNumber: int.parse(participantsController.text),
        status: ParticipationStatus.confirmed,
      );
      participationProvider.participate(participation);
    }

    Navigator.of(context).pop();
  }
  @override
  void dispose() {
    participantsController.dispose();
    super.dispose();
  }

  void _changeDisplayParticipants() {
    setState(() {
      displayedParticipants = int.parse(participantsController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        Text(
          "Оплатить ${journey.name} за ${displayedParticipants} человек",
        ),
        Divider(),
        Text("Цена за одного человека: ${journey.price} сом"),
        Text("К оплате: ${Decimal.parse(participantsController.text) * journey.price} сом"),
        TextField(
          controller: participantsController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]')),
            FilteringTextInputFormatter.allow(RegExp('^[1-9][0-9]*')),
          ],
          minLines: 1,
        ),
        TextButton(
            onPressed: payForParticipation, child: Text("Оплатить")
        ),
      ],
    );
  }
}
