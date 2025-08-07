// This file contains the conjugation tables for irregular English verbs.

/// A map of verb conjugations.
// ignore: unintended_html_in_doc_comment
/// The structure is: Map<Verb, Map<Tense, Map<ConjugationKey, Form>>>
library;

const Map<String, Map<String, Map<String, String>>> englishVerbs = {
  'be': {
    'present': {
      '1st-person-singular': 'am',
      '3rd-person-singular': 'is',
      '3rd-person-plural': 'are',
      'plural': 'are',
    },
    'past': {
      '1st-person-singular': 'was',
      '3rd-person-singular': 'was',
      '3rd-person-plural': 'were',
      'plural': 'were',
    },
  },
  'have': {
    'present': {
      '1st-person-singular': 'have',
      '3rd-person-singular': 'has',
      '3rd-person-plural': 'have',
      'plural': 'have',
    },
    'past': {
      '1st-person-singular': 'had',
      '3rd-person-singular': 'had',
      '3rd-person-plural': 'had',
      'plural': 'had',
    },
  },
};
