# Some hackish regexp-based changes to the sentences before
# they are sent to the Codeco parser. The purpose is to make
# the precision scores more meaningful.

# @autor Kaarel Kaljurand
# @version 2012-05-10

# Remove trailing spaces
s/ *$//

# Convert clusters of digits into '2',
# which is the only number that the test grammar supports.
s/[0-9 ]*[0-9][0-9 ]*/ 2 /g
