with NetworkInfoBox {
    var roles;
    roles[0] = 'Engineer';
    roles[1] = 'Gunner';
    roles[2] = 'Medic';
    roles[3] = 'Pilot';
    var colors;
    colors[0] = 'orange';
    colors[1] = 'purple';
    colors[2] = 'green';
    colors[3] = 'blue';
    randomize();
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
        
        var url = ADDR + '/game/' + SHORTCODE + '/players/' + playerID;
        var body = 'role=' + role;
        body = body + '&saboteur=' + isSaboteur;
        body = body + '&color=' + colors[i];
        http_post_string(url, body);
    }
}

