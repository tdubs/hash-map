#!/usr/bin/perl
#
# to install module use
# cpan Text::CSV::Hashify
#
# 
# IMPORTANT ### The first file 'pass_file'
# is a csv file which must have heading of
# hash,password
# these should be the first two values
#
$pass_file = $ARGV[0];
$hash_file = $ARGV[1];

use Text::CSV;
use Text::CSV::Hashify;

if ( @ARGV != 2 )
{
print " -= Hash Map =-\n";
print "useage: $0 cracked.txt hashes.txt\n";
print "cracked.txt: hashes and clear text password\n";
print "hashes.txt: original userid and hash file\n";
print "\n**Special Note**\ncracked.txt must have heading of:\n";
print "hash:password\n\n";
exit;
}

print "[+] Opening Pass File $pass_file\n";
print "[+] Opening Original Hash File $hash_file\n";

$obj = Text::CSV::Hashify->new( {
 sep_char => ':',
 file => $pass_file,
 key => 'hash' } );

$hash_ref = $obj->all;
 
open(my $data, '<', $hash_file) or die "Could not open '$hash_file' $!\n";

# hash_file format
# USERID:SID:LMHASH:NTLMHASH

# For each line in the Hash file 
# which is the file USERID:HASH 
while (my $line = <$data>) {

# if ($line != "" )
chomp($line);
  @fields = split ":", $line;
  $user = $fields[0];
  $hash = $fields[1];

 #print "[D] Searching for key: $hash\n";
  # datum( value of key, field )
  if ( $pass = $obj->datum( $hash, 'password')  )
  {
    print "$line,$pass\n";
  }
  else
  {
   #  print "NOMATCH, $line with $nthash\n";
   }
}


