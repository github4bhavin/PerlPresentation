use Test::More;
use Data::Dumper;

use Presentation::CSS;

my $obj = new_ok( 'Presentation::CSS' );

  print Dumper  $obj->class_slide(
   				'background-color' 	=> '#2f96b4',
   				'width'				=> '800px',
   				'height'			=> '600px',
   				'color'				=> 'white',
   				'box-shadow'		=> '0 0 5px #999'
   			);



done_testing();