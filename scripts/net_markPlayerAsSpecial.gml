// Pass in special player ID as argument 0
// Example: net_markPlayerAsSpecial(players[n,0])
var specialPlayerID = argument0;
var ADDR = net_GET_HOST_ADDR();

http_post_string(ADDR + '/game/' + SHORTCODE + '/players/' + specialPlayerID, 'special=true');

