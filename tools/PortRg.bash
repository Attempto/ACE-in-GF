# This is how the English RG was initially ported to the ACE RG.
# Kaarel Kaljurand
# 2012-04-03

# Base the implementatin of the ACE RG on the existing English RG
cp $RG/lib/src/english/*Eng* lib/src/ace/
cp $RG/lib/src/api/*Eng* lib/src/api/

# Delete certain files:
rm ace/DictEng*
rm ace/ParseEng*

# Rename the files and the module calls in both ace/ and api/

# Rename the files
rename "s/Eng/Ace/" *.gf

# Create a sed-script to rename the module calls within files
ls *Ace* | sed "s/\.gf//" | sed "s/\(.*\)Ace\(.*\)/s\/\1Eng\2\/\1Ace\2\/g/" > rename.sed

# Apply the sed-script (uses modify.pl)
export CT_PROG="sed -f rename.sed"
modify.pl --out=self *.gf
