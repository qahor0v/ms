import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ms/pages/main_pages/home.dart';
import 'package:ms/services/constants/app_colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim Cloud Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: primarySw,
      ),
      home: const Home(),
    );
  }
}



/// Download video from YouTube with Dio package
/*
 var yt = YoutubeExplode();
            var manifest = await yt.videos.streamsClient
                .getManifest('OUSSxaJCkvY')
                .then((value) async {
              final data = value.audio;
              Dio dio = Dio();
              try {
                var dir = await getTemporaryDirectory();

                await dio.download(
                    data.first.url.toString(), '${dir.path}/${DateTime.now().millisecond}',
                    onReceiveProgress: (rec, total) {
                  var progressString =
                      "${((rec / total) * 100).toStringAsFixed(0)}%";
                  log(progressString);
                });
              } catch (exp) {
                log(exp.toString());
              }
            });
*/
