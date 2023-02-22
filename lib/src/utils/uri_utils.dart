import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:aac_core/aac_core.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:novaid_core/api/server.dart';
// import 'package:novaid_core/src/package/package_model.dart';

enum LaunchActionType {
  none,
  tel,
  sms,
  email,
  web,
  // share,
  map,
  mapDirection,
  // file
}

class UriUtils {
  static launchActionOutside(
      {dynamic data, Uri? uri, String? backup, LaunchActionType? type}) async {
    try {
      if (type == null || type == LaunchActionType.none) {
        if (data != null) {
          uri = Uri.parse(data);
        }
      } else if (data != null) {
        uri = null;
        if (type == LaunchActionType.tel) {
          uri = Uri.parse(Platform.isIOS ? 'tel://$data' : 'tel:$data');
        } else if (type == LaunchActionType.sms) {
          uri = Uri.parse('sms:$data');
        } else if (type == LaunchActionType.email) {
          uri = Uri.parse('mailto:$data');
        } else if (type == LaunchActionType.web) {
          if (!data.startsWith("http")) {
            uri = Uri.parse('https://$data');
          } else {
            uri = Uri.parse(data);
          }
        // } else if (type == LaunchActionType.share) {
        //   Share.share(data);
        } else if (type == LaunchActionType.map) {
          if (data is List && data.length >= 3) {
            String lat = data[0].toString();
            String lng = data[1].toString();
            String label = data[2].toString();
            uri =
                Uri.parse(TextUtils.format(Configs.mapLink, [lat, lng, label]));
          }
        } else if (type == LaunchActionType.mapDirection) {
          if (data is List && data.length >= 2) {
            String lat = data[0].toString();
            String lng = data[1].toString();
            uri = Uri.parse(
                TextUtils.format(Configs.mapDirectionLink, [lat, lng]));
          }
        // } else if (type == LaunchActionType.file) {
        //   await OpenFile.open(data);
        //   return;
        }
      }

      print('launchActionOutside uri = $uri');
      if (uri != null) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print('launchActionOutside $data: $e');
      if (backup != null) {
        launchActionOutside(data: backup, type: type);
      }
    }
  }

  static String getASCImagePath(String? source) {
    /// ASC
    if (TextUtils.isValidURL(source)) {
      return source ?? '';
    }
    return '';
  }

  static String getASCFilePath(String? source) {
    /// ASC
    if (TextUtils.isValidURL(source)) {
      return source ?? '';
    }
    return '';
  }

  // static String getMediaPath(String? source) {
  //   /// NovaID
  //   return Server.envConfigs.DOMAIN_LEGACY_URL_PREFIX +
  //       Uri.encodeFull(source ?? '');
  // }

  // static String getProductPath(String? source) {
  //   return Server.envConfigs.DOMAIN_MEDIA + Uri.encodeFull(source ?? '');
  // }
  //
  // static String getProfileAvatar(String? source) {
  //   return Server.envConfigs.DOMAIN_MEDIA + Uri.encodeFull(source ?? '');
  // }

  static String getPDFLink(String url) {
    if (url.toLowerCase().endsWith('.pdf')) {
      return TextUtils.format(
          'https://docs.google.com/viewer?url=%s&embedded=true', [url]);
    }
    return url;
  }

  // static MediaType? getMediaType(String file) {
  //   MediaType? mediaType;
  //   for (var element in ALLOW_IMAGE_FILE_TYPES) {
  //     if (file.toLowerCase().endsWith('.$element')) {
  //       mediaType = MediaType('image', element);
  //       break;
  //     }
  //   }
  //   if (mediaType != null) {
  //     int dotIndex = file.lastIndexOf('.');
  //     if (dotIndex > 0 && dotIndex < file.length - 1) {
  //       mediaType =
  //           MediaType('application', file.substring(dotIndex, file.length));
  //     }
  //   }
  //   return mediaType;
  // }

  static Future<String> getContentType(String link) async {
    http.Response response = await http.head(Uri.parse(link));
    return response.headers['content-type'] ?? '';
  }

  // static openApp(PackageModel package) async {
  //   bool isInstalled = await LaunchApp.isAppInstalled(
  //       androidPackageName: package.androidPackage,
  //       iosUrlScheme: package.iosScheme);
  //   if (!isInstalled) {
  //     launchActionOutside(
  //         data: package.dynamicLink, type: LaunchActionType.web);
  //   } else {
  //     await LaunchApp.openApp(
  //       androidPackageName: package.androidPackage,
  //       iosUrlScheme: package.iosScheme,
  //       appStoreLink: package.appleStoreLink,
  //     );
  //   }
  // }
}
