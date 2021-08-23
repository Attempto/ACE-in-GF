A Prolog script for converting APE's Clex lexicon into a suitable format for GF

If you already have a lexicon file downloaded, use build.sh
If not, use one of the download scripts:

- `download_large.sh` to download and build with the large Attempto Lexicon hosted at https://github.com/Attempto/Clex/blob/master/clex_lexicon.pl
    - Note: This might not work because of the presence of non-ascii characters. If this script fails, try `download_modified`
- `download_small.sh` to download and build with the small Attempto Lexicon hosted at https://github.com/Attempto/APE/blob/master/prolog/lexicon/clex_lexicon.pl
- `download_modified.sh` to download and build with a modification of the large Attempto Lexicon hosted at https://github.com/danshaub/Clex/blob/master/clex_lexicon.pl
    - Note: The modified lexicon simply removes all words with non-ascii characters. For more info, see [here](https://github.com/danshaub/Clex)