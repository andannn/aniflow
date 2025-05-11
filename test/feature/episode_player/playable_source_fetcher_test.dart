import 'package:aniflow/feature/episode_player/player/widget/playable_source_fetcher.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testUrls = [
    "https://v16.muscdn.com/47e22ee1d50a949800c91061933fa217/68210751/video/tos/alisg/tos-alisg-ve-0051c001-sg/o4EO2neuggGShGtWFeLIANGfMWA2PTaIQJeMAO/?a=602253&bti=Nzg3NWYzLTQ6&ch=0&cr=0&dr=0&er=0&lr=default&cd=0%7C0%7C0%7C0&br=2892&bt=1446&cs=0&ds=4&ft=cArVX9z7ThWHaeQOEGZmo0P&mime_type=video_mp4&qs=0&rc=M2RpODM4ZGYzOWk3OWQ5OEBpajZ0O3k5cnE2MzMzODYzNEBgNWI2M14xXy4xNi0yNl9eYSNfYGYvMmRzZV9hLS1kMC1zcw%3D%3D&vvpl=1&l=20250511135943859B654D6A150C92E683&btag=e000a8000 "
  ];
  group('detail_character_bloc_test', () {
    test("test match url", () {
      for (var url in testUrls) {
         expect(matchVideoUrl(url), equals(true));
      }
    });
  });
}
