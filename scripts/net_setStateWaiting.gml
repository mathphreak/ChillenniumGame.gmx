// Show a message about waiting for a decision on phones.
var ADDR = net_GET_HOST_ADDR();

with NetworkInfoBox {
    http_post_string(ADDR + '/game/' + SHORTCODE, 'state=waiting');
}
