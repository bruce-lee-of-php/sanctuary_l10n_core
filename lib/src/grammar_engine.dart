// This file has been updated to handle plurals. The `format` function
// now accepts a `number` parameter.

import 'package:sanctuary_l10n_core/src/grammar_rules/spanish_rules.dart';
import 'package:sanctuary_l10n_core/src/models/grammatical_gender.dart';
import 'package:sanctuary_l10n_core/src/models/grammatical_number.dart';

/// A static helper class for handling grammatical gender in localization.
class SanctuaryL10n {
  // --- Rule Set Definitions ---
  static final Map<String, Map<String, InflectionMap>> _adjectiveRuleSets = {
    'es': spanishAdjectives
  };
  static final Map<String, Map<String, InflectionMap>> _nounRuleSets = {
    'es': spanishNouns
  };
  static final Map<String, InflectionMap> _definiteArticleRuleSets = {
    'es': spanishDefiniteArticles
  };
  static final Map<String, InflectionMap> _indefiniteArticleRuleSets = {
    'es': spanishIndefiniteArticles
  };

  // --- NEW: The Intelligent Formatter ---
  static String format(
    String template, {
    required String locale,
    required GrammaticalGender gender,
    GrammaticalNumber number =
        GrammaticalNumber.singular, // Default to singular
  }) {
    final RegExp placeholderRegex = RegExp(r'\{(.+?)\}');

    return template.replaceAllMapped(placeholderRegex, (match) {
      final placeholder = match.group(1) ?? '';
      final parts = placeholder.split(':');
      final type = parts[0];
      final baseWord = parts.length > 1 ? parts[1] : '';

      switch (type) {
        case 'noun':
          return getNoun(
              locale: locale,
              gender: gender,
              number: number,
              baseNoun: baseWord);
        case 'adj':
          return getAdjective(
              locale: locale,
              gender: gender,
              number: number,
              baseAdjective: baseWord);
        case 'def_article':
          return getDefiniteArticle(
              locale: locale, gender: gender, number: number);
        case 'indef_article':
          return getIndefiniteArticle(
              locale: locale, gender: gender, number: number);
        default:
          return match.group(0) ?? '';
      }
    });
  }

  // --- Existing Functions (now with `number` parameter) ---
  static String getAdjective(
      {required String locale,
      required GrammaticalGender gender,
      required GrammaticalNumber number,
      required String baseAdjective}) {
    return _getInflectedWord(
        ruleSet: _adjectiveRuleSets[locale],
        baseWord: baseAdjective,
        gender: gender,
        number: number);
  }

  static String getNoun(
      {required String locale,
      required GrammaticalGender gender,
      required GrammaticalNumber number,
      required String baseNoun}) {
    return _getInflectedWord(
        ruleSet: _nounRuleSets[locale],
        baseWord: baseNoun,
        gender: gender,
        number: number);
  }

  static String getDefiniteArticle(
      {required String locale,
      required GrammaticalGender gender,
      required GrammaticalNumber number}) {
    return _getArticle(
        ruleSet: _definiteArticleRuleSets[locale],
        gender: gender,
        number: number,
        fallback: 'the');
  }

  static String getIndefiniteArticle(
      {required String locale,
      required GrammaticalGender gender,
      required GrammaticalNumber number}) {
    return _getArticle(
        ruleSet: _indefiniteArticleRuleSets[locale],
        gender: gender,
        number: number,
        fallback: 'a');
  }

  // --- Private Helper Methods (now with `number` parameter) ---
  static String _getInflectedWord({
    required Map<String, InflectionMap>? ruleSet,
    required String baseWord,
    required GrammaticalGender gender,
    required GrammaticalNumber number,
  }) {
    if (ruleSet == null) return baseWord;
    final numberForms = ruleSet[baseWord];
    if (numberForms == null) return baseWord;
    final genderForms = numberForms[number];
    if (genderForms == null) return baseWord;
    return genderForms[gender] ?? baseWord;
  }

  static String _getArticle({
    required Map<GrammaticalNumber, Map<GrammaticalGender, String>>? ruleSet,
    required GrammaticalGender gender,
    required GrammaticalNumber number,
    required String fallback,
  }) {
    if (ruleSet == null) return fallback;
    final genderForms = ruleSet[number];
    if (genderForms == null) return fallback;
    return genderForms[gender] ?? fallback;
  }
}
