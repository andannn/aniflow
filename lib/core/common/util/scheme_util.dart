
const String aniflowDeepLinkScheme = 'aniflow';

mixin SchemeUtil {
  static String createDeepLinkFromSiteUrl(String siteUrl) {
    return siteUrl.replaceFirst('http', aniflowDeepLinkScheme);
  }
}