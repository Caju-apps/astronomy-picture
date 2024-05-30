import 'package:astronomy_picture/container_injection.dart';
import 'package:astronomy_picture/route_generato.dart';
import 'package:astronomy_picture/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupContainer();
  runApp(const AstronomyPicture());
}

class AstronomyPicture extends StatelessWidget {
  const AstronomyPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astronomy Picture',
      onGenerateRoute: getIt<RouteGenerator>().generateRoute,
      initialRoute: '/',
      theme: CustomTheme.getTheme(),
    );
  }
}
