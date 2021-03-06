use v6;

=begin pod

=TITLE Counting DNA Nucleotides

=AUTHOR gerdr

L<http://rosalind.info/problems/dna/>

Sample input

    AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC

Sample output

    20 12 17 21

=end pod

my $default-input = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC";

# TODO: make this example calculate the right result
sub MAIN($input = $default-input) {
    <A C G T>.map({ +.comb(/$^symbol/) }).say given $input;
}

# vim: expandtab shiftwidth=4 ft=perl6
