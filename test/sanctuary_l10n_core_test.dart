import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';
import 'package:test/test.dart';

void main() {
  group('SanctuaryL10nCore Comprehensive Tests', () {
    // --- Setup ---
    final vocabulary = SanctuaryVocabulary();
    final pronounShe =
        vocabulary.pronouns.all().firstWhere((p) => p.subjective == 'she');
    final pronounHe =
        vocabulary.pronouns.all().firstWhere((p) => p.subjective == 'he');
    final pronounThey =
        vocabulary.pronouns.all().firstWhere((p) => p.subjective == 'they');
    final pronounI =
        vocabulary.pronouns.all().firstWhere((p) => p.subjective == 'I');

    // --- Vocabulary Tests ---
    group('SanctuaryVocabulary', () {
      test('allPronouns list should be valid', () {
        final pronouns = vocabulary.pronouns.all();
        expect(pronouns, isNotEmpty);
        expect(pronouns.any((p) => p.subjective == 'they'), isTrue);
      });

      test('randomGender() returns a valid gender', () {
        final randomGender = vocabulary.randomGender();
        expect(vocabulary.genders.all(), contains(randomGender));
      });
    });

    // --- Grammar Engine Tests ---
    group('SanctuaryL10n.format()', () {
      // --- Spanish Gender & Number Tests ---
      group('Spanish Inflections', () {
        const locale = 'es';

        test('handles singular feminine correctly', () {
          final template = '{def_article} {noun:developer} está {adj:tired}.';
          final result = SanctuaryL10n.format(
            template,
            locale: locale,
            gender: GrammaticalGender.feminine,
            number: GrammaticalNumber.singular,
          );
          expect(result, 'la desarrolladora está cansada.');
        });

        test('handles plural masculine correctly', () {
          final template = '{def_article} {noun:friend} son {adj:happy}.';
          final result = SanctuaryL10n.format(
            template,
            locale: locale,
            gender: GrammaticalGender.masculine,
            number: GrammaticalNumber.plural,
          );
          expect(result, 'los amigos son contentos.');
        });

        test('handles singular neutral correctly', () {
          final template = '{indef_article} {noun:friend} está {adj:happy}.';
          final result = SanctuaryL10n.format(
            template,
            locale: locale,
            gender: GrammaticalGender.neutral,
            number: GrammaticalNumber.singular,
          );
          expect(result, 'une amigue está contente.');
        });

        test('handles plural neutral correctly', () {
          final template = '{def_article} {noun:friend} son {adj:happy}.';
          final result = SanctuaryL10n.format(
            template,
            locale: locale,
            gender: GrammaticalGender.neutral,
            number: GrammaticalNumber.plural,
          );
          expect(result, 'les amigues son contentes.');
        });
      });

      // --- English Verb Conjugation Tests ---
      group('English Verb Conjugation', () {
        const locale = 'en';

        test('conjugates "be" in present tense correctly', () {
          final template = '{pronoun} {verb:be:present} a developer.';
          final resultShe = SanctuaryL10n.format(
              template.replaceAll('{pronoun}', pronounShe.subjective),
              locale: locale,
              pronoun: pronounShe);
          final resultThey = SanctuaryL10n.format(
              template.replaceAll('{pronoun}', pronounThey.subjective),
              locale: locale,
              pronoun: pronounThey);
          final resultI = SanctuaryL10n.format(
              template.replaceAll('{pronoun}', pronounI.subjective),
              locale: locale,
              pronoun: pronounI);

          expect(resultShe, 'she is a developer.');
          expect(resultThey, 'they are a developer.');
          expect(resultI, 'I am a developer.');
        });

        test('conjugates "have" in past tense correctly', () {
          final template = '{pronoun} {verb:have:past} an idea.';
          final resultHe = SanctuaryL10n.format(
              template.replaceAll('{pronoun}', pronounHe.subjective),
              locale: locale,
              pronoun: pronounHe);
          final resultThey = SanctuaryL10n.format(
              template.replaceAll('{pronoun}', pronounThey.subjective),
              locale: locale,
              pronoun: pronounThey);

          expect(resultHe, 'he had an idea.');
          expect(resultThey, 'they had an idea.');
        });
      });

      // --- Edge Case Tests ---
      group('Edge Cases', () {
        test('gender override works correctly for combined pronouns', () {
          const locale = 'es';
          // NOTE: The verb "ser" is used here for a grammatically plausible Spanish sentence.
          // The engine doesn't conjugate Spanish verbs yet, so it remains "es".
          final template = '{def_article} {noun:friend} es {adj:happy}.';

          // Use "they" pronoun (which has a neutral default gender)
          // but EXPLICITLY pass a feminine gender to override it for nouns/adjectives.
          final result = SanctuaryL10n.format(
            template, // Pass the clean template
            locale: locale,
            pronoun:
                pronounThey, // Provide pronoun for context (though not used in this template)
            gender: GrammaticalGender.feminine, // The override!
          );

          // The test now correctly checks that the override produced feminine forms.
          expect(result, 'la amiga es contenta.');
        });

        test('falls back gracefully for unknown words or locales', () {
          final template = '{def_article} {noun:cat} is {adj:fluffy}.';
          final result = SanctuaryL10n.format(
            template,
            locale: 'es',
            gender: GrammaticalGender.feminine,
          );
          // The engine doesn't know "cat" or "fluffy", so it returns the base words.
          expect(result, 'la cat is fluffy.');
        });
      });
    });
  });
}
