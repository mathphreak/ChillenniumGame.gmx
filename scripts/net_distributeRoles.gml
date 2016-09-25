var players = net_getPlayers();
var roles;
roles[0] = 'engineer';
roles[1] = 'scientist';
roles[2] = 'medic';
roles[3] = 'pilot';
for (var i = 0; i < array_height_2d(players); i++) {
    var j = irandom(i);
    if j != i {
        players[i, 1] = players[j, 1];
    }
    players[j, 1] = roles[i];
}

var ADDR = net_GET_HOST_ADDR();

var saboteur = irandom(array_height_2d(players));

with NetworkInfoBox {
    for (var i = 0; i < array_height_2d(players); i++) {
        var playerID = players[i, 0];
        var role = players[i, 1];
        var saboteur = 'false';
        if (i == saboteur) {
            saboteur = 'true';
        }
        http_post_string(ADDR + '/game/' + SHORTCODE + '/players/' + playerID, 'role=' + role + '&saboteur=' + saboteur);
    }
}

