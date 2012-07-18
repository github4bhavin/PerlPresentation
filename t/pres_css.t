use Test::More;
use Data::Dumper;

use Presentation::CSS;

my $obj = new_ok( 'Presentation::CSS' );

 $obj->class_slide(
   				'background-color' 	=> '#2f96b4',
   				'width'				=> '800px',
   				'height'			=> '600px',
   				'color'				=> 'white',
   				'box-shadow'		=> '0 0 5px #999'
   			);

print Dumper $obj->class_slide();
print Dumper $obj->generate_style();

done_testing();