// This file contains the core logic for the grammatical gender engine.
// It provides helper functions to get correctly inflected words based on
// the provided locale and gender.

import 'package:sanctuary_l10n_core/src/grammar_rules/spanish_rules.dart';
import 'package:sanctuary_l10n_core/src/models/grammatical_gender.dart';

/// A static helper class for handling grammatical gender in localization.
///
/// This engine provides functions to retrieve correctly inflected words
/// (like adjectives and nouns) based on the target locale and the desired
/// grammatical gender.
class SanctuaryL10n {
  /// A map that directs to the correct rule set for each supported language.
  static final Map<String, Map<String, Map<GrammaticalGender, String>>>
      _ruleSets = {
    'es': spanishAdjectives,
    // In the future, other languages will be added here.
    // 'fr': frenchAdjectives,
  };

  /// Returns the correctly inflected adjective for the given gender and locale.
  ///
  /// This function looks up the [baseAdjective] in the dictionary for the
  /// specified [locale] and returns the form that matches the [gender].
  ///
  /// If the locale is not supported or the adjective is not found, it will
  /// return the [baseAdjective] as a fallback.
  ///
  /// Example:
  /// ```dart
  /// getAdjective(
  ///   locale: 'es',
  ///   gender: GrammaticalGender.feminine,
  ///   baseAdjective: 'tired'
  /// ); // Returns "cansada"
  /// ```
  static String getAdjective({
    required String locale,
    required GrammaticalGender gender,
    required String baseAdjective,
  }) {
    final languageRules = _ruleSets[locale];
    if (languageRules == null) {
      return baseAdjective; // Fallback for unsupported languages
    }

    final adjectiveForms = languageRules[baseAdjective];
    if (adjectiveForms == null) {
      return baseAdjective; // Fallback for unknown adjectives
    }

    return adjectiveForms[gender] ??
        baseAdjective; // Fallback for missing gender form
  }
}
