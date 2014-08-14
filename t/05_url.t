use strict;
use Test::More 0.98;
use WebService::Bandcamp;


my $bandcamp = new WebService::Bandcamp(
    api_key => 'vatnajokull',
);

my $band_url = 'http://nosinevadeshisgaze.bandcamp.com';
my $album_url = 'http://nosinevadeshisgaze.bandcamp.com/album/age-of-sedation-2014?pk=564';
my $track_url = $band_url . '/track/a-crack-in-the-looking-glass';

my $data = $bandcamp->url_info(url => $band_url);
is $data->{band_id}, 844506038;

$data = $bandcamp->url_info(url => $album_url);
is $data->{'band_id'}, 844506038;
is $data->{'album_id'}, 667787651;

$data = $bandcamp->url_info(url => $track_url);
is $data->{'band_id'}, 844506038;
is $data->{'track_id'}, 1250910200;


done_testing;

