import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/playlist_provider.dart';
import '../theme/app_theme.dart';

Future<void> showCreatePlaylistDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;
  final playlists = context.read<PlaylistProvider>();
  var name = '';
  final selectedName = await showDialog<String>(
    context: context,
    builder: (dialogContext) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(l10n.libraryNewPlaylist),
        content: TextField(
          autofocus: true,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(hintText: l10n.libraryPlaylistName),
          onChanged: (value) => setState(() => name = value.trim()),
          onSubmitted: (_) {
            if (name.isNotEmpty) Navigator.of(dialogContext).pop(name);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: name.isEmpty
                ? null
                : () => Navigator.of(dialogContext).pop(name),
            child: Text(l10n.commonCreate),
          ),
        ],
      ),
    ),
  );
  if (selectedName == null) return;
  try {
    await playlists.createPlaylist(selectedName);
  } catch (_) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.libraryCreatePlaylistFailed)),
    );
  }
}
