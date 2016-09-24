var players = net_getPlayers();
var roles;
roles[0] = 'benign';
roles[1] = 'inept';
roles[2] = 'sneaky';
roles[3] = 'competent';
roles[4] = 'smug';
for (var i = 0; i < array_height_2d(players); i++) {
    var j = irandom(i);
    if j != i {
        players[i, 1] = players[j, 1];
    }
    players[j, 1] = roles[i];
}

var ADDR = net_GET_HOST_ADDR();

with NetworkInfoBox {
    for (var i = 0; i < array_height_2d(players); i++) {
        var playerID = players[i, 0];
        var role = players[i, 1];
        var special = 'false';
        if (role == 'sneaky') {
            special = 'true';
        }
        http_post_string(ADDR + '/game/' + SHORTCODE + '/players/' + playerID, 'role=' + role + '&special=' + special);
    }
}

