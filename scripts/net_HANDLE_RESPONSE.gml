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
        var list = ds_map_find_value(json, "players");
        var size = ds_list_size(list);
        for (var n = 0; n < ds_list_size(list); n++;) {
            var map = ds_list_find_value(list, n);
            var curr = ds_map_find_first(map);
            while (is_string(curr)) {
                players[n,0] = ds_map_find_value(map, "_id");
                players[n,1] = ds_map_find_value(map, "name");
                players[n,2] = ds_map_find_value(map, "ready");
                curr = ds_map_find_next(map, curr);
            }
            ds_map_destroy(map);
        }
        ds_list_destroy(list);
    }
    ds_map_destroy(json);
} else {
    r_str = "null";
}

