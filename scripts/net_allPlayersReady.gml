var players = net_getPlayers();
for (var i = 0; i < array_height_2d(players); i++) {
    if players[i, 2] != 1 {
        return false;
    }
}
return true;
