use strict;
use warnings;
my $trials = 10;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join("  ", @target);
print "\n";

@target = bubble_sort(@target);

sub bubble_sort {
  my @ary = @_;
  for my $i (reverse 0..($#ary-1)) {
    for my $j (0..$i) {
      next if $ary[$j] <= $ary[$j+1];
      ($ary[$j], $ary[$j+1] ) = ($ary[$j+1], $ary[$j] );
      print join("  ", @ary);
      print "\n";
    }
  }
  @ary;
}
