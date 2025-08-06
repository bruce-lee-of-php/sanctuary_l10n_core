// This is an example of how to use the sanctuary_l10n_core package.
// To run this file, navigate to your package's root directory in the terminal
// and execute: dart example/example.dart

import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';
import 'package:sanctuary_l10n_core/src/grammar_engine.dart';

// A simple User class to demonstrate storing a grammatical gender.
class User {
  final String name;
  final GrammaticalGender gender;

  User(this.name, this.gender);

  @override
  String toString() {
    // .name is the enum value's name, e.g., "feminine"
    return '$name (Gender: ${gender.name})';
  }
}

/// A function showing how the real grammar engine is used.
String getWelcomeMessage(String locale, User user) {
  // Call the real grammar engine from the package.
  final welcomeAdjective = SanctuaryL10n.getAdjective(
    locale: locale,
    gender: user.gender,
    baseAdjective: 'welcome',
  );
  return '¡$welcomeAdjective, ${user.name}!';
}

void main() {
  print('--- Sanctuary L10n Core Example ---');

  // Create some example users with different grammatical genders.
  final user1 = User('Alex', GrammaticalGender.neutral);
  final user2 = User('Bea', GrammaticalGender.feminine);
  final user3 = User('Carlos', GrammaticalGender.masculine);

  print('\nOur Users:');
  print(user1);
  print(user2);
  print(user3);

  print('\n--- Grammar Engine Showcase ---');

  final locale = 'es'; // Pretend our app is in Spanish
  print('Generating messages for locale: $locale\n');

  // The grammar engine uses the user's gender to create
  // grammatically correct sentences.
  final messageForAlex = getWelcomeMessage(locale, user1);
  final messageForBea = getWelcomeMessage(locale, user2);
  final messageForCarlos = getWelcomeMessage(locale, user3);

  print(messageForAlex);
  print(messageForBea);
  print(messageForCarlos);
}
