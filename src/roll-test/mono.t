#!/usr/bin/perl -w
# mono roll installation test.  Usage:
# mono.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/mono';
my $output;

my $TESTFILE = 'tmpmono';

open(OUT, ">$TESTFILE.cs");
print OUT <<END;
class Foo {
  public static void Main() {
    System.Console.WriteLine("Hello world");
  }
}
END

# mono-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'mono installed');
} else {
  ok(! $isInstalled, 'mono not installed');
}
SKIP: {

  skip 'mono not installed', 7 if ! $isInstalled;
  my $modulesInstalled = -f '/etc/profile.d/modules.sh';
  my $setup = $modulesInstalled ?
              ". /etc/profile.d/modules.sh; module load mono" :
              'echo > /dev/null'; # noop

  $output = `$setup; mcs -o $TESTFILE $TESTFILE.cs 2>&1`;
  ok($? == 0, 'mono C# compiler works');
  $output = `$setup; mono ./$TESTFILE`;
  ok($? == 0, 'compiled C# program runs');
  like($output, qr/Hello world/, 'compiled C# program correct output');

  $output = `$setup; man mcs 2>&1`;
  ok($output =~ /Mono C#/, 'man works for mono');
  
  skip 'modules not installed', 3 if ! $modulesInstalled;
  `/bin/ls /opt/modulefiles/compilers/mono/[0-9.]* 2>&1`;
  ok($? == 0, 'mono module installed');
  `/bin/ls /opt/modulefiles/compilers/mono/.version.[0-9.]* 2>&1`;
  ok($? == 0, 'mono version module installed');
  ok(-l '/opt/modulefiles/compilers/mono/.version',
     'mono version module link created');

}

`rm -f $TESTFILE*`;
