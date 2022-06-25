import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'controllers/graphqlconfigs/graphql_provider.dart';
import 'controllers/navigation/routes_constant.dart';
import 'localization/localization.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  final GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlProviderClass.client,
      child: CacheProvider(
        child: GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme: GoogleFonts.oswaldTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          initialRoute: RoutesConstant.routeLaunch,
          getPages: RoutesConstant.routes,
          //onGenerateRoute: NavigationUtils.generateRoute,
          localizationsDelegates: [
            MyLocalizationsDelegate(),
            CountryLocalizations.delegate,
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