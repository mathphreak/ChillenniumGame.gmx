var players = net_getPlayers();
var result;
for (var i = 0; i < array_height_2d(players); i++) {
    result[i] =  players[i, 3];
}
return result;
