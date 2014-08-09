use strict;
use Test::More 0.98;
use WebService::Bandcamp;


SKIP: {
    skip q|Not exists $ENV{'BANDCAMP_API_KEY'}|, 2 unless exists $ENV{BANDCAMP_API_KEY};

    my $bandcamp = new WebService::Bandcamp;
    ok $bandcamp->api_key, '$ENV{BANDCAMP_API_KEY}';
    is $bandcamp->api_key, $ENV{BANDCAMP_API_KEY};

}

my $bandcamp = new WebService::Bandcamp(
    'api_key' => 'DUMMY_API_KEY',
);
is $bandcamp->api_key, 'DUMMY_API_KEY';


done_testing;

