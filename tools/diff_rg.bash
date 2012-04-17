# Simple checking of the differences between the ACE and the English resource grammars.
# Expects the environment variable $GF_RGL_SRC to point to the source of
# the GF Resource Grammar Library.

# @author Kaarel Kaljurand
# @version 2012-04-17

# Usage:
# bash diff_rg.bash | bash
#
ace_rg_src="../lib/src/"

echo "ace_rg_src=\"${ace_rg_src}\""
echo "eng_rg_src=\${GF_RGL_SRC}/english/"
echo "api_rg_src=\${GF_RGL_SRC}/api/"

ls ${ace_rg_src}ace/*.gf | sed "s/.*\/\(.*\)Ace\(.*\)\.gf/diff \${eng_rg_src}\1Eng\2\.gf \${ace_rg_src}ace\/\1Ace\2.gf/"
ls ${ace_rg_src}api/*.gf | sed "s/.*\/\(.*\)Ace\(.*\)\.gf/diff \${api_rg_src}\1Eng\2\.gf \${ace_rg_src}api\/\1Ace\2.gf/"
