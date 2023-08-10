/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();

  /// File path: assets/images/img.png
  AssetGenImage get img => const AssetGenImage('assets/images/img.png');

  /// File path: assets/images/img_1.png
  AssetGenImage get img1 => const AssetGenImage('assets/images/img_1.png');

  /// File path: assets/images/img_2.png
  AssetGenImage get img2 => const AssetGenImage('assets/images/img_2.png');

  /// File path: assets/images/img_3.png
  AssetGenImage get img3 => const AssetGenImage('assets/images/img_3.png');

  /// File path: assets/images/img_4.png
  AssetGenImage get img4 => const AssetGenImage('assets/images/img_4.png');

  /// File path: assets/images/img_5.png
  AssetGenImage get img5 => const AssetGenImage('assets/images/img_5.png');

  /// File path: assets/images/img_6.png
  AssetGenImage get img6 => const AssetGenImage('assets/images/img_6.png');

  /// File path: assets/images/img_7.png
  AssetGenImage get img7 => const AssetGenImage('assets/images/img_7.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [img, img1, img2, img3, img4, img5, img6, img7];
}

class $AssetsLanguagesGen {
  const $AssetsLanguagesGen();

  /// File path: assets/languages/en-EN.json
  String get enEN => 'assets/languages/en-EN.json';

  /// File path: assets/languages/ru-RU.json
  String get ruRU => 'assets/languages/ru-RU.json';

  /// File path: assets/languages/uz-UZ.json
  String get uzUZ => 'assets/languages/uz-UZ.json';

  /// List of all assets
  List<String> get values => [enEN, ruRU, uzUZ];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/back_arrow.svg
  SvgGenImage get backArrow =>
      const SvgGenImage('assets/images/icons/back_arrow.svg');

  /// File path: assets/images/icons/bottom_arrow.svg
  SvgGenImage get bottomArrow =>
      const SvgGenImage('assets/images/icons/bottom_arrow.svg');

  /// File path: assets/images/icons/click_logo.svg
  SvgGenImage get clickLogo =>
      const SvgGenImage('assets/images/icons/click_logo.svg');

  /// File path: assets/images/icons/draft.svg
  SvgGenImage get draft => const SvgGenImage('assets/images/icons/draft.svg');

  /// File path: assets/images/icons/draft_active.svg
  SvgGenImage get draftActive =>
      const SvgGenImage('assets/images/icons/draft_active.svg');

  /// File path: assets/images/icons/payme_logo.svg
  SvgGenImage get paymeLogo =>
      const SvgGenImage('assets/images/icons/payme_logo.svg');

  /// File path: assets/images/icons/pie_chart.svg
  SvgGenImage get pieChart =>
      const SvgGenImage('assets/images/icons/pie_chart.svg');

  /// File path: assets/images/icons/pie_chart_active.svg
  SvgGenImage get pieChartActive =>
      const SvgGenImage('assets/images/icons/pie_chart_active.svg');

  /// File path: assets/images/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/icons/search.svg');

  /// File path: assets/images/icons/shopping.svg
  SvgGenImage get shopping =>
      const SvgGenImage('assets/images/icons/shopping.svg');

  /// File path: assets/images/icons/uzum_logo.svg
  SvgGenImage get uzumLogo =>
      const SvgGenImage('assets/images/icons/uzum_logo.svg');

  /// File path: assets/images/icons/x_icon.svg
  SvgGenImage get xIcon => const SvgGenImage('assets/images/icons/x_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        backArrow,
        bottomArrow,
        clickLogo,
        draft,
        draftActive,
        paymeLogo,
        pieChart,
        pieChartActive,
        search,
        shopping,
        uzumLogo,
        xIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLanguagesGen languages = $AssetsLanguagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      // colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      // clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
