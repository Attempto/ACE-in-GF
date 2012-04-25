ACE Resource Grammar
====================

This resource grammar inherits nearly everything from the English library, 
but serves as a place where ACE-specific modifications can be made cleanly.

The deviations from the English resource grammar are:

- `whom` has been replaced with `who`
- removal of comma `,` between an NP and its relative clause
- `nothing but` 

**Inheritence hierarchy**

![ACE RG dependancy graph](https://github.com/Attempto/ACE-in-GF/raw/master/lib/src/ace/dg.png)

**Changelog**

- 2012-04-25: the relative pronouns `who`, `which` and `that` are allowed with any noun (phrase)
- 2012-04-23 (`a8e4745`): Re-implemented ACE RG as descendent of English rather
than an individual library.
