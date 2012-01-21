###
# Simple commandline-client of the APE webservice.
# Sends sentences from STDIN to the webservice and outputs the DRS to STDOUT.
#
# Kaarel Kaljurand
# 2012-01-21
#
# Usage:
# cat sentences.txt | perl acetext_to_drs-get.perl > drs.txt
###

use strict;
use warnings;
use LWP::UserAgent;

#my $url = 'http://attempto.ifi.uzh.ch/ws/ape/apews.perl';
my $url = 'http://localhost:8000';

my $browser = LWP::UserAgent->new;
$browser->agent("SimpleApeClientWithLWP/0.6");

while(<STDIN>) {

	chomp;

	# Ignore empty lines
	next if /^\s*$/;

	print "IN: $_\n";

	my $response = $browser->get($url . "?" . "text=" . $_ . "&cdrs=on");

	die "Error: ", $response->status_line unless $response->is_success;

	die "Error: content type not text/xml but ", $response->content_type unless $response->content_type eq 'text/xml';

	my $r = $response->content;

	# We use regular expressions to parse XML. This is ok, since we know
	# exactly what the XML is like. We also hope to save some time that
	# starting up a SAX parser would require.

	if($r =~ /<error /) {
		$r =~ s/.*<error //s;
		$r =~ s/<\/error>.*//s;
		$r = "ERROR: " . $r;
	}
	else {
		$r =~ s{.*<drs>}{}s;
		$r =~ s{<\/drs>.*}{}s;
	}

	print "OUT: $r \n\n";
}
