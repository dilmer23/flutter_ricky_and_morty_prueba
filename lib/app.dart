import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/CharacterRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/EpisodeRickyAndMorty_provider.dart';
import 'package:flutter_app_ricky_morty_prueba/config/provider/locationRickyAndMorty_provider%20.dart';
import 'package:flutter_app_ricky_morty_prueba/config/theme/theme_app.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/use_case/CharacterRickyAndMorty/characterRickyAndMort_use_case.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/use_case/EpisodeRickyAndMorty/richyAndMortyEpisode_use_case.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/use_case/locationRickyAndMorty/richyAndMortyLocation_use_case.dart';
import 'package:flutter_app_ricky_morty_prueba/data/driver_adapter/rickyAndMortyCharacter_api.dart';
import 'package:flutter_app_ricky_morty_prueba/data/driver_adapter/rickyAndMortyEpisode_api.dart';
import 'package:flutter_app_ricky_morty_prueba/data/driver_adapter/rickyAndMortyLocation_api.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/screens/home_EpisodeRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/screens/home_characterRickyAndMorty.dart';
import 'package:flutter_app_ricky_morty_prueba/ui/screens/home_locationRickyAndMorty.dart';
import 'package:provider/provider.dart';

class RickyAndMortyApp extends StatefulWidget {
  const RickyAndMortyApp({Key? key}) : super(key: key);

  @override
  State<RickyAndMortyApp> createState() => _RickyAndMortyAppState();
}

class _RickyAndMortyAppState extends State<RickyAndMortyApp> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    const HomeCharacterRickyAndMorty(),
    const HomeLocationRickyAndMorty(),
    const HomeEpisodeRickyAndMorty()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationRickyAndMortyProviders(
            locationRickyAndMortyUseCase: LocationRickyAndMortyUseCase(
              LocationRickyAndMortyApi(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CharacterRickyAndMortyProviders(
            characterRickyAndMortyUseCase: CharacterRickyAndMortyUseCase(
              CharacterRickyAndMortyApi(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => EpisodeRickyAndMortyProviders(
            episodeRickyAndMortyUseCase:
                EpisodeRickyAndMortyUseCase(EpisodenRickyAndMortyApi()),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Characters',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: 'Locations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.filter_frames_rounded),
                label: 'Episode',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
