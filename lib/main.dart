import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Initialisation de GetStorage
  await GetStorage.init();
  //Initialisation de Firebase
   await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  // Détermination de la route initiale
  var initialRoute = await Routes.initialRoute;

  runApp(Main(initialRoute));
}

//  Fonction pour initialiser d'autres dépendances si nécessaire
void initializeDependencies() {

  // Get.put(UserController()); 
  // Get.put(SettingsController());
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Badgee",
      initialRoute: initialRoute,
      getPages: Nav.routes,
      debugShowCheckedModeBanner: false,
      
      
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', 'FR'),
        Locale('en', 'US'),
      ],
      locale: const Locale('fr', 'FR'),

      // Thème et police
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
