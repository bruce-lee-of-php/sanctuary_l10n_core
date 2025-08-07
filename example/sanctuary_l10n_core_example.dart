// This example file provides a comprehensive demonstration of all features
// available in the sanctuary_l10n_core package.

import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';

// A simple User class to demonstrate storing a grammatical gender.
class User {
  final String name;
  final GrammaticalGender gender;
  User(this.name, this.gender);
}

void main() {
  print('--- Sanctuary L10n Core: Comprehensive Example ---');

  // Create an instance of the vocabulary accessor. This is the main entry point
  // for accessing the package's curated lists of terminology.
  final vocabulary = SanctuaryVocabulary();

  // --- 1. Vocabulary Showcase ---
  // This section demonstrates how to access the complete, curated lists
  // of terminology included in the package.
  print('\n\n--- 1. Vocabulary Showcase ---');

  print('\nAvailable Pronoun Sets (as structured objects):');
  for (final pronounSet in vocabulary.pronouns.all()) {
    print(
        '- ${pronounSet.toString().padRight(8)} (Reflexive: ${pronounSet.reflexive})');
  }

  print('\nAvailable Gender Identities:');
  print(vocabulary.genders.all().join(', '));

  print('\nAvailable Sexualities:');
  print(vocabulary.sexualities.all().join(', '));

  // --- 2. Random Data Generation Showcase ---
  // This section demonstrates the utility functions for generating
  // random data, which is incredibly useful for testing, previews, or mockups.
  print('\n\n--- 2. Random Data Generation ---');
  print('Generating a random user profile:');

  final randomPronoun = vocabulary.randomPronounSet();
  final randomGender = vocabulary.randomGender();
  final randomSexuality = vocabulary.randomSexuality();

  print('- Pronouns: ${randomPronoun.toString()}');
  print('- Gender Identity: $randomGender');
  print('- Sexuality: $randomSexuality');

  // --- 3. Grammar Engine Showcase ---
  // This section demonstrates the core power of the package: the ability to
  // create grammatically correct, gender-affirming sentences.
  print('\n\n--- 3. Grammar Engine Showcase ---');
  final locale = 'es'; // We'll use Spanish for our examples.
  print('Locale: $locale');

  // --- Singular Examples ---
  print('\n--- Singular Examples ---');
  final singularTemplate = '{def_article} {noun:friend} está {adj:tired}.';
  print('Template: "$singularTemplate"');

  final userBea = User('Bea', GrammaticalGender.feminine);
  final sentenceBea = SanctuaryL10n.format(
    singularTemplate,
    locale: locale,
    gender: userBea.gender,
    number: GrammaticalNumber.singular,
  );
  print('For a feminine user ("Bea"): "$sentenceBea"');

  final userCarlos = User('Carlos', GrammaticalGender.masculine);
  final sentenceCarlos = SanctuaryL10n.format(
    singularTemplate,
    locale: locale,
    gender: userCarlos.gender,
    number: GrammaticalNumber.singular,
  );
  print('For a masculine user ("Carlos"): "$sentenceCarlos"');

  final userAlex = User('Alex', GrammaticalGender.neutral);
  final sentenceAlex = SanctuaryL10n.format(
    singularTemplate,
    locale: locale,
    gender: userAlex.gender,
    number: GrammaticalNumber.singular,
  );
  print('For a neutral user ("Alex"): "$sentenceAlex"');

  // --- Plural Examples ---
  print('\n--- Plural Examples ---');
  final pluralTemplate = '{def_article} {noun:friend} son {adj:happy}.';
  print('Template: "$pluralTemplate"');

  final pluralFeminine = SanctuaryL10n.format(
    pluralTemplate,
    locale: locale,
    gender: GrammaticalGender.feminine,
    number: GrammaticalNumber.plural,
  );
  print('For a feminine group: "$pluralFeminine"');

  final pluralMasculine = SanctuaryL10n.format(
    pluralTemplate,
    locale: locale,
    gender: GrammaticalGender.masculine,
    number: GrammaticalNumber.plural,
  );
  print('For a masculine group: "$pluralMasculine"');

  final pluralNeutral = SanctuaryL10n.format(
    pluralTemplate,
    locale: locale,
    gender: GrammaticalGender.neutral,
    number: GrammaticalNumber.plural,
  );
  print('For a neutral group: "$pluralNeutral"');
}
