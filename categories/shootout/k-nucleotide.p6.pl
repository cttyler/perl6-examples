use v6;

=begin pod

=TITLE Repeatedly update hashtables and k-nucleotide strings

=AUTHOR Daniel Carrera

L<http://benchmarksgame.alioth.debian.org/u32/performance.php?test=knucleotide>

Based on the submission for Perl 5.

USAGE: perl6 k-nucleotide.p6.pl k-nucleotide.input

=end pod

sub MAIN($input-file = $*PROGRAM_NAME.IO.dirname ~ "/k-nucleotide.input") {
    my $fh = open $input-file.IO;

    # Read FASTA file and extract DNA sequence THREE.
    my $sequence = '';
    my $lines;

    while $fh.get -> $line {
        last if ($line.substr(0,6) eq '>THREE');
    }
    while $fh.get -> $line {
        last if ($line.substr(0,1) eq '>');
        $sequence = $sequence ~ lc $line.subst(/\n/,'');
    }

    # Count nucleotide sequences
    my $len = $sequence.chars;
    my (@keys,%table,$sum,$frame_size);
    for 1..2 -> $frame_size {
        %table = ();
        update_hash($frame_size);

        # Print.
        $sum = $len - $frame_size + 1;
        for %table.sort: {$^b.value <=> $^a.value||$^a.key leg $^b.key} {
            printf "%s %.3f\n", .key, .value*100/$sum;
        }
        print "\n";
    }

    for <ggt ggta ggtatt ggtattttaatt ggtattttaatttatagt> -> $seq {
        %table = ();
        update_hash($seq.chars);
        printf "%3d\t$seq\n", (%table{$seq} || 0);
    }

    # Procedure to update a hashtable of k-nucleotide keys and count values
    # for a particular reading-frame.
    sub update_hash($frame_size) {
        for 0..($len - $frame_size) -> $i {
            %table{$sequence.substr($i,$frame_size)}++;
        }
    }
}

# vim: expandtab shiftwidth=4 ft=perl6
