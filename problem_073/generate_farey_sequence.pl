#100   'Code UBASIC pour engendrer une Suite de Farey d'ordre N dans l'ordre traditionnel
#110   N=7:NumTerms=1
#120   A=0:B=1:C=1:D=N
#140   print A;B
#150   while (C<N)
#160      NumTerms=NumTerms+1
#170      K=int((N+B)/D)
#180      E=K*C-A:F=K*D-B
#190      A=C:B=D:C=E:D=F:print A;B
#200   wend
#210   print NumTerms
#220   end
my $N=7;
my $NumTerms=1;
my $A=0;
my $B=1;
my $C=1;
my $D=$N;
print "$A/$B ";
while ($C<$N) {
  $NumTerms=$NumTerms+1;
  $K=int(($N+$B)/$D);
  $E=$K*$C-$A;
  $F=$K*$D-$B;
  $A=$C;
  $B=$D;
  $C=$E;
  $D=$F;
  print "$A/$B ";
}
print "\n";
print $NumTerms;
print "\n";
