use bignum;
my $input_file=$ARGV[0];
my $digits=5;
my @digits_space = (1 .. $digits);
my @tmp_space = (1 .. $digits);
open(my $file_handle, "<", $input_file) or die "cannot open < $input_file: $!";
# loop line by line until EOF
my $index=0;
my $max_five_digit_product=1;
my $pre_char=0;

while(<$file_handle>) {
    chomp;# remove newline
    #split line in a char array
    my @chars = split / */; 
    #loop char by char
    for my $char(@chars) {

	for (my $k=0;$k<$digits;$k++) {
		$tmp_space[$k]=$digits_space[$digits-$k-1];
	}
	$digits_space[$digits-1]=(ord($char)-ord("0"));
	for (my $k=1;$k<$digits;$k++) {
		$digits_space[$digits-$k-1]=$tmp_space[$k-1];
	} 
	if ($index>=$digits-1) {
		my $five_digit_product=1;
		for (my $j=0;$j<$digits;$j++) {
			$five_digit_product *= $digits_space[$j];
		}
		if ($five_digit_product>$max_five_digit_product) { $max_five_digit_product = $five_digit_product; }
	}
        $index++;
	print join(" --- ",@digits_space),"\n";
    }
} 
print $max_five_digit_product,"\n";
# close the file
close $file_handle or die "$file_handle: $!";
