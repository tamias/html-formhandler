package HTML::FormHandler::Field::Display;

use Moose;
extends 'HTML::FormHandler::Field';

=head1 NAME

HTML::FormHandler::Field::Display - display only

=head1 SYNOPSIS

This is the base class for the Submit field. It can be used for fields that
are display only. It should not be used for fields that produce a value or
need validating.

   has_field 'explain' => ( type => 'Display', value => 'Please pick a date and a time' );

=cut

has 'has_static_value' => ( is => 'ro', default => 1 );
has 'value' => (
   is        => 'rw',
   predicate => 'has_value',
);
sub _result_from_object {  }
sub _result_from_fields {  }
sub _result_from_input {  }
sub fif { }

has '+widget'    => ( default => 'display' );
has '+writeonly' => ( default => 1 );
has '+noupdate'  => ( default => 1 );

sub validate_field { }

sub clear_value { }

__PACKAGE__->meta->make_immutable;
no Moose;
1;
