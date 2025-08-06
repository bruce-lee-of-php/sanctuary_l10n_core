// This is an example of how to use the sanctuary_l10n_core package.
// To run this file, navigate to your package's root directory in the terminal
// and execute: dart example/example.dart

import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';
import 'package:sanctuary_l10n_core/src/vocabulary.dart';

void main() {
  print('--- Sanctuary L10n Core Example ---');

  // Create an instance of the vocabulary accessor.
  final vocabulary = SanctuaryVocabulary();

  // --- Vocabulary Showcase ---
  // This section demonstrates how to access the complete, curated lists
  // of terminology included in the package.

  print('\n--- Complete Vocabulary Lists ---');

  print('\nAvailable Pronoun Sets:');
  // Use the accessor to get all pronoun sets and print their properties.
  for (final pronounSet in vocabulary.pronouns.all()) {
    print(
        '- ${pronounSet.toString()} (Subjective: ${pronounSet.subjective}, Objective: ${pronounSet.objective}, Reflexive: ${pronounSet.reflexive})');
  }

  print('\nAvailable Gender Identities:');
  for (final identity in vocabulary.genders.all()) {
    print('- $identity');
  }

  print('\nAvailable Sexualities:');
  for (final sexuality in vocabulary.sexualities.all()) {
    print('- $sexuality');
  }

  // --- Random Data Generation Showcase ---
  // This section demonstrates the utility functions for generating
  // random data, useful for testing, previews, or mockups.

  print('\n--- Random Data Generation ---');
  print('Generating some random identities for a user profile:');

  final randomPronoun = vocabulary.randomPronounSet();
  final randomGender = vocabulary.randomGender();
  final randomSexuality = vocabulary.randomSexuality();

  print('- Pronouns: ${randomPronoun.toString()}');
  print('- Gender Identity: $randomGender');
  print('- Sexuality: $randomSexuality');

  print('\n--- Grammar Engine Showcase (Future) ---');
  print(
      'The following demonstrates how the upcoming Grammar Engine will be used.');

  final locale = 'es'; // Pretend our app is in Spanish
  final userGender = GrammaticalGender.feminine;

  // The grammar engine will use the user's gender to create
  // grammatically correct sentences.
  final welcomeAdjective = SanctuaryL10n.getAdjective(
    locale: locale,
    gender: userGender,
    baseAdjective: 'welcome',
  );
  print(
      'Example Usage: ¡$welcomeAdjective, user!'); // Expected: ¡Bienvenida, user!
}
