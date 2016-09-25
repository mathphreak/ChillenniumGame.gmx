// These arguments are important
var playerID = argument0;
var action = argument1;
var infoHere = argument2;
var neighbors = argument3;

var ADDR = net_GET_HOST_ADDR();

var message_map = ds_map_create();
ds_map_add(message_map, 'action', action);
ds_map_add(message_map, 'infoHere', infoHere);
for (var i = 0; i < array_length_1d(neighbors); i++) {
    ds_map_add(message_map, 'neighbor' + string(i + 1), neighbors[i]);
}
var header_map = ds_map_create();
ds_map_add(header_map, "Content-Type", "application/json");
with NetworkInfoBox {
    http_request(ADDR + '/game/' + SHORTCODE + '/choice/' + playerID, "POST", header_map, json_encode(message_map));
}
ds_map_destroy(message_map);
ds_map_destroy(header_map);

