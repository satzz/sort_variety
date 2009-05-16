use strict;
use warnings;

my $trials = 10;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join ("\t", @target) . "\n";

split_merge(0, $#target);

print join ("\t", @target) . "\n";

sub split_merge {
  my ($begin, $end) = @_;
  return if $begin == $end;
  my $middle = int(($begin + $end) / 2);
  split_merge($begin, $middle);
  split_merge($middle + 1, $end);
  merge($begin, $middle, $end);
}

sub merge {
  my ($x, $y, $z) = @_;
  my @ary1 = @target[$x .. $y];
  my @ary2 = @target[($y+1) .. $z];
  print "$_\t" for @target[0 .. $x-1];
  print "[";
  print join("\t", @ary1);
  print "]\t[";
  print join("\t", @ary2);
  print "]\t";
  print "$_\t" for @target[$z+1 .. $#target];
  print "\n";

  my @merged;
  while (1) {
    if ($#ary1 < 0){
      @merged = (@merged, @ary2);
      last;
    }
    elsif ($#ary2 < 0) {
      @merged = (@merged, @ary1);
      last;
    }
    else {
      my ($top1, $top2) = (shift @ary1, shift @ary2);
      if ($top1 < $top2) {
        @merged = (@merged, $top1);
        @ary2 = ($top2, @ary2);
      }
      else {
        @merged = (@merged, $top2);
        @ary1 = ($top1, @ary1);
      }
    }
  }
  @target[$x .. $z] = @merged;
}
