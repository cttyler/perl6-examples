use v6;

my $input-file = $*PROGRAM_NAME.IO.dirname ~ "/wordlist.txt";
my %dict = ( ($input-file.IO.slurp.split("\n").grep: {.chars == 7}) X 1);

my %digits = (
    2 => (<a b c>),
    3 => (<d e f>),
    4 => (<g h i>),
    5 => (<j k l>),
    6 => (<m n o>),
    7 => (<p r s>),
    8 => (<t u v>),
    9 => (<w x y>),
);

my $phone_number = 7323464;
my @test_words;

for $phone_number.split('') {
    say $_, "->", %digits{$_}.join('-');
    if (@test_words.elems) {
        my @values = %digits{$_}.values;
        @test_words = @test_words X~ '.' X~ @values;
    }
    else {
        @test_words = %digits{$_}.values;
    }
}
say "Comparing {@test_words.elems} against a dictionary of {%dict.elems}";
for @test_words -> $word {
    $word.say if defined %dict{$word};
}

# vim: expandtab shiftwidth=4 ft=perl6
