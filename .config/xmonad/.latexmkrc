# Use subroutine to do preprocessing and running pdflatex
$pdflatex = 'internal mylatex %B %O';
sub mylatex {
  my $base = shift @_;
  my $tex = "$base.tex";

  # Run the preprocessor
  system('lhs2TeX', '--poly', '-o', $tex, "$base.lhs") == 0 or return $?;
  # Run pdflatex
  my $return = system('pdflatex','-output-directory','./LaTeX-build', @_, $tex);
  system "echo INPUT $base.lhs >> $aux_dir1$base.fls";
  return $return;
}

