// This file provides the public API for accessing the package's vocabulary.
// It acts as a clean, organized way for developers to get the data they need.

import 'dart:math';
import 'package:sanctuary_l10n_core/src/data/vocabulary.dart';
import 'package:sanctuary_l10n_core/src/models/pronoun_set.dart';

/// A class that provides access to lists of inclusive terminology.
class SanctuaryVocabulary {
  final Random _random;

  /// Creates an instance of the vocabulary accessor.
  /// An optional [Random] instance can be provided for deterministic results.
  SanctuaryVocabulary({Random? random}) : _random = random ?? Random();

  /// Access pronoun data.
  final pronouns = const _PronounAccessor();

  /// Access gender identity data.
  final genders = const _GenderAccessor();

  /// Access sexuality data.
  final sexualities = const _SexualityAccessor();

  /// Returns a random gender identity from the full list.
  String randomGender() =>
      allGenderIdentities[_random.nextInt(allGenderIdentities.length)];

  /// Returns a random pronoun set from the full list.
  PronounSet randomPronounSet() =>
      allPronouns[_random.nextInt(allPronouns.length)];

  /// Returns a random sexuality from the full list.
  String randomSexuality() =>
      allSexualities[_random.nextInt(allSexualities.length)];
}

// --- Private Accessor Classes for a Clean API ---

class _PronounAccessor {
  const _PronounAccessor();

  /// Returns a list of all available pronoun sets.
  List<PronounSet> all() => allPronouns;
}

class _GenderAccessor {
  const _GenderAccessor();

  /// Returns a list of all available gender identities.
  List<String> all() => allGenderIdentities;
}

class _SexualityAccessor {
  const _SexualityAccessor();

  /// Returns a list of all available sexualities.
  List<String> all() => allSexualities;
}
