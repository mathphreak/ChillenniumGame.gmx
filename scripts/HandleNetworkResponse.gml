if ds_map_find_value(async_load, "status") == 0 {
   var raw_json = ds_map_find_value(async_load, "result");
   var json = json_decode(raw_json);
   if ds_map_find_value(json, "message") == "game-url" {
     r_str = "Join at " + ds_map_find_value(json, "url");
     SHORTCODE = ds_map_find_value(json, "shortCode");
     LOADING = false;
   }
} else {
   r_str = "null";
}

