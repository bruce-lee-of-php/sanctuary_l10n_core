// This file contains the specific grammatical rules for Spanish.
// Separating rules by language makes the engine scalable and easy to maintain.

import 'package:sanctuary_l10n_core/src/models/grammatical_gender.dart';

/// A dictionary of Spanish adjectives and their gendered inflections.
///
/// The keys are the base English adjectives, and the values are maps
/// that provide the correct Spanish word for each grammatical gender.
const Map<String, Map<GrammaticalGender, String>> spanishAdjectives = {
  'happy': {
    GrammaticalGender.masculine: 'contento',
    GrammaticalGender.feminine: 'contenta',
    GrammaticalGender.neutral: 'contente',
  },
  'tired': {
    GrammaticalGender.masculine: 'cansado',
    GrammaticalGender.feminine: 'cansada',
    GrammaticalGender.neutral: 'cansade',
  },
  'welcome': {
    GrammaticalGender.masculine: 'Bienvenido',
    GrammaticalGender.feminine: 'Bienvenida',
    GrammaticalGender.neutral: 'Bienvenide',
  }
};
