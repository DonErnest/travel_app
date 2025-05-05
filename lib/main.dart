import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/app_routes.dart';
import 'package:travel_app/providers/journey_provider.dart';
import 'package:travel_app/providers/participation_provider.dart';
import 'package:travel_app/providers/user_provider.dart';
import 'package:travel_app/screens/journeys.dart';
import 'package:travel_app/screens/login.dart';
import 'package:travel_app/screens/not_found_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (ctx) => UserProvider()),
      ChangeNotifierProvider(create: (ctx) => JourneyProvider()),
      ChangeNotifierProvider(create: (ctx) => ParticipationProvider()),
    ],
     child: MaterialApp(
       routes: {
         AppRoutes.login: (ctx) => LoginScreen(),
         AppRoutes.userSettings: (ctx) => Placeholder(),
         AppRoutes.journeys: (ctx) => JourneysList(),
         AppRoutes.journeyDetail: (ctx) => Placeholder(),
         AppRoutes.participation: (ctx) => Placeholder(),
       },
       initialRoute: AppRoutes.login,
       title: "Travel across our wonderful country",
       onUnknownRoute:
           (s) => MaterialPageRoute(builder: (ctx) => NotFoundScreen()),
     ),
    )

  );
}
