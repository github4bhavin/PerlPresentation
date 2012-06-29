package Presentation;
our $VERSION = '0.1';
sub new {
 my $class = shift;
 my $self = {@_};
	bless $self , $class;
	$self->{ title        } ||= 'untitled0';
	$self->{ no_of_slides } ||= 0;
	$self->{ impressJS    } ||= 'JS/impress.js';
	$self->{ html         } = { head =>'', body=> '' , script =>''};
	$self->{ class } = 'slide step';
	$self->{ slides };
	$self->{slides}->{ 'max-data-scale' } = 0;
	$self->add_html_head();
	return $self;
}


sub add_slide {
  my $self = shift;
  my $hash = {@_};
     $hash->{ class } = $self->{ class };
     $hash->{ 'data-x' } ||= 0;
     $hash->{ 'data-y' } ||= 0;
     $hash->{ 'data-z' } ||= 0;
     $hash->{ 'data-scale'   } ||= 1;
     $hash->{ 'data-rotate'  } ||= 0;
     $hash->{ 'data-rotate-x' } ||= 0;
     $hash->{ 'data-rotate-y' } ||= 0;
     $hash->{ 'data-rotate-z' } ||= 0;

     $hash->{ 'content'     } ||= 'slide'.$self->{ no_of_slides};
     $self->{ no_of_slides }++;
     $self->{ slides }->{ $self->{ no_of_slides } } = $hash ;
     if ( $self->{slides}->{ 'max-data-scale' } < $hash->{ 'data-scale' } )
        { $self->{slides}->{ 'max-data-scale' } = $hash->{ 'data-scale' }; }
}

sub add_html_head {
  my $self = shift;
     $self->{html}->{head} = <<STYLE
<style type="text/css">
.slide{
	border: 1px solid black;
	background-color: #ccc;
}
</style>
STYLE
;     
     1;
}

sub add_html_body {
  my $self = shift;
  my $ms;
     $self->add_preview();
  foreach my $slide ( 1 .. $self->{no_of_slides} ) {
  		$ms  .= '<div class="'.$self->{slides}->{$slide}->{class} .'"';
  		$ms .= ' data-x="'. $self->{slides}->{$slide}->{'data-x'} .'"';
  		$ms .= ' data-y="'. $self->{slides}->{$slide}->{'data-y'} .'"';
  		$ms .= ' data-z="'. $self->{slides}->{$slide}->{'data-z'} .'"';  		  		
  		$ms .= ' data-scale="'. $self->{slides}->{$slide}->{'data-scale'} .'"';  		
  		$ms .= '>';
  		$ms .= $self->{slides}->{$slide}->{'content'};
  		$ms .= '</div>';
  }
  $self->{html}->{body} = '<div id="impress">' . $ms . '</div>';
}

sub add_preview {
  my $self = shift;
  my $hash;
     $hash->{ class } = 'step';     
     $hash->{ 'data-x' } = 3000;
     $hash->{ 'data-y' } = 0;
     $hash->{ 'data-z' } = 0;
     $hash->{ 'data-scale'    } = $self->{slides}->{'max-data-scale'} + $self->{no_of_slides};
     $hash->{ 'data-rotate'   } = 0;
     $hash->{ 'data-rotate-x' } = 0;
     $hash->{ 'data-rotate-y' } = 0;
     $hash->{ 'data-rotate-z' } = 0;
     $hash->{ 'content'       } = '';
     $self->{ no_of_slides    }++;
     $self->{ slides }->{ $self->{ no_of_slides } } = $hash ;

}

sub generate_html {
  my ( $self, $filename ) = @_;
  $self->add_html_head;
  $self->add_html_body;
  my $htmlpage = <<HTML 
<html> 
        <head> <title> $self->{title} </title>
               $self->{html}->{head} 
        </head>
        <body> $self->{html}->{body}
        <script src="$self->{impressJS}"></script>
        <script>impress().init();</script>
        </body>
   </html>
HTML
;   
   if ($filename){
   	open my $FH , '>' , $filename || eval { print"\n unable to write"; return undef};
	print $FH $htmlpage;
   	close $FH;
   }
   return $htmlpage;
   1;
}

1;