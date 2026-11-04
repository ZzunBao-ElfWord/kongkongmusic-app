import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class AlbumCover extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final int gradientIndex;
  final String? label;
  final String? subtitle;
  final bool isCircle;
  final IconData? icon;
  final String? imagePath;
  final Uint8List? imageData;

  const AlbumCover({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12,
    this.gradientIndex = 0,
    this.label,
    this.subtitle,
    this.isCircle = false,
    this.icon,
    this.imagePath,
    this.imageData,
  });

  // 静奢黑：低饱和、深色渐变，靠明度而不是饱和度区分
  static const _gradients = [
    [Color(0xFF3A2320), Color(0xFF0D0A09)],
    [Color(0xFF1E2433), Color(0xFF0A0C11)],
    [Color(0xFF173029), Color(0xFF0A100D)],
    [Color(0xFF3B2B1B), Color(0xFF100D09)],
    [Color(0xFF2E1D33), Color(0xFF0C090F)],
    [Color(0xFF1D2A33), Color(0xFF0A0D11)],
    [Color(0xFF33231F), Color(0xFF0F0B0A)],
    [Color(0xFF27231B), Color(0xFF0C0B09)],
    [Color(0xFF202A24), Color(0xFF0A0D0B)],
    [Color(0xFF2A2030), Color(0xFF0C0A0F)],
    [Color(0xFF2A1F25), Color(0xFF0E0B0C)],
    [Color(0xFF1B2430), Color(0xFF0A0D11)],
  ];

  @override
  Widget build(BuildContext context) {
    // If we have a real image, show it
    if (imageData != null) {
      return _buildImageCover(
        Image.memory(imageData!, fit: BoxFit.cover, width: width, height: height),
      );
    }
    if (imagePath != null && File(imagePath!).existsSync()) {
      return _buildImageCover(
        Image.file(File(imagePath!), fit: BoxFit.cover, width: width, height: height),
      );
    }

    // Fallback: gradient placeholder
    final colors = _gradients[gradientIndex % _gradients.length];
    final shape = isCircle ? BoxShape.circle : BoxShape.rectangle;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: (label != null || icon != null)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(icon, color: Colors.white.withValues(alpha: 0.9),
                        size: width * 0.3),
                  if (icon != null && label != null) const SizedBox(height: 6),
                  if (label != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        label!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.1 > 16 ? 16 : width * 0.1,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        subtitle!,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _buildImageCover(Widget image) {
    return ClipRRect(
      borderRadius: isCircle
          ? BorderRadius.circular(width / 2)
          : BorderRadius.circular(borderRadius),
      child: SizedBox(width: width, height: height, child: image),
    );
  }
}
