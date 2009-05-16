use strict;
use warnings;
my $trials = 15;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

print join("  ", @target);
print "\n";

@target = isort(@target);


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
    print join("  ", @ret);
    print "\n";
  }
  @ret;
}
