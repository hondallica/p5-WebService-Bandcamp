use strict;
use Test::More 0.98;
use WebService::Bandcamp;
use Data::Dumper;

my $bandcamp = new WebService::Bandcamp;
ok $bandcamp->http;
isa_ok $bandcamp->http, 'Furl::HTTP';


my $data = $bandcamp->band_search(
    name => 'No Sin Evades His Gaze'
);

my $band_id = $data->{results}[0]{'band_id'};
is $band_id, 844506038;
is $data->{results}[0]{'offsite_url'}, 'https://www.facebook.com/nosinevadeshisgaze?ref_type=bookmark';
is $data->{results}[0]{'name'}, 'No Sin Evades His Gaze';
is $data->{results}[0]{'url'}, 'http://nosinevadeshisgaze.bandcamp.com';
is $data->{results}[0]{'subdomain'},'nosinevadeshisgaze';


$data = $bandcamp->band_discography(
    band_id => $band_id,
);

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


$data = $bandcamp->band_info(
    band_id => $band_id,
);
is $data->{'band_id'}, 844506038;
is $data->{'offsite_url'}, 'https://www.facebook.com/nosinevadeshisgaze?ref_type=bookmark';
is $data->{'name'}, 'No Sin Evades His Gaze';
is $data->{'url'}, 'http://nosinevadeshisgaze.bandcamp.com';
is $data->{'subdomain'},'nosinevadeshisgaze';


$data = $bandcamp->album_info(album_id => 667787651);
is $data->{band_id}, 844506038;
is $data->{album_id}, 667787651;
is $data->{title}, 'Age Of Sedation (2014)';
is $data->{about}, 'The astounding debut album from UK Metallers No Sin Evades His Gaze receiving praise across the board from the likes of Metal Hammer, Prog Mag  and all the respected press websites. Get your copy now!';
is $data->{credits}, 'Album Art, Lyrics and Production: James Denton';
is $data->{release_date}, 1407456000;
is $data->{url}, 'http://nosinevadeshisgaze.bandcamp.com/album/age-of-sedation-2014?pk=564';
is $data->{small_art_url}, 'http://f1.bcbits.com/img/a3416781184_3.jpg';
is $data->{large_art_url}, 'http://f1.bcbits.com/img/a3416781184_2.jpg';
is $data->{downloadable}, 2;

is $data->{tracks}[0]{'band_id'}, 844506038;
is $data->{tracks}[0]{'album_id'}, 667787651;
is $data->{tracks}[0]{'track_id'}, 1250910200;
is $data->{tracks}[0]{'number'}, 1;
is $data->{tracks}[0]{'title'}, 'A Crack In The Looking Glass';
is $data->{tracks}[0]{'duration'}, 51.7502;
is $data->{tracks}[0]{'release_date'}, 1407456000;
is $data->{tracks}[0]{'url'}, '/track/a-crack-in-the-looking-glass?pk=564';
is $data->{tracks}[0]{'small_art_url'}, 'http://f1.bcbits.com/img/a3369947177_3.jpg';
is $data->{tracks}[0]{'large_art_url'}, 'http://f1.bcbits.com/img/a3369947177_2.jpg';
is $data->{tracks}[0]{'downloadable'}, 2;
like $data->{tracks}[0]{'streaming_url'}, qr|^http://popplers5\.bandcamp\.com/download/track?|;


$data = $bandcamp->track_info(track_id => 1250910200);
is $data->{'band_id'}, 844506038;
is $data->{'album_id'}, 667787651;
is $data->{'track_id'}, 1250910200;
is $data->{'number'}, 1;
is $data->{'title'}, 'A Crack In The Looking Glass';
is $data->{'duration'}, 51.7502;
is $data->{url}, '/track/a-crack-in-the-looking-glass';
is $data->{'about'}, undef;
is $data->{'lyrics'}, undef;
is $data->{'credits'}, undef;
is $data->{'small_art_url'}, 'http://f1.bcbits.com/img/a3369947177_3.jpg';
is $data->{'large_art_url'}, 'http://f1.bcbits.com/img/a3369947177_10.jpg';
is $data->{'downloadable'}, 2;
like $data->{'streaming_url'}, qr|^http://popplers5\.bandcamp\.com/download/track?|;


done_testing;

