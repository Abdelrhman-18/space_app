import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interactive_3d/interactive_3d.dart';

import 'package:space_app/core/constants/app_assets.dart';
import 'package:space_app/core/theme/app_colors.dart';

enum _ViewerStatus { loading, loaded, error }

final List<double> _viewerSolidBackgroundColor = [
  AppColors.background.r,
  AppColors.background.g,
  AppColors.background.b,
  AppColors.background.a,
];

class PlanetModelViewer extends StatefulWidget {
  const PlanetModelViewer({
    super.key,
    required this.modelPath,
    required this.imagePath,
    required this.viewerZoom,
  });

  final String modelPath;
  final String imagePath;
  final double viewerZoom;

  @override
  State<PlanetModelViewer> createState() => _PlanetModelViewerState();
}

class _PlanetModelViewerState extends State<PlanetModelViewer> {
  late final Interactive3dController _controller;
  _ViewerStatus _status = _ViewerStatus.loading;

  @override
  void initState() {
    super.initState();
    _controller = Interactive3dController();
    _verifyModelAsset();
  }

  Future<void> _verifyModelAsset() async {
    try {
      await rootBundle.load(widget.modelPath);
      if (!mounted) return;
      setState(() => _status = _ViewerStatus.loaded);
    } catch (_) {
      if (!mounted) return;
      setState(() => _status = _ViewerStatus.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_status) {
      case _ViewerStatus.loading:
        return _PlanetImageFallback(
          imagePath: widget.imagePath,
          showProgress: true,
        );
      case _ViewerStatus.error:
        return _PlanetImageFallback(
          imagePath: widget.imagePath,
          showProgress: false,
        );
      case _ViewerStatus.loaded:
        return Interactive3d(
          key: ValueKey(widget.modelPath),
          controller: _controller,
          modelPath: widget.modelPath,
          iblPath: AppAssets.environmentIbl,
          skyboxPath: AppAssets.environmentSkybox,
          defaultZoom: widget.viewerZoom,
          backgroundColor: AppColors.background,
          solidBackgroundColor: _viewerSolidBackgroundColor,
          loadingWidget: _PlanetImageFallback(
            imagePath: widget.imagePath,
            showProgress: true,
          ),
        );
    }
  }
}

class _PlanetImageFallback extends StatelessWidget {
  const _PlanetImageFallback({
    required this.imagePath,
    required this.showProgress,
  });

  final String imagePath;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.public, size: 96),
        ),
        if (showProgress) const CircularProgressIndicator(),
      ],
    );
  }
}
