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
     $self->{slide}= {@_};
     return $self->{slide};
     return $self->{slide} unless $_;
}

# %class_slide_header class_slide_header({ppty=>val})
sub class_slide_header {
  my $self = shift;
     $self->{slide_header} = {@_};
     return $self->{slide_header} unless $_;
}

# %class_slide_body class_slide_body({ ppty => val })
sub class_slide_body {
  my $self = shift;
     $self->{slide_body} = {@_};
     return $self->{slide_body} unless $_;
}

# %class_bullet_no class_bullet_no({ ppty => val })
sub class_bullet_no {
  my $self = shift;
     $self->{bullet_no} = {@_};
     return $self->{bullet_no} unless $_;
}

# %class_bullet_table class_bullet_table({ ppty => val })
sub class_bullet_table {
  my $self = shift;
     $self->{bullet_table} = {@_};
     return $self->{bullet_table} unless $_;
}

# %class_bullet_content class_bullet_content({ ppty => val })
sub class_bullet_content {
  my $self = shift;
     $self->{bullet_content} = {@_};
     return $self->{bullet_content} unless $_;
}

# %class_bullet_line class_bullet_line({ ppty => val })
sub class_bullet_line {
  my $self = shift;
     $self->{bullet_line} = {@_};
     return $self->{bullet_line} unless $_;
}

sub generate_style {
  my $self = shift;
  return    $self->class_slide();
}

1;
