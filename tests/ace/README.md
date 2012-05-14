Full ACE
========

Based on the APE regression test set.
Generated like this:

> ~/mywork/APE/examples$ swipl -s output_tests.pl -t halt -g main | grep -v ":" > sentences.txt

Note that we exclude sentences that contain prefixed-words.
