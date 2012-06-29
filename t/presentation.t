use Test::More;
use Data::Dumper;
BEGIN{
	use_ok ( 'lib' );
};

use lib qw { /Users/bhavinpatel/Documents/Development/githubProjects/PerlPresentation_Prj };

use Presentation;

my $obj = new_ok( 'Presentation' );
  ok ( $obj->{title} eq 'untitled0' , 'title' );
  ok ( $obj->{no_of_slides} == 0 , 'Number of Slides' );
  ok ( defined $obj->add_html_head() , 'add html head' );
  
  print  Dumper $obj->{html};
  
  diag ( Dumper $html );
 
  $obj->add_slide(content=>'slide1
  					Name : bhavin');
  $obj->add_slide(content=>'slide2', 'data-x' => 1000);
  $obj->add_slide(content=>'slide3', 'data-x' => 2000);
  $obj->add_slide(content=>'slide4', 'data-x' => 3000);


  my $html = $obj->generate_html('../pres.html');
  ok( defined  $html, 'generate html' );
  diag ( Dumper $obj->{slides} );
  diag ( Dumper $html );
 
done_testing();