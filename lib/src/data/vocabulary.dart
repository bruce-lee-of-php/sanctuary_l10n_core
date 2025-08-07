// This file has been updated to include the new `defaultGender` property
// for each pronoun, making the grammar engine smarter.

import '../models/grammatical_gender.dart';
import '../models/pronoun_set.dart';

// --- PRONOUNS ---

const List<PronounSet> allPronouns = [
  PronounSet(
    subjective: 'I',
    objective: 'me',
    possessiveAdjective: 'my',
    possessivePronoun: 'mine',
    reflexive: 'myself',
    conjugationKey: '1st-person-singular',
    defaultGender: GrammaticalGender.neutral, // "I" doesn't imply gender
  ),
  PronounSet(
    subjective: 'you',
    objective: 'you',
    possessiveAdjective: 'your',
    possessivePronoun: 'yours',
    reflexive: 'yourself',
    conjugationKey: 'plural',
    defaultGender: GrammaticalGender.neutral,
  ),
  PronounSet(
    subjective: 'she',
    objective: 'her',
    possessiveAdjective: 'her',
    possessivePronoun: 'hers',
    reflexive: 'herself',
    conjugationKey: '3rd-person-singular',
    defaultGender: GrammaticalGender.feminine, // "she" implies feminine
  ),
  PronounSet(
    subjective: 'he',
    objective: 'him',
    possessiveAdjective: 'his',
    possessivePronoun: 'his',
    reflexive: 'himself',
    conjugationKey: '3rd-person-singular',
    defaultGender: GrammaticalGender.masculine, // "he" implies masculine
  ),
  PronounSet(
    subjective: 'they',
    objective: 'them',
    possessiveAdjective: 'their',
    possessivePronoun: 'theirs',
    reflexive: 'themself',
    conjugationKey: '3rd-person-plural',
    defaultGender: GrammaticalGender.neutral, // "they" implies neutral
  ),
  PronounSet(
    subjective: 'we',
    objective: 'us',
    possessiveAdjective: 'our',
    possessivePronoun: 'ours',
    reflexive: 'ourselves',
    conjugationKey: 'plural',
    defaultGender: GrammaticalGender.neutral,
  ),
  PronounSet(
    subjective: 'ze',
    objective: 'zir',
    possessiveAdjective: 'zir',
    possessivePronoun: 'zirs',
    reflexive: 'zirself',
    conjugationKey: '3rd-person-singular',
    defaultGender: GrammaticalGender.neutral,
  ),
];

// --- GENDER IDENTITIES (Unchanged) ---
const List<String> allGenderIdentities = [
  'Trans Woman',
  'Trans Man',
  'Non-binary',
  'Genderfluid',
  'Agender',
  'Cis Woman',
  'Cis Man',
];

// --- SEXUALITIES (Unchanged) ---
const List<String> allSexualities = [
  'Lesbian',
  'Gay',
  'Bisexual',
  'Pansexual',
  'Asexual',
  'Queer',
  'Straight',
];
