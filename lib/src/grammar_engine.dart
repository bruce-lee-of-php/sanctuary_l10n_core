// The grammar engine's `format` function has been upgraded to be smarter.
// It can now infer the grammatical gender from the provided `PronounSet`.

import 'package:sanctuary_l10n_core/src/grammar_rules/english_verbs.dart';
import 'package:sanctuary_l10n_core/src/grammar_rules/spanish_rules.dart';
import 'package:sanctuary_l10n_core/src/models/grammatical_gender.dart';
import 'package:sanctuary_l10n_core/src/models/grammatical_number.dart';
import 'package:sanctuary_l10n_core/src/models/pronoun_set.dart';

class SanctuaryL10n {
  // --- Rule Set Definitions (Unchanged) ---
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
  static final Map<String, Map<String, Map<String, Map<String, String>>>>
      _verbRuleSets = {'en': englishVerbs};

  // --- The Intelligent Formatter ---
  static String format(
    String template, {
    required String locale,
    GrammaticalGender? gender,
    GrammaticalNumber number = GrammaticalNumber.singular,
    PronounSet? pronoun,
  }) {
    final RegExp placeholderRegex = RegExp(r'\{(.+?)\}');

    // NEW LOGIC: Infer the gender from the pronoun if it's not explicitly provided.
    final GrammaticalGender? currentGender = gender ?? pronoun?.defaultGender;

    return template.replaceAllMapped(placeholderRegex, (match) {
      final placeholder = match.group(1) ?? '';
      final parts = placeholder.split(':');
      final type = parts[0];
      final baseWord = parts.length > 1 ? parts[1] : '';

      switch (type) {
        case 'noun':
        case 'adj':
        case 'def_article':
        case 'indef_article':
          if (currentGender == null)
            return baseWord; // Cannot inflect without a gender
          if (type == 'noun')
            return getNoun(
                locale: locale,
                gender: currentGender,
                number: number,
                baseNoun: baseWord);
          if (type == 'adj')
            return getAdjective(
                locale: locale,
                gender: currentGender,
                number: number,
                baseAdjective: baseWord);
          if (type == 'def_article')
            return getDefiniteArticle(
                locale: locale, gender: currentGender, number: number);
          if (type == 'indef_article')
            return getIndefiniteArticle(
                locale: locale, gender: currentGender, number: number);
          break;
        case 'verb':
          if (pronoun == null)
            return baseWord; // Cannot conjugate without a pronoun
          return getVerb(
              locale: locale,
              pronoun: pronoun,
              baseVerb: parts[1],
              tense: parts[2]);
        default:
          return match.group(0) ?? '';
      }
      return match.group(0) ?? '';
    });
  }

  // --- Public API Functions (Unchanged) ---
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

  static String getVerb(
      {required String locale,
      required PronounSet pronoun,
      required String baseVerb,
      required String tense}) {
    final langRules = _verbRuleSets[locale];
    if (langRules == null) return baseVerb;
    final verbForms = langRules[baseVerb];
    if (verbForms == null) return baseVerb;
    final tenseForms = verbForms[tense];
    if (tenseForms == null) return baseVerb;
    return tenseForms[pronoun.conjugationKey] ?? baseVerb;
  }

  // --- Private Helper Methods (Unchanged) ---
  static String _getInflectedWord(
      {required Map<String, InflectionMap>? ruleSet,
      required String baseWord,
      required GrammaticalGender gender,
      required GrammaticalNumber number}) {
    if (ruleSet == null) return baseWord;
    final numberForms = ruleSet[baseWord];
    if (numberForms == null) return baseWord;
    final genderForms = numberForms[number];
    if (genderForms == null) return baseWord;
    return genderForms[gender] ?? baseWord;
  }

  static String _getArticle(
      {required Map<GrammaticalNumber, Map<GrammaticalGender, String>>? ruleSet,
      required GrammaticalGender gender,
      required GrammaticalNumber number,
      required String fallback}) {
    if (ruleSet == null) return fallback;
    final genderForms = ruleSet[number];
    if (genderForms == null) return fallback;
    return genderForms[gender] ?? fallback;
  }
}
