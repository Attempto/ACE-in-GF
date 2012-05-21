# Some hackish regexp-based changes to the sentences before
# they are sent to the Codeco parser. The purpose is to make
# the precision scores more meaningful.

# @autor Kaarel Kaljurand
# @version 2012-05-15

# Remove trailing spaces
s/ *$//

# Convert clusters of digits into '2',
# because the test grammar only supports 1 and 2.
s/[0-9 ]*[023456789][0-9 ]*/ 2 /g
s/ *1 *1[1 ]*/ 2 /g

# Modify the-NPs: convert 'the' into 'a' and remove variables in apposition.
# the man X -> a man
# the man -> a man
# This removes all the anaphoric references which ACE-in-GF is not trying
# to model, so the precision test becomes more informative.
# One type of anaphoric reference structure still remains though: the illegal
# redeclaration of an antecedent (John sees a man X and sees a woman X.)
# Note that we cannot just delete all the variables, because these can
# occur alone as well.
s/^the  *\([a-zA-Z-]*\)  *[XY] / a \1 /g
s/^the  *\([a-zA-Z-]*\) / a \1 /g
s/ the  *\([a-zA-Z-]*\)  *[XY] / a \1 /g
s/ the  *\([a-zA-Z-]*\) / a \1 /g
# We remove the variable also from indefinite pronouns
#s/body  *[XY] /body /g
#s/thing  *[XY] /thing /g
# Nope, this is too aggressive, consider:
# "if John is everybody then for every woman of nobody X is everything ."
# where removing 'X' would create a syntactically incorrect sentence.
# So we number the variables instead:
s/ [XY] / X1 /
s/ [XY] / X2 /
s/ [XY] / X3 /
s/ [XY] / X4 /
s/ [XY] / X4 /
s/ [XY] / X5 /
s/ [XY] / X6 /
s/ [XY] / X7 /
s/ [XY] / X8 /
s/ [XY] / X9 /
# etc.
