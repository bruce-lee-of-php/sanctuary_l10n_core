import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';
import 'package:test/test.dart';

void main() {
  group('SanctuaryVocabulary Tests', () {
    final vocabulary = SanctuaryVocabulary();

    test('allPronouns list should not be empty and contain valid data', () {
      final pronouns = vocabulary.pronouns.all();
      expect(pronouns, isNotEmpty);
      // Check if a known value is present
      expect(
        pronouns.any((p) => p.subjective == 'they'),
        isTrue,
        reason: 'Should contain the "they/them" pronoun set.',
      );
    });

    test('allGenderIdentities list should not be empty', () {
      final genders = vocabulary.genders.all();
      expect(genders, isNotEmpty);
      expect(
        genders,
        contains('Non-binary'),
        reason: 'Should contain the "Non-binary" identity.',
      );
    });

    test('allSexualities list should not be empty', () {
      final sexualities = vocabulary.sexualities.all();
      expect(sexualities, isNotEmpty);
      expect(
        sexualities,
        contains('Asexual'),
        reason: 'Should contain the "Asexual" orientation.',
      );
    });

    test('randomGender() should return a valid gender from the list', () {
      final randomGender = vocabulary.randomGender();
      // Check if the randomly generated gender is in the official list.
      expect(
        vocabulary.genders.all(),
        contains(randomGender),
        reason:
            'The randomly generated gender should be one of the known identities.',
      );
    });

    test('randomPronounSet() should return a valid pronoun set from the list',
        () {
      final randomPronounSet = vocabulary.randomPronounSet();
      // Check if the randomly generated pronoun set is in the official list.
      expect(
        vocabulary.pronouns.all(),
        contains(randomPronounSet),
        reason:
            'The randomly generated pronoun set should be one of the known sets.',
      );
    });
  });
}
