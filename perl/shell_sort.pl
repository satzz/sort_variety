use strict;
use warnings;
my $trials = 30;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join("  ", @target);
print "\n";

@target = shell_sort(@target);

print join("  ", @target);
print "\n";

sub shell_sort {
  my @ary = @_;
  my $max_index = $#ary;
  my $interval = $max_index >> 1;
  while ($interval) {
    my $key = 0;
    my @h = ( [] ) x $interval;
    while (1) {
      my $shift = shift @ary;
      defined $shift or last;
      $h[$key] = [@{ $h[$key] }, $shift];
      $key++;
      $key %= $interval;
    }
    $h[$_] = [isort(@{ $h[$_] })] for 0..$interval-1;
    push @ary, (shift @{ $h[$_ % $interval] }) for 0..$max_index;
    print join("  ", map { ( $_ %  $interval ? '  ' : '| ') . $ary[$_] } 0..$max_index);
    print " (interval : $interval) \n";
    $interval >>= 1;
  }
  @ary;
}

sub isort {
  my @ary = @_;
  my @ret = (shift @ary);
  while (1) {
    my $element = shift @ary;
    defined $element or last;
    my @temp;
    while (1) {
      my $shift = shift @ret;
      unless (defined $shift) {
        @temp = (@temp, $element);
        last;
      }
      if ($shift < $element) {
        @temp = (@temp, $shift);
      }
      else {
        @temp = (@temp, $element, $shift, @ret);
        last;
      }
    }
    @ret = @temp;
  }
  @ret;
}
