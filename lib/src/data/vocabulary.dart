// This file contains the raw, community-vetted data for the package.
// It is stored directly in Dart to be easily accessible in any environment.

import '../models/pronoun_set.dart';

// --- PRONOUNS ---

const List<PronounSet> allPronouns = [
  PronounSet(
    subjective: 'she',
    objective: 'her',
    possessiveAdjective: 'her',
    possessivePronoun: 'hers',
    reflexive: 'herself',
  ),
  PronounSet(
    subjective: 'he',
    objective: 'him',
    possessiveAdjective: 'his',
    possessivePronoun: 'his',
    reflexive: 'himself',
  ),
  PronounSet(
    subjective: 'they',
    objective: 'them',
    possessiveAdjective: 'their',
    possessivePronoun: 'theirs',
    reflexive: 'themself',
  ),
  PronounSet(
    subjective: 'ze',
    objective: 'hir',
    possessiveAdjective: 'hir',
    possessivePronoun: 'hirs',
    reflexive: 'hirself',
  ),
  // More neopronouns can be added here.
];

// --- GENDER IDENTITIES ---

const List<String> allGenderIdentities = [
  'Trans Woman',
  'Trans Man',
  'Non-binary',
  'Genderfluid',
  'Agender',
  'Cis Woman',
  'Cis Man',
  // More identities can be added here.
];

// --- SEXUALITIES ---

const List<String> allSexualities = [
  'Lesbian',
  'Gay',
  'Bisexual',
  'Pansexual',
  'Asexual',
  'Queer',
  'Straight',
  // More orientations can be added here.
];
