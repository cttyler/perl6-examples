use v6;

# Specification:
#   P09 (**) Pack consecutive duplicates of list elements into sublists.
#       If a list contains repeated elements they should be placed in separate
#       sublists.
# Example:
# > pack_dup(<a a a a b c c a a d e e e e>).perl.say
# [["a","a","a","a"],["b"],["c","c"],["a","a"],["d"],["e","e","e","e"]]


my @l = <a a a a b c c a a d e e e e>;
sub prob09 (@in) {
    return gather while @in.elems {
        my $val = @in[0];
    	take [gather while @in.elems and @in[0] ~~ $val { take shift @in }];
    }
}
say ~@l;
say prob09(@l).perl;

# vim: expandtab shiftwidth=4 ft=perl6
