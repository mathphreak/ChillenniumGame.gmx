// These arguments are important
// but not as important as refraining from barfing on examination of this code
// which might get simpler once writing happens, too
var title = argument0;
var choice1 = argument1;
var choice1Special = argument2;
var choice2 = argument3;
var choice2Special = argument4;
var choice3 = argument5;
var choice3Special = argument6;
var choice4 = argument7;
var choice4Special = argument8;
var choice5 = argument9;
var choice5Special = argument10;

var ADDR = net_GET_HOST_ADDR();

var message_map = ds_map_create();
ds_map_add(message_map, 'title', title);
ds_map_add(message_map, 'choice1', choice1);
ds_map_add(message_map, 'choice1Special', choice1Special);
ds_map_add(message_map, 'choice2', choice2);
ds_map_add(message_map, 'choice2Special', choice2Special);
ds_map_add(message_map, 'choice3', choice3);
ds_map_add(message_map, 'choice3Special', choice3Special);
ds_map_add(message_map, 'choice4', choice4);
ds_map_add(message_map, 'choice4Special', choice4Special);
ds_map_add(message_map, 'choice5', choice5);
ds_map_add(message_map, 'choice5Special', choice5Special);
var header_map = ds_map_create();
ds_map_add(header_map, "Content-Type", "application/json");
http_request(ADDR + '/game/' + SHORTCODE + '/choice', "POST", header_map, json_encode(message_map));
ds_map_destroy(message_map);
ds_map_destroy(header_map);
