use strict;
use Test::More 0.98;
use WebService::Bandcamp;
use Data::Dumper;

my $bandcamp = new WebService::Bandcamp;
ok $bandcamp->http;
isa_ok $bandcamp->http, 'Furl::HTTP';

my $data = $bandcamp->search(
    name => 'No Sin Evades His Gaze'
);
ok $data;
warn Dumper $data;

my $band_id = $data->{results}[0]{'band_id'};
is $band_id, 844506038;
is $data->{results}[0]{'offsite_url'}, 'https://www.facebook.com/nosinevadeshisgaze?ref_type=bookmark';
is $data->{results}[0]{'name'}, 'No Sin Evades His Gaze';
is $data->{results}[0]{'url'}, 'http://nosinevadeshisgaze.bandcamp.com';
is $data->{results}[0]{'subdomain'},'nosinevadeshisgaze';




done_testing;

