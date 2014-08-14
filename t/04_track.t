use strict;
use Test::More 0.98;
use WebService::Bandcamp;


my $bandcamp = new WebService::Bandcamp(
    api_key => 'vatnajokull',
);

my $data = $bandcamp->track_info(track_id => 1250910200);
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

