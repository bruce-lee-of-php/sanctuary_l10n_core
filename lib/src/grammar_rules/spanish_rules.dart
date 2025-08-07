// This file has been updated to include plural forms for nouns and adjectives.

import 'package:sanctuary_l10n_core/src/models/grammatical_gender.dart';
import 'package:sanctuary_l10n_core/src/models/grammatical_number.dart';

// A nested map structure to hold both singular and plural forms.
// Map<GrammaticalNumber, Map<GrammaticalGender, String>>
typedef InflectionMap = Map<GrammaticalNumber, Map<GrammaticalGender, String>>;

/// A dictionary of Spanish adjectives with singular and plural forms.
const Map<String, InflectionMap> spanishAdjectives = {
  'happy': {
    GrammaticalNumber.singular: {
      GrammaticalGender.masculine: 'contento',
      GrammaticalGender.feminine: 'contenta',
      GrammaticalGender.neutral: 'contente',
    },
    GrammaticalNumber.plural: {
      GrammaticalGender.masculine: 'contentos',
      GrammaticalGender.feminine: 'contentas',
      GrammaticalGender.neutral: 'contentes',
    },
  },
  'tired': {
    GrammaticalNumber.singular: {
      GrammaticalGender.masculine: 'cansado',
      GrammaticalGender.feminine: 'cansada',
      GrammaticalGender.neutral: 'cansade',
    },
    GrammaticalNumber.plural: {
      GrammaticalGender.masculine: 'cansados',
      GrammaticalGender.feminine: 'cansadas',
      GrammaticalGender.neutral: 'cansades',
    },
  },
  'welcome': {
    GrammaticalNumber.singular: {
      GrammaticalGender.masculine: 'Bienvenido',
      GrammaticalGender.feminine: 'Bienvenida',
      GrammaticalGender.neutral: 'Bienvenide',
    },
    GrammaticalNumber.plural: {
      GrammaticalGender.masculine: 'Bienvenidos',
      GrammaticalGender.feminine: 'Bienvenidas',
      GrammaticalGender.neutral: 'Bienvenides',
    },
  }
};

/// A dictionary of Spanish nouns with singular and plural forms.
const Map<String, InflectionMap> spanishNouns = {
  'friend': {
    GrammaticalNumber.singular: {
      GrammaticalGender.masculine: 'amigo',
      GrammaticalGender.feminine: 'amiga',
      GrammaticalGender.neutral: 'amigue',
    },
    GrammaticalNumber.plural: {
      GrammaticalGender.masculine: 'amigos',
      GrammaticalGender.feminine: 'amigas',
      GrammaticalGender.neutral: 'amigues',
    },
  },
  'developer': {
    GrammaticalNumber.singular: {
      GrammaticalGender.masculine: 'desarrollador',
      GrammaticalGender.feminine: 'desarrolladora',
      GrammaticalGender.neutral: 'desarrolladore',
    },
    GrammaticalNumber.plural: {
      GrammaticalGender.masculine: 'desarrolladores',
      GrammaticalGender.feminine: 'desarrolladoras',
      GrammaticalGender.neutral:
          'desarrolladores', // Often neutral plural matches masculine
    },
  },
};

/// A dictionary of Spanish definite articles ("the").
const Map<GrammaticalNumber, Map<GrammaticalGender, String>>
    spanishDefiniteArticles = {
  GrammaticalNumber.singular: {
    GrammaticalGender.masculine: 'el',
    GrammaticalGender.feminine: 'la',
    GrammaticalGender.neutral: 'le',
  },
  GrammaticalNumber.plural: {
    GrammaticalGender.masculine: 'los',
    GrammaticalGender.feminine: 'las',
    GrammaticalGender.neutral: 'les',
  },
};

/// A dictionary of Spanish indefinite articles ("a"/"an").
const Map<GrammaticalNumber, Map<GrammaticalGender, String>>
    spanishIndefiniteArticles = {
  GrammaticalNumber.singular: {
    GrammaticalGender.masculine: 'un',
    GrammaticalGender.feminine: 'una',
    GrammaticalGender.neutral: 'une',
  },
  GrammaticalNumber.plural: {
    GrammaticalGender.masculine: 'unos',
    GrammaticalGender.feminine: 'unas',
    GrammaticalGender.neutral: 'unes',
  },
};
