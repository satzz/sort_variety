use strict;
use warnings;
my $trials = 20;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join("  ", @target);
print "\n";

@target = hsort(@target);

print join("  ", @target);
print "\n";

sub hsort {
  my @heap = heapify(@_);
  print join("  ", @heap);
  print "\n";
  return get_array(@heap);
}

sub get_array {
  my @ary = @_;
  my @ret;
  while (1) {
    my $min = shift @ary;
    last unless defined $min;
    push (@ret, $min);
    @ary = ($ary[$#ary], @ary[0..$#ary-1]);
    my $index = 0;
    while (1) {
      my $c1_index = $index * 2 + 1;
      my $c2_index = $index * 2 + 2;
      my $child1 = $ary[$c1_index] or last;
      my $child2 = $ary[$c2_index];
      my $c_index = (defined $child2 && ($child1 > $child2)) ? $c2_index : $c1_index;
      my ($this, $child) = ($ary[$index], $ary[$c_index]);
      last if $this < $child;
      ($ary[$index], $ary[$c_index]) = ($child, $this);
      $index = $c_index;
    }
  }
  @ret;
}

sub heapify {
  my @ary = @_;
  for my $counter (0 .. $#ary) {
    my $this = $ary[$counter];
    my $index = $counter;
    while ($index) {
      my $p_index = ($index - 1) >> 1;
      my $parent = $ary[$p_index];
      last if $parent < $this;
      ($ary[$p_index], $ary[$index]) = ($this, $parent);
      $index = $p_index;
    }
  }
  @ary;
}
