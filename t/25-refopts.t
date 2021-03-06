use strict;
use warnings;
use Test::More;
use System::Command;

my @cmd = ( $^X, '-eexit+shift' );
my @codes = ( 0 .. 2, 127 .. 129 );

plan tests => 2 * @codes;

for my $code ( @codes ) {
    my $cmd = System::Command->new(@cmd, $code, { exit => \my $exit } );
    sleep 1 while !$cmd->is_terminated;
    is( $cmd->exit, $code, "\$cmd->exit is $code" );
    is( $exit, $code, "\$exit is $code" );
}
