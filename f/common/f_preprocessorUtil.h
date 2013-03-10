// F3 - Preprocessor Utilities
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Expansion aware concatentaion
#define f_CAT2(X,Y) X##Y
#define f_CAT(X,Y) f_CAT2(X,Y)

// Expansion aware "stringification"
#define f_STR2(X) #X
#define f_STR(X) f_STR2(X)
