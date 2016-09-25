var playerIdx = argument0;
var result = "Clean up";
var players = net_getPlayers();
//if its player turn
//determine whether current player is Sab
// maybe also check if it's already messy/clean
if(players[playerIdx, 5])
    choice = "Leave a mess"
else
    choice = "Clean up"

if obj_objective.currentObjective > -1 {
    var currentPlayerType = getPlayerWithNumber(playerIdx);
    var currentPlayer = instance_find(currentPlayerType, 0);
    var currentRoom = currentPlayer.currentRoom;
    if obj_objective.coRole == players[playerIdx,4] && obj_objective.coRoom == currentRoom {
        if obj_shipData.rooms[currentRoom-1,0] == 'clean' {
            choice = obj_objective.coAction;
        } else {
            choice = 'Clean up';
        }
    }
}

return choice;

