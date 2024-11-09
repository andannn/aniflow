
import 'platform_player_platform_interface.dart';

class PlatformPlayer {
  Future<String?> navigateToPlayer(String source) {
    return PlatformPlayerPlatform.instance.navigateToPlayer(source);
  }
}
