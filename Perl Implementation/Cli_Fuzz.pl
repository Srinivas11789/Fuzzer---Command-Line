#!/usr/bin/perl
use Net::Telnet ();

# Jerry Command Outputs stored in file commands.txt
my $file = 'D:\users\sganeshbabu\Commands.txt';
#my $input0 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
#my @command;

# FUZZ Inputs
#my $input1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"; 
#52 char input
#my $input2 = "!@#\$\%^&*()_+}{\"><?/.,;'[]=-|\1234567ABC"; 
#Combination of numbersspl chars and alphabets
#my $input3 = "1234567890"; 
# Number only inputs
#my $input4 = ""; 
# Empty input
# Long input
#my $input5 = "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff";

@inputs = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", "!@#\$\%^&*()_+}{\"><?/.,;'[]=-|\1234567ABC", "1234567890" , "" , "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
my @strings1;

open (FILE, "$file") || die "Can't open File.txt: $!\n";
   my @strings = <FILE>;
   close(FILE);

for (my $i=0; $i<=5; $i=$i+1) {
print "$strings[$i]\n"; 
 }
 
for (my $i=0; $i<=5; $i=$i+1) {
  ($strings[$i]) = ($strings[$i] =~ /([^:]*)>.*/);
 }
 
for (my $i=0; $i<=5; $i=$i+1) {
print "$strings[$i]\n"; 
 }


for (my $i=0; $i<=5 ; $i++) {
$input = $inputs[$i];
print "The Input Selected is $input\n";

for (my $i=0; $i<=5 ; $i++) {
#print "i is $i and input is \$input$i";
#print "The Input Selected first is $input";
($strings1[$i] = $strings[$i]) =~ s![(^<)*]\S+!$input!mge; 
}
 
for (my $i=0; $i<=5; $i=$i+1) {
#print "$strings[$i]\n"; 
print "$strings1[$i]\n"; 
}

my $lines = "create vlan v3";
$t = new Net::Telnet (Timeout => 10);
$t->open('10.127.6.133');
$t->login(admin1, admin1);
for (my $i=0; $i<=5; $i=$i+1) {
$t->cmd($strings1[$i]);
}
}