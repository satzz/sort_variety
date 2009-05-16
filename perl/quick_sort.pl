use strict;
use warnings;

my $trials = 20;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join ("\t", @target) . "\n";

@target = qsort(@target);

print join ("\t", @target) . "\n";

sub qsort {
  my @ary = @_;
  return @ary if $#ary < 0;
  my $pivot = shift @ary;
  (qsort(grep {$_ < $pivot} @ary), $pivot, qsort(grep {$_ > $pivot} @ary));
}
