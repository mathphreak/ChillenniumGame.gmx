var players = net_getPlayers();
var specialPlayerIdx = irandom(array_height_2d(players) - 1);
var specialPlayerID = players[specialPlayerIdx, 0];
var ADDR = net_GET_HOST_ADDR();

with NetworkInfoBox {
    http_post_string(ADDR + '/game/' + SHORTCODE + '/players/' + specialPlayerID, 'special=true');
}

