use Test::More;
use Data::Dumper;
BEGIN{
	use_ok ( 'lib' );
};

use lib qw { ../};

use Presentation;

my $obj = new_ok( 'Presentation' );
  ok ( $obj->{title} eq 'untitled0' , 'title' );
  ok ( $obj->{no_of_slides} == 0 , 'Number of Slides' );
  ok ( defined $obj->add_html_head() , 'add html head' );
  
  print  Dumper $obj->{html};
  
  diag ( Dumper $html );
 
  $obj->add_slide(
  			content=>{ header => 'Introduction' ,
  						  body   => { bullet => { 1 => abc1 ,
  						                          2 => abc2 } 
  						             }
  						 });
  $obj->add_slide(
  			content => { header => 'Topic A',
  						 body   => { bullet => { a => 'look at the results',
  						 						 b => '50% down',
  						 						 c => 'how come' }
  						 			}
  						}
  				);
  
  my $html = $obj->generate_html('../pres.html');
  ok( defined  $html, 'generate html' );
  diag ( Dumper $obj->{slides} );
  diag ( Dumper $html );
 
done_testing();
