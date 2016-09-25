with NetworkInfoBox {
    var roles;
    roles[0] = 'engineer';
    roles[1] = 'scientist';
    roles[2] = 'medic';
    roles[3] = 'pilot';
    for (var i = 0; i < array_height_2d(players); i++) {
        var j = irandom(i);
        if j != i {
            players[i, 4] = players[j, 4];
        }
        players[j, 4] = roles[i];
    }
    
    var ADDR = net_GET_HOST_ADDR();
    
    var saboteurIdx = irandom(array_height_2d(players));
    players[saboteurIdx, 5] = true;

    for (var i = 0; i < array_height_2d(players); i++) {
        var playerID = players[i, 0];
        var role = players[i, 4];
        var isSaboteur = 'false';
        if (players[i, 5]) {
            isSaboteur = 'true';
        }
        http_post_string(ADDR + '/game/' + SHORTCODE + '/players/' + playerID, 'role=' + role + '&saboteur=' + isSaboteur);
    }
}

