import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgetbook/widgetbook.dart';

/// An addon to display a link to a GitHub repository.
class GitHubAddon extends Addon<String> with SingleFieldOnly<String> {
  GitHubAddon(this.repository)
    : super(name: 'GitHub', initialValue: repository);

  final String repository;

  @override
  Field<String> get field {
    return StringField(name: 'repository', initialValue: repository);
  }

  @override
  Widget buildFields(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Repository',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(FontAwesomeIcons.github, size: 18),
            label: Text(repository),
            onPressed: () =>
                launchUrl(Uri.parse('https://github.com/$repository')),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              padding: const EdgeInsets.all(16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget apply(BuildContext context, Widget child, String setting) {
    return child;
  }
}
