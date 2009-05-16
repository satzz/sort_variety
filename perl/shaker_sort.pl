use strict;
use warnings;
my $trials = 15;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join("  ", @target);
print "\n";

@target = shaker_sort(@target);

sub shaker_sort {
  my @ary = @_;
  my ($begin, $end) = (0, $#ary);
  my $flag = 1;
  while($flag) {
    undef $flag;
    my $temp = $end;
    for my $i ($begin..$end-1) {
      next if $ary[$i] < $ary[$i+1];
      ($ary[$i], $ary[$i+1]) = ($ary[$i+1], $ary[$i]);
      $temp = $i;
      $flag = 1;
      print join("  ", @ary);
      print "\n";
    }
    $end = $temp;
    $temp = $begin;
    for my $i (reverse $begin+1..$end) {
      next if $ary[$i-1] < $ary[$i];
      ($ary[$i-1], $ary[$i]) = ($ary[$i], $ary[$i-1]);
      $temp = $i;
      $flag = 1;
      print join("  ", @ary);
      print "\n";
    }
    $begin = $temp;
  }
  @ary;
}
