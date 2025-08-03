import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:surf_places/assets/images/app_svg_icons.dart';
import 'package:surf_places/uikit/images/svg_picture_widget.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';

/// {@template network_image_widget.class}
/// Загружает картинку из сети.
/// {@endtemplate}
class NetworkImageWidget extends StatelessWidget {
  final String imgUrl;
  final double height;

  /// {@macro network_image_widget.class}
  const NetworkImageWidget({required this.imgUrl, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (_, imageProvider) => _ImageBuilder(imageProvider: imageProvider, height: height),
      placeholder: (_, __) => _ImagePlaceholder(height: height),
      errorWidget: (_, __, ___) => _ImagePlaceholder(height: height),
    );
  }
}

/// Загруженная картинка из сети.
class _ImageBuilder extends StatelessWidget {
  final ImageProvider imageProvider;
  final double height;

  const _ImageBuilder({required this.imageProvider, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: DecoratedBox(decoration: BoxDecoration(image: DecorationImage(image: imageProvider, fit: BoxFit.cover))),
    );
  }
}

/// Плейсхолдер на время загрузки и если есть ошибка.
class _ImagePlaceholder extends StatelessWidget {
  final double height;
  const _ImagePlaceholder({required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Center(
        child: SvgPictureWidget(AppSvgIcons.icPhoto, color: AppColorTheme.of(context).inactive, width: 64, height: 64),
      ),
    );
  }
}
