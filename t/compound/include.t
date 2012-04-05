use strict;
use warnings;
use Test::More;

{
    package Test::FooField;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Field::Compound';

    has_field 'foo';
    has_field 'bar';
    has_field 'box';
    has_field 'mix';
    has_field 'nix';

}

my $field = Test::FooField->new( name => 'muddly' );
ok( $field );

{
    package Test::Form;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler';

    has_field 'fiddly';
    has_field 'muddly' => ( type => '+Test::FooField', include => ['foo', 'mix', 'nix'] );
}

my $form = Test::Form->new;
ok( $form );
is( $form->field('muddly')->num_fields, 3, 'right number of fields' );

done_testing;
