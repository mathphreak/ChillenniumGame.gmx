with NetworkInfoBox{
    var result = true;
    var players = net_getPlayers();
    for (var i = 0; i < array_height_2d(players); i++) {
        if players[i, 2] != 1 {
            result = false;
            // Don't believe people when they tell you break is Hitler
            break;
        }
    }
    if (!result) {
        trust_ready = true;
    }
    
    if (trust_ready) {
        return result;
    } else {
        return false;
    }
}
