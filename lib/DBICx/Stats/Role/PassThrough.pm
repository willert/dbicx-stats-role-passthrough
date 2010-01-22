package DBICx::Stats::Role::PassThrough;
# ABSTRACT: Role for DBIC stats objects that want to do pass-through

use Moose::Role;

our $VERSION = '0.00_01';

=head1 NAME

DBICx::Stats::Role::PassThrough

=head1 DESCRIPTION

B<DBICx::Stats::Role::PassThrough> is a L<Moose::Role>
that provides consumers with a standard way to pass through
log messages.

=cut

has 'pass_through' => ( is => 'ro' );

sub svp_begin {}

after 'svp_begin' => sub {
  my $self = shift;
  $self->pass_through->svp_begin( @_ ) if $self->pass_through;
};

sub svp_release {}

after 'svp_release' => sub {
  my $self = shift;
  $self->pass_through->svp_release( @_ ) if $self->pass_through;
};

sub svp_rollback {}

after 'svp_rollback' => sub {
  my $self = shift;
  $self->pass_through->svp_rollback( @_ ) if $self->pass_through;
};

sub txn_begin {}

after 'txn_begin' => sub {
  my $self = shift;
  $self->pass_through->txn_begin( @_ ) if $self->pass_through;
};

sub txn_rollback {}

after 'txn_rollback' => sub {
  my $self = shift;
  $self->pass_through->txn_rollback( @_ ) if $self->pass_through;
};

sub txn_commit {}

after 'txn_commit' => sub {
  my $self = shift;
  $self->pass_through->txn_commit( @_ ) if $self->pass_through;
};

sub query_start {}

after 'query_start' => sub {
  my $self = shift;
  $self->pass_through->query_start( @_ ) if $self->pass_through;
};

sub query_end {}

after 'query_end' => sub {
  my $self = shift;
  $self->pass_through->query_start( @_ ) if $self->pass_through;
};

1;

