if ds_map_find_value(async_load, "status") == 0 {
   var raw_json = ds_map_find_value(async_load, "result");
   var json = json_decode(raw_json);
   var message = ds_map_find_value(json, "message");
   if message == "game-url" {
     JOIN_URL = ds_map_find_value(json, "url")
     r_str = "Join at " + JOIN_URL;
     SHORTCODE = ds_map_find_value(json, "shortCode");
     LOADING = false;
   } else if message == "game-heartbeat" {
     var ready = ds_map_find_value(json, "ready");
     r_str = "Join at " + JOIN_URL + " (" + ready + " ready)";
     LOADING = false;
   }
   ds_map_destroy(json);
} else {
   r_str = "null";
}

