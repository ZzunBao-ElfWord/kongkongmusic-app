import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: 58 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(
            color: AppColors.border.withValues(alpha: 0.7),
            width: 0.6,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _buildNavItem(Icons.home_rounded, l10n.navBrowse, 0),
            _buildNavItem(Icons.search_rounded, l10n.navSearch, 1),
            _buildNavItem(Icons.library_music_rounded, l10n.navLibrary, 2),
            _buildNavItem(Icons.queue_music_rounded, l10n.navPlaylist, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = currentIndex == index;
    final color = isActive
        ? AppColors.foreground
        : AppColors.mutedForeground.withValues(alpha: 0.55);
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 23, color: color),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                letterSpacing: 0.4,
                color: color,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
