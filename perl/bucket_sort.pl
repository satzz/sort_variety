use strict;
use warnings;
my $trials = 30;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join("  ", @target);
print "\n";

@target = bucket_sort(@target);

print join("  ", @target);
print "\n";

sub bucket_sort {
  my @buckets;
  $buckets[$_] = 1 for @_;
  grep { defined $buckets[$_] } 0..$#buckets;
}
