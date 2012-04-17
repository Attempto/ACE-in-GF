# Simple checking of the differences between the ACE and the English resource grammar.
# Expects the environment variable $GF_RGL_SRC to point to the source of
# GF Resource Grammar Library.

# Usage:
# bash diff_rg.bash | bash
#
ace_rg_src="../lib/src/"

echo "ace_rg_src=\"${ace_rg_src}\""
echo "eng_rg_src=\${GF_RGL_SRC}/english/"
echo "api_rg_src=\${GF_RGL_SRC}/api/"

ls ${ace_rg_src}ace/*.gf | sed "s/.*\/\(.*\)Ace\(.*\)\.gf/diff \${ace_rg_src}ace\/\1Ace.gf \${eng_rg_src}\1Eng\2\.gf/"
ls ${ace_rg_src}api/*.gf | sed "s/.*\/\(.*\)Ace\(.*\)\.gf/diff \${ace_rg_src}api\/\1Ace.gf \${api_rg_src}\1Eng\2\.gf/"
