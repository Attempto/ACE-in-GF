#
# Sends sentences from STDIN to the APE webservice and
# outputs OK or FAIL depending on if parsing
# resulted in a non-empty DRS.
#
# Kaarel Kaljurand
# 2012-05-18
#

use strict;
use warnings;
use LWP::UserAgent;

#my $url = 'http://attempto.ifi.uzh.ch/ws/ape/apews.perl';
my $url = 'http://localhost:8000';

my $browser = LWP::UserAgent->new;

while(<STDIN>) {

	chomp;

	# Ignore empty lines
	next if /^\s*$/;

	my $in = $_;

	# TODO: we could check OWL/SWRL paring instead of DRS
	my $response = $browser->get($url . "?" . "text=" . $_ . "&cdrs=on");

	die "Error: ", $response->status_line unless $response->is_success;

	die "Error: content type not text/xml but ", $response->content_type unless $response->content_type eq 'text/xml';

	my $r = $response->content;

	if ($r =~ /<error /) {
		$r =~ s/.*<error //s;
		$r =~ s/<\/error>.*//s;
		$r = "ERROR: " . $r;
	}
	else {
		$r =~ s{.*<drs>}{}s;
		$r =~ s{<\/drs>.*}{}s;
	}

	if ($r =~ m{^drs\(\[\],\[\]\)$}) {
		print "FAIL: $in\n";
	} else {
		print "OK: $in\n";
	}

}
