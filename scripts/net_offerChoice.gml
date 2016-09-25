// These arguments are important
var playerID = argument0;
var action = argument1;
var neighbor1 = argument2;
var neighbor2 = argument3;
var neighbor3 = argument4;
var neighbor4 = argument5;

var ADDR = net_GET_HOST_ADDR();

var message_map = ds_map_create();
ds_map_add(message_map, 'action', action);
ds_map_add(message_map, 'neighbor1', neighbor1);
ds_map_add(message_map, 'neighbor2', neighbor2);
ds_map_add(message_map, 'neighbor3', neighbor3);
ds_map_add(message_map, 'neighbor4', neighbor4);
var header_map = ds_map_create();
ds_map_add(header_map, "Content-Type", "application/json");
with NetworkInfoBox {
    http_request(ADDR + '/game/' + SHORTCODE + '/choice/' + playerID, "POST", header_map, json_encode(message_map));
}
ds_map_destroy(message_map);
ds_map_destroy(header_map);

