/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudiosGen {
  const $AssetsAudiosGen();

  /// File path: assets/audios/shape_of_you.mp3
  String get shapeOfYou => 'assets/audios/shape_of_you.mp3';

  /// File path: assets/audios/welcome_audio.mp3
  String get welcomeAudio => 'assets/audios/welcome_audio.mp3';

  /// List of all assets
  List<String> get values => [shapeOfYou, welcomeAudio];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/cover_bg.png
  AssetGenImage get coverBg => const AssetGenImage('assets/png/cover_bg.png');

  /// File path: assets/png/launcher_icon.png
  AssetGenImage get launcherIcon =>
      const AssetGenImage('assets/png/launcher_icon.png');

  /// File path: assets/png/next.png
  AssetGenImage get next => const AssetGenImage('assets/png/next.png');

  /// File path: assets/png/previous.png
  AssetGenImage get previous => const AssetGenImage('assets/png/previous.png');

  /// File path: assets/png/shape_of_you_cover.png
  AssetGenImage get shapeOfYouCover =>
      const AssetGenImage('assets/png/shape_of_you_cover.png');

  /// File path: assets/png/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/png/welcome.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [coverBg, launcherIcon, next, previous, shapeOfYouCover, welcome];
}

class Assets {
  const Assets._();

  static const $AssetsAudiosGen audios = $AssetsAudiosGen();
  static const $AssetsPngGen png = $AssetsPngGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
