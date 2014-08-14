use strict;
use Test::More 0.98;
use WebService::Bandcamp;


my $bandcamp = new WebService::Bandcamp(
    api_key => 'vatnajokull',
);

my $data = $bandcamp->band_search(name => 'No Sin Evades His Gaze');

my $band_id = $data->{results}[0]{'band_id'};
is $band_id, 844506038;
is $data->{results}[0]{'offsite_url'}, 'https://www.facebook.com/nosinevadeshisgaze?ref_type=bookmark';
is $data->{results}[0]{'name'}, 'No Sin Evades His Gaze';
is $data->{results}[0]{'url'}, 'http://nosinevadeshisgaze.bandcamp.com';
is $data->{results}[0]{'subdomain'},'nosinevadeshisgaze';


$data = $bandcamp->band_discography(band_id => $band_id);

$data->{discography}[0]{'large_art_url'}, 'http://f1.bcbits.com/img/a2604285726_2.jpg';
$data->{discography}[0]{'art_id'}, 2604285726;
$data->{discography}[0]{'downloadable'}, 2;
$data->{discography}[0]{'url'}, 'http://nosinevadeshisgaze.bandcamp.com/track/age-of-sedation-no-sin-evades-his-gaze-single-2014?pk=564';
$data->{discography}[0]{'track_id'}, 1980832207;
$data->{discography}[0]{'title'}, 'Age Of Sedation - No Sin Evades His Gaze (Single) 2014';
$data->{discography}[0]{'band_id'}, 844506038;
$data->{discography}[0]{'release_date'}, 1399680000;
$data->{discography}[0]{'artist'}, 'No Sin Evades His Gaze';
$data->{discography}[0]{'small_art_url'}, 'http://f1.bcbits.com/img/a2604285726_3.jpg';


$data = $bandcamp->band_info(band_id => $band_id);
is $data->{'band_id'}, 844506038;
is $data->{'offsite_url'}, 'https://www.facebook.com/nosinevadeshisgaze?ref_type=bookmark';
is $data->{'name'}, 'No Sin Evades His Gaze';
is $data->{'url'}, 'http://nosinevadeshisgaze.bandcamp.com';
is $data->{'subdomain'},'nosinevadeshisgaze';


done_testing;

