package Presentation::CSS;
use parent qw{ Presentation };

our $VERSION = '0.1';

sub new{
  my $class = shift;
  my $self = {@_};
  bless $self , $class;
  $self->{slide} = '';
  $self->{slide_header} = '';
  $self->{slide_body} = '';
  $self->{bullet_no} = '';
  $self->{bullet_table} = '';
  $self->{bullet_content} = '';
  $self->{bullet_line} = '';
  return $self;
}

# %class_slide class_slide({ppty=>val})
sub class_slide {
  my $self = shift;
     return $self->{slide} unless @_;
     $self->{slide}= {@_};  
}

# %class_slide_header class_slide_header({ppty=>val})
sub class_slide_header {
  my $self = shift;
     return $self->{slide_header} unless @_;
     $self->{slide_header} = {@_};
}

# %class_slide_body class_slide_body({ ppty => val })
sub class_slide_body {
  my $self = shift;
     return $self->{slide_body} unless @_;  
     $self->{slide_body} = {@_};
}

# %class_bullet_no class_bullet_no({ ppty => val })
sub class_bullet_no {
  my $self = shift;
     return $self->{bullet_no} unless @_;  
     $self->{bullet_no} = {@_};
}

# %class_bullet_table class_bullet_table({ ppty => val })
sub class_bullet_table {
  my $self = shift;
     return $self->{bullet_table} unless @_;  
     $self->{bullet_table} = {@_};
}

# %class_bullet_content class_bullet_content({ ppty => val })
sub class_bullet_content {
  my $self = shift;
     return $self->{bullet_content} unless @_;  
     $self->{bullet_content} = {@_};
}

# %class_bullet_line class_bullet_line({ ppty => val })
sub class_bullet_line {
  my $self = shift;
     return $self->{bullet_line} unless @_;  
     $self->{bullet_line} = {@_};
}

# every thing to make simple css style
sub make_style_simple {
  my $self = shift;
  $self->class_slide(
  			'background-color' => '#2f96b4',
  			'width'	=> '800px',
  			'height' => '600px',
  			'box-shadow' => '0 0 5px #999',
  			'border-radius' => '10px',
  			'font-family' => 'helvetica Neue , Helvetica, Arial',
        );
  $self->class_slide_header(
  			'font-size' => '40px',
  			'border-bottom' => '3px solid #fff',
  			'border-radius' => '10px',
  			'box-shadow' => '0 0 3px #999',
  			'padding'  => '5px',
  			'color'    => '#eee',
  			'font-weight' => 'bold',
  			'font-family' => '"Times New Roman",Times,serif',
  		); 
  $self->class_slide_body (
  			'padding' => '5px',
  			'border-top' => '1px solid #ddd',
  			'border-radius' => '10px',
  			'box-shadow' => '0 0 3px #999',
  			'font-size' => '30px',
  			'width' => '99%',
  			'overflow' => 'auto',
  		);	
  $self->class_bullet_table ( 
  			'float' => 'left',
  			'padding' => '5px',
  			'margin' => '5px',
  			'width' => '100%',
  		);
  $self->class_bullet_no(	
  			'float' => 'left',
  			'padding' => '5px',
  			'margin' => '5px',
  		);
  $self->class_bullet_content(
  			'padding' => '5px',
  			'margin'  => '5px',
  		);
  $self->class_bullet_line( 
  			'float' => 'left',
  			'width'  => '95%',
  			'font-size' => '30px',
  			'color' => '#eee',
  		);			
}

# $object css_type( $type ) 
sub css_type {
  my $self = shift;
  my $type = shift;
  if ( $type eq 'simple' ){
  	 $self->make_style_simple();
  }
  $self;
}

sub generate_style {
  my $self = shift;
  my $css = '';
  my $slideH = $self->class_slide();
  my $slide_headerH = $self->class_slide_header();
  my $bullet_tableH = $self->class_bullet_table();
  my $bullet_noH    = $self->class_bullet_no();
  my $bullet_contentH = $self->class_bullet_content();
  my $bullet_lineH   = $self->class_bullet_line();
  
     #__slide class
     $css .= '.slide { ';
     foreach my $key ( keys %$slideH ) {
  		$css .= $key . ":" . $slideH->{$key} .';' ;
     }
     $css .= '}';
  
     #__slide header class
     $css .= '.slide_header { ';
     foreach my $key ( keys %$slide_headerH ) {
         $css .= $key . ':' . $slide_headerH->{$key}. ';';
     }
     $css .= '}';
     
     #__ bullet table class
     $css .= '.bullet_table {';
     foreach my $key ( keys %$bullet_tableH ) {
     	 $css .= $key . ':' . $bullet_tableH->{$key}. ';';
     }
     $css .= '}';
     
     #__ bullet no class
     $css .= '.bullet_no { ';
     foreach my $key ( keys %$bullet_noH ) {
     	  $css .= $key . ':' . $bullet_noH->{$key} . ';';
     }
     $css .= '}';
     
     #__ bullet content class
     $css .= '.bullet_content {';
     foreach my $key ( keys %$bullet_contentH ) {
     	  $css .= $key . ':' . $bullet_contentH->{$key} . ';' ;
     }
     $css .= '}';
     
     #__ bullet content class
     $css .= '.bullet_line {';
     foreach my $key ( keys %$bullet_lineH ) {
     	  $css .= $key . ':' . $bullet_lineH->{$key} . ';' ;
     }
     $css .= '}';
    return $css;
}

1;
