// Get all the players
var players = net_getPlayers();

// Count the votes, starting at zero
var voteCounts;
for (var i = 0; i < 5; i++) {
    voteCounts[i] = 0;
}

// Track the winning index
var bestIndex = 0;
for (var i = 0; i < array_height_2d(players); i++) {
    // Grab the current index
    var index = players[i, 3];
    
    // Make sure it's valid
    if (index > -1) {
        // Score one for this option
        voteCounts[index]++;
        // If it's now winning, it's now winning
        if (voteCounts[index] > voteCounts[bestIndex]) {
            bestIndex = index;
        }
    }
}
// If nothing ever happened ever at all ever, don't return a valid index
if (voteCounts[bestIndex] == 0) return -1;

// Return the winning index
return bestIndex;
