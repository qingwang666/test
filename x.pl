#!/usr/bin/perl
#use warnings;

open (IN, "hh");
@data = <IN>;

####### to generate a 2-D matrix ######
@all = ();
foreach $i (0..$#data)
{
    @ab = split /\t/, $data[$i];
    foreach $j (0..$#ab)
    {
        $all[$i][$j] = $ab[$j];
    }
}
######################################
foreach $i (0..$#all)
{
    foreach $j (0..$#{$all[$i]})
    {
        $lig = $all[$i][$j];	# any chembl ID
        if ($lig =~ /CHEMBL/)
        {
            $ck = 0;		# check number
            foreach $m (0..$#{$all[0]})	# every column	
            {
                foreach $n (0..$#all)	# every row
                {
                    if ($lig eq $all[$n][$m])
                    {
                        $ck ++;
                        last;
                    }
                }
            }

            print "$lig happens $ck times !\n";
        }
    }
}
