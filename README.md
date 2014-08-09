# NAME

WebService::Bandcamp - A simple and fast interface to the bandcamp.com API

# SYNOPSIS

    use WebService::Bandcamp;

    my $bandcamp WebService::Bandcamp->new( api_key => 'YOUR_API_KEY' );

    # or default value $ENV{'BANDCAMP_API_KEY'}
    my $bandcamp WebService::Bandcamp->new();

    my $data = $bandcamp->search(name => 'metal');

# DESCRIPTION

The module provides a simple interface to the Bandcamp.com API. To use this module, you must first sign up at http://bandcamp.com/developer#key\_request to receive an API key.

# SEE ALSO

http://bandcamp.com/developer

# LICENSE

Copyright (C) Hondallica.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Hondallica <hondallica@gmail.com>
