## my first regular expression
regular_expression <- "a"
string_to_search <- "Maryland"
grepl(regular_expression, string_to_search)

## another regular expression
regular_expression <- "u"
grepl(regular_expression, string_to_search)

## some more examples
grepl("land", "Maryland")
grepl("ryla", "Maryland")
grepl("Marly", "Maryland")
grepl("dany", "Maryland")

## in-built dataset state.name (US States in a vector)
head(state.name)

## . as metacharacter
grepl(".", "Maryland")
grepl(".", "cusksdj%%&(#")
grepl(".", "")

grepl("a.b", c("aaa", "abb", "aab", "acuknjcjkdafb"))

## using + / * in regular expressions
grepl("a+", "Maryland")
grepl("x+", "Maryland")
grepl("x*", "Maryland")

## specifying occurrences with exact numbers
grepl("s{2}", "Mississippi")
grepl("s{3,5}", "Mississippi")
grepl("i{2,3}", "Mississippi")
grepl("(iss){2,3}", "Mississippi")
grepl("ss", "Mississippi")
grepl("s{2}", "Mississippi")
grepl("(ss){2}", "Mississippi")
grepl("(i.{2}){3}", "Mississippi")

## in-built regular expressions
grepl("\\w", "cnidsnclsknslncs7658")
grepl("\\d", "123")
grepl("\\s", "\n\t")
grepl("\\d", "abcdefghijklmn")
grepl("\\D", "abcdefghijklmn")
grepl("\\w", "\n\t    ")

## custom character sets
grepl("[aeiou]", "rhythms")
grepl("[^aeiou]", "rhythms")
grepl("[a-m]", "xyz")
grepl("[a-m]", "ABC")
grepl("[a-mX-ZC-D]", "ABC")

## matching punctuation
grepl("\\+", "tragedy + time = humor")
grepl("\\.", "http://www.google.com")
grepl("^a", c("abb", "ccc"))
grepl("b$", c("aab", "bac"))
grepl("^[ab]+$", c("bab", "aab", "abc"))

## OR metacharacter
grepl("a|b", c("aba", "deb", "xyz"))
grepl("North|South", c("North Dakota", "South Dakota", "West Virginia"))

## searching state dataset for states with vowel at start+end
start_end_vowel <- "^[AEIOU].+[aeiou]$"
vowel_state_lgl <- grepl(start_end_vowel, state.name)
head(vowel_state_lgl, 10)

state.name[vowel_state_lgl]



## more RegEx functions
grep("[Ii]", c("Hawaii", "Illinois", "Kentucky"))
sub("[Ii]", "1", c("Hawaii", "Illinois", "Kentucky"))
gsub("[Ii]", "2", c("Hawaii", "Illinois", "Kentucky"))

two_s <- state.name[grep("ss", state.name)]
two_s
strsplit(two_s, "ss")


