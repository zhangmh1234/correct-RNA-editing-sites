use strict;
my @file=glob "*.txt";
open (ER,">G.erro.txt1") or die;
for (my $i=0;$i<=$#file;$i++)
{
	#print "$file[$i]\n";
my $name=$file[$i]=~s/\.txt//rg;

open (PO,"$file[$i]") or die;
open (SEQ,"$name.fasta") or die;
my %hash;
open (OUT,">$name.substitution.fasta") or die;
my $seq;
while (<PO>)
{
chomp;
$hash{$_}++;
}
while (<SEQ>)
{
chomp;
if ($_=~/^>/)
{print OUT "$_\n"}
else 
{
$seq=$seq.$_;
}
}
my @arr=split(//,$seq);
for (my $i=0;$i<=$#arr;$i++)
{
my $j=$i+1;
if (exists $hash{$j})
{
print OUT "T";
#if ($arr[$i]!~/C/){print ER "$name\t$j\t$arr[$i]\n"}
}
else {print OUT "$arr[$i]"}
}
}