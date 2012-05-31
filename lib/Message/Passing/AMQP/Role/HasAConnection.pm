package Message::Passing::AMQP::Role::HasAConnection;
use Moose::Role;
use namespace::autoclean;

has hostname => (
    is => 'ro',
    isa => 'Str',
    default => 'localhost',
);

has port => (
    is => 'ro',
    isa => 'Int',
    default => 6163,
);

has vhost => (
    is => 'ro',
    isa => 'Str',
    default => sub { '/' },
);

has [qw/ username password /] => (
    is => 'ro',
    isa => 'Str',
    default => 'guest',
);

with 'Message::Passing::Role::HasAConnection';
use Message::Passing::AMQP::ConnectionManager;
sub _build_connection_manager {
    my $self = shift;
    Message::Passing::AMQP::ConnectionManager->new(map { $_ => $self->$_() }
        qw/ username port password vhost hostname /
    );
}

1;

