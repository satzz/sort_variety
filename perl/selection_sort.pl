use strict;
use warnings;
my $trials = 20;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join("  ", @target);
print "\n";

@target = sel_sort(@target);

sub sel_sort {
  my @ary = @_;
  for my $i (0..$#ary-1) {
    my $min = $i;
    for my $j ($i+1..$#ary) {
      $min = $j if $ary[$min] > $ary[$j];
    }
    ($ary[$i], $ary[$min]) = ($ary[$min], $ary[$i]);
    print join("  ", @ary);
    print "\n";
  }
  @ary;
}
