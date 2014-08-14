use strict;
use Test::More 0.98;
use WebService::Bandcamp;


my $bandcamp = new WebService::Bandcamp(
    api_key => 'vatnajokull',
);

my $data = $bandcamp->album_info(album_id => 667787651);
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


done_testing;

