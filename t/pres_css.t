use Test::More;
use Data::Dumper;
use lib qw { ../ };
use Presentation::CSS;

my $obj = new_ok( 'Presentation::CSS' );

can_ok ( $obj, ('make_style_simple' ,
				'css_type',
				'class_slide',
				'class_slide_header',)
		);

    $obj->class_slide_header(
    			'font-size' => '30px',
    		);
    
my $slide_header = $obj->class_slide_header();
ok ( defined( $slide_header ) , 'generate slide header css');
diag Dumper $obj->class_slide_header();

my $css = $obj->css_type( 'simple' )->generate_style();

ok ( defined ( $css ) , 'generate simple style' );


done_testing();