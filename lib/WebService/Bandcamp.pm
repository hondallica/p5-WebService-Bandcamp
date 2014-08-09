package WebService::Bandcamp;
use JSON::XS;
use Cache::LRU;
use Net::DNS::Lite;
use Furl;
use URI;
use URI::QueryParam;
use Carp;
use Moo;
use namespace::clean;
our $VERSION = "0.01";

$Net::DNS::Lite::CACHE = Cache::LRU->new( size => 512 );

has 'api_key' => (
    is => 'rw',
    isa => sub { $_[0] },
    required => 1,
    default => $ENV{BANDCAMP_API_KEY},
);

has 'http' => (
    is => 'rw',
    required => 1,
    default  => sub {
        my $http = Furl::HTTP->new(
            inet_aton => \&Net::DNS::Lite::inet_aton,
            agent => 'Net::LastFM::Lite' . $VERSION,
            headers => [ 'Accept-Encoding' => 'gzip',],
        );
        $http->env_proxy;
        return $http;
    },
);


sub search {
    my ($self, %query_param) = @_;
    return $self->_make_request('api/band/3/search', \%query_param);
}

sub discography {
    my ($self, %query_param) = @_;
    return $self->_make_request('api/band/3/discography', \%query_param);
}

sub info {
    my ($self, %query_param) = @_;
    return $self->_make_request('api/band/3/info', \%query_param);
}

sub _make_request {
    my ( $self, $path, $query_param ) = @_;

    my $query_string = URI->new;
    $query_string->query_param( 'key', $self->api_key );
    map {
        $query_string->query_param( $_, $query_param->{$_} )
    } keys %$query_param;

    my ($minor_version, $code, $message, $headers, $content) = 
    $self->http->request(
        scheme => 'http',
        host => 'api.bandcamp.com',
        path_query => "$path$query_string",
        method => 'GET',
    );

    my $data = decode_json( $content );

    if ( defined $data->{error} ) {
        my $code = $data->{error};
        my $message = $data->{message};
        confess "$code: $message";
    } else {
        return $data;
    }
}


1;
__END__

=encoding utf-8

=head1 NAME

WebService::Bandcamp - A simple and fast interface to the bandcamp.com API

=head1 SYNOPSIS

    use WebService::Bandcamp;

    my $bandcamp WebService::Bandcamp->new( api_key => 'YOUR_API_KEY' );

    # or default value $ENV{'BANDCAMP_API_KEY'}
    my $bandcamp WebService::Bandcamp->new();

    my $data = $bandcamp->search(name => 'metal');

=head1 DESCRIPTION

The module provides a simple interface to the Bandcamp.com API. To use this module, you must first sign up at http://bandcamp.com/developer#key_request to receive an API key.

=head1 SEE ALSO

http://bandcamp.com/developer

=head1 LICENSE

Copyright (C) Hondallica.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Hondallica E<lt>hondallica@gmail.comE<gt>

=cut

