use strict;
use warnings;
my $trials = 25;
my %h = map { int rand $trials => 1 } 1..$trials;
my @target = keys %h;

@target = shear_sort(@target);

sub shear_sort {
  my @ary = @_;
  my $element_num = $#ary + 1;
  my $column_num;
  while (++$column_num ** 2 < $element_num) {};

  for (0..$column_num) {
    box_print($column_num, @ary);
    my $last = $_ == $column_num;
    my @temp;
    for my $row_index (1..$column_num) {
      my @row = qsort( grep {defined} map {shift @ary} 1..$column_num );
      @temp = (@temp, (($row_index & 1) or $last) ? @row : reverse @row);
    }
    @ary = @temp;
    box_print($column_num, @ary);
    last if $last;

    my @columns = ([]) x $column_num;
    for my $element_index(0..$element_num-1) {
      my $column_index = $element_index % $column_num;
      $columns[$column_index] = [@{ $columns[$column_index] }, shift @ary];
    }
    @columns = map { [qsort(@{$_})] } @columns;
    @ary = map { shift @{ $columns[$_ % $column_num] } } 0..$element_num-1;
  }
  @ary;
}

sub qsort {
  my @ary = @_;
  return @ary if $#ary < 0;
  my $pivot = shift @ary;
  (qsort(grep {$_ < $pivot} @ary), $pivot, qsort(grep {$_ > $pivot} @ary));
}

sub box_print {
  my $column_num = shift;
  my $index;
  print join("  ", map {$index++ % $column_num ? "\t$_": "\n$_"} @_);
  print "\n";
}
