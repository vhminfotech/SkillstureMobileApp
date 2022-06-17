import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'constants/constants.dart';
import 'graphqlconfigs/graphql_provider.dart';
import 'localization/localization.dart';
import 'navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlProviderClass.client,
      child: CacheProvider(
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme: GoogleFonts.oswaldTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          initialRoute: routeLaunch,
          onGenerateRoute: NavigationUtils.generateRoute,
          localizationsDelegates: const [
            MyLocalizationsDelegate(),
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            // const Locale('es', ''),
          ],
        ),
      ),
    );
  }
}