# Some hackish regexp-based changes to the sentences before
# they are sent to the Codeco parser. The purpose is to make
# the precision scores more meaningful.

# @autor Kaarel Kaljurand
# @version 2012-05-10

# Remove trailing spaces
s/ *$//

# Convert clusters of digits into '2',
# because the test grammar only supports 1 and 2.
s/[0-9 ]*[023456789][0-9 ]*/ 2 /g
s/ *1 *1[1 ]*/ 2 /g
