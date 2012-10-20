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
  						  body   => { bullet => ( 1 => abc1 ,
  						                          2 => abc2 ) 
  						             }
  						 });
  foreach my $i ( 1 .. 10 ) {						 
  $obj->add_slide(
  			content => { header => 'Slide '.$i,
  						 body   => { bullet => {  numbered => 1,
  						                          data => (  'look at the results',
  						 						             '50% down',
  						 						             'how come',
  						 						             'abc' 
  						 						          )
  						 						},
  						 			 bullet => { symbol => '*',
  						 			             data => ( 'point1', 
  						 			                       'point2'
  						 			                      )
  						 			           }
  						 						
  						 			}
  						}
  				);
  	}			
  
  my $html = $obj->generate_html('../pres.html');
  ok( defined  $html, 'generate html' );
  diag ( Dumper $obj->{slides} );
  diag ( Dumper $html );
 
done_testing();
