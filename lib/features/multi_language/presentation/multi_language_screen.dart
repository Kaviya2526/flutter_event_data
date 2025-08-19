import 'package:event_data/core/theme/app_text_themes.dart';
import 'package:event_data/core/utils/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/app_localization.dart';
import '../../../core/utils/common_widgets/action_button.dart';
import '../domain/entites/language.dart';
import 'bloc/language_bloc.dart';
import 'bloc/language_event.dart';
import 'bloc/language_state.dart';

class MultiLanguageScreen extends StatelessWidget {
  const MultiLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final AppLocalizations localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Select Language',
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          final them = Theme.of(context).textTheme;
          final colorScheme = Theme.of(context).colorScheme;

          if (state is LanguageInitial) {
            context.read<LanguageBloc>().add(LoadLanguages());
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LanguageLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select your preferred language',
                    style: them.bodyExtraLarge.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.languages.length,
                      itemBuilder: (context, index) {
                        final lang = state.languages[index];
                        final isSelected = lang.code == state.selected?.code;

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? colorScheme.primary.withValues(alpha: 0.05)
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? colorScheme.primary
                                  : Colors.grey.shade400,
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            title: Text(
                              lang.name,
                              style: them.bodyMedium!.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            trailing: isSelected
                                ? Icon(Icons.radio_button_on_rounded,
                                    color: colorScheme.primary)
                                : Icon(Icons.radio_button_off,
                                    color: colorScheme.outlineVariant),
                            onTap: () {
                              context
                                  .read<LanguageBloc>()
                                  .add(SelectLanguage(lang));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is LanguageSaved) {
            return Column(
              children: [
                Text(localizations.hello),
                Center(
                  child: Text(
                    "Language Saved: ${state.selected.name}",
                    style: them.bodyLarge,
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: Container(
        height: 84,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33848484),
              blurRadius: 16.0,
              spreadRadius: -4.0,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ActionButton(
            onPressed: () {
              final state = context.read<LanguageBloc>().state;
              if (state is LanguageLoaded && state.selected != null) {
                context.read<LanguageBloc>().add(ConfirmLanguage());
              }
            },
            label: "Save and Continue",
            buttonState: ElevatedButtonState.active,
            borderColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
