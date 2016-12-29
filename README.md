# hash map tool

 A very simple tool to map cracked passwords back
 to usernames after you've cracked them. The package
 includes two sample files (cracked.txt and hashes.txt) as examples. Be sure to check
 them as the formats must be the same!
 Special note, you must specify the proper heading for the
 cracked password file. Heading is:
 hash,password

# Necessary libraries:
cpan Text::CSV::Hashify

# Example Usage:
```
user@linux:/# ./hash.map.pl cracked.txt hashes.txt 
[+] Opening Pass File cracked.txt
[+] Opening Original Hash File cracked.txt
user1:11111,userpass1
user2:22222,userpass2
user3:33333,userpass3
user4:44444,userpass4
user5:55555,userpass5

user@linux:/# 
```
