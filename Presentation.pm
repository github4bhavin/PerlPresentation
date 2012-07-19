package Presentation;
use Presentation::CSS;
our $VERSION = '0.1';
sub new {
 my $class = shift;
 my $self = {@_};
	bless $self , $class;
	$self->{ title        } ||= 'untitled0';
	$self->{ no_of_slides } ||= 0;
	$self->{ impressJS    } ||= 'JS/impress.js';
	$self->{ jqueryJS     } ||= 'JS/jquery.js';
	$self->{ html         } = { head =>'', body=> '' , script =>''};
	$self->{ class } = 'slide step';
	$self->{ slides };
	$self->{ type   } = 'horizontal-line';
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
     $hash->{ 'content' }->{header} ||= 'Header slide'.$self->{ no_of_slides};
     $hash->{ 'content' }->{body}   ||= 'slide body';
     $self->{ no_of_slides }++;
     $self->{ slides }->{ $self->{ no_of_slides } } = $hash ;
     if ( $self->{slides}->{ 'max-data-scale' } < $hash->{ 'data-scale' } )
        { $self->{slides}->{ 'max-data-scale' } = $hash->{ 'data-scale' }; }
}

sub add_html_head {
  my $self = shift;
  my $css = new Presentation::CSS();
     $self->{html}->{head} = '<style type="text/css">' . $css->css_type( 'simple' )->generate_style() . '</style>';     
	 $self->{html}->{head} = $self->{html}->{head} . '<style>.body{background-color:#ccc;}</style>';
}

sub apply_type {
  my ($self) = @_;
  if ( $self->{type} eq 'horizontal-line' ) 
     { 	my $xdata = 0;
         my $xdata_step = 1000;
         my $preview_data_x = 0;
         my $preview_data_y = 0;
         my $preview_data_z = 0;
     		foreach my $slide ( 1 .. $self->{no_of_slides} ){
         	$self->{slides}->{$slide}->{'data-x'} = $xdata + $xdata_step;
         	$xdata=$self->{slides}->{$slide}->{'data-x'};
         	$preview_data_x += $self->{slides}->{$slide}->{'data-x'};
         	$preview_data_y += $self->{slides}->{$slide}->{'data-y'};
         	$preview_data_z += $self->{slides}->{$slide}->{'data-z'};         	         	
       	}#foreach
       	
       	#udpate preview slide
       	$self->{slides}->{$self->{no_of_slides}}->{'data-x'}= $preview_data_x/$self->{no_of_slides};
       	$self->{slides}->{$self->{no_of_slides}}->{'data-y'}= $preview_data_y/$self->{no_of_slides}; 
       	$self->{slides}->{$self->{no_of_slides}}->{'data-z'}= $preview_data_z/$self->{no_of_slides};       	      	
     }#if

}

sub add_html_body {
  my $self = shift;
  my $ms;
     $self->add_preview();
     $self->apply_type();
  foreach my $slide ( 1 .. $self->{no_of_slides} ) {
  		$ms  .= '<div class="'.$self->{slides}->{$slide}->{class} .'"';
  		$ms .= ' data-x="'. $self->{slides}->{$slide}->{'data-x'} .'"';
  		$ms .= ' data-y="'. $self->{slides}->{$slide}->{'data-y'} .'"';
  		$ms .= ' data-z="'. $self->{slides}->{$slide}->{'data-z'} .'"';  		  		
  		$ms .= ' data-scale="'. $self->{slides}->{$slide}->{'data-scale'} .'"';  		
  		$ms .= '>';
  		if ( $self->{slides}->{$slide}->{'content'}->{header} ) 
  		{ $ms .= '<div class="slide_header" >' .$self->{slides}->{$slide}->{'content'}->{header} .'</div>'; }

  		if ( ref ($self->{slides}->{$slide}->{content}->{body}) eq 'SCALAR' )
  		{ $ms .= '<div class="slide_body"   >' . $self->{slides}->{$slide}->{'content'}->{body} .'</div>' ; 
  		}


  		if ( ref ($self->{slides}->{$slide}->{content}->{body}->{bullet}) eq 'HASH' )
  		{  $ms .= '<div class="bullet_table">';
  		   map { $ms .= '<div class="bullet_line">';
  		         $ms .= '<div class="bullet_no">' . $_ . '</div>';
  		         $ms .= '<div class="bullet_content">' . $self->{slides}->{$slide}->{content}->{body}->{bullet}->{$_}.'</div>';
  		         $ms .= '</div>';  
  		       } keys ( %{ $self->{slides}->{$slide}->{content}->{body}->{bullet} } );
  		   $ms .= '</div>';     
  		}
  		  		
  		$ms .= '</div>';
  }
  $self->{html}->{body} = '<div id="impress">' . $ms . '</div>';
}

sub add_preview {
  my $self = shift;
  my $hash;    
     $hash->{ 'data-x' } = 0;
     $hash->{ 'data-y' } = 0;
     $hash->{ 'data-z' } = 0;
     $hash->{ 'data-scale'    } = $self->{slides}->{'max-data-scale'} + $self->{no_of_slides};
     $hash->{ 'data-rotate'   } = 0;
     $hash->{ 'data-rotate-x' } = 0;
     $hash->{ 'data-rotate-y' } = 0;
     $hash->{ 'data-rotate-z' } = 0;
     $hash->{ 'content'       }->{heaader} = '';     
     $hash->{ 'class'         }  = 'step';
     $hash->{ 'content'       }->{body} = '';
     $self->{ no_of_slides    }++;
     $self->{ slides }->{ $self->{ no_of_slides } } = $hash ;

}

sub generate_html {
  my ( $self, $filename ) = @_;
  $self->add_html_head;
  $self->add_html_body;
  my $htmlpage = <<HTML 
<!DOCTYPE html>
<html> 
        <head> <title> $self->{title} </title>
               $self->{html}->{head} 
        </head>
        <body> $self->{html}->{body}
        <script src="$self->{impressJS}"></script>
        <script src="$self->{jqueryJS}"></script>
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