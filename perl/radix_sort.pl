use strict;
use warnings;
use Data::Dumper;
my $trials = 40;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join("  ", @target);
print "\n";

@target = radix_sort(@target);

sub radix_sort {
  my @tupples = map { [$_, $_] } @_;
  my $flag = 1;
  while ($flag) {
    my @buckets;
    $flag = 0;
    for my $tupple (@tupples) {
      my ($copy, $original) = @$tupple;
      my $key = 1 & $copy;
      $flag |= $key;
      $buckets[$key] ||= [];
      push @{ $buckets[$key] }, [$copy >> 1, $original];
    }
    @tupples = map { @{$_} } grep { defined } @buckets;
    print join("  ", map { $_->[1] } @tupples);
    print "\n";
  }
  map { $_->[1] } @tupples;
}
