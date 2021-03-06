package Message::Passing::AMQP::Role::HasAConnection;
use Moose::Role;
use namespace::autoclean;

with qw/
    Message::Passing::Role::HasAConnection
    Message::Passing::Role::HasHostnameAndPort
    Message::Passing::Role::HasUsernameAndPassword
/;

sub _default_port { 5672 }

has vhost => (
    is => 'ro',
    isa => 'Str',
    default => sub { '/' },
);

has verbose => (
    is => 'ro',
    isa => 'Bool',
    default => sub { 0 },
);

sub _connection_manager_class { 'Message::Passing::AMQP::ConnectionManager' }
sub _connection_manager_attributes { [qw/ username password hostname port vhost verbose /] }

1;

=head1 NAME

Message::Passing::AMQP::Role::HasAConnection - Implements the Message::Passing::Role::HasAConnection interface..

=head1 ATTRIBUTES

=head2 vhost

Gets passed to L<Message::Passing::AMQP::ConnectionManager>, defaults to '/'.

=head2 verbose

Gets passed to L<Message::Passing::AMQP::ConnectionManager>, defaults to false.

=head1 AUTHOR, COPYRIGHT AND LICENSE

See L<Message::Passing::AMQP>.

=cut
