if ds_map_find_value(async_load, "status") == 0 {
    var raw_json = ds_map_find_value(async_load, "result");
    var json = json_decode(raw_json);
    if ds_exists(json, ds_type_map) && ds_map_exists(json, "message") {
        var message = ds_map_find_value(json, "message");
        if message == "game-url" {
            JOIN_URL = ds_map_find_value(json, "url")
            r_str = "Join at " + JOIN_URL;
            SHORTCODE = ds_map_find_value(json, "shortCode");
            LOADING = false;
        } else if message == "game-heartbeat" {
            var ready = ds_map_find_value(json, "ready");
            urlString = "Join at " + JOIN_URL;
            readyString = ready + " ready";
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
                    players[n,3] = ds_map_find_value(map, "choice");
                    if ds_map_exists(map, "role") {
                        players[n,4] = ds_map_find_value(map, "role");
                    } else {
                        players[n,4] = "";
                    }
                    if ds_map_exists(map, "messmaker") {
                        players[n,5] = ds_map_find_value(map, "messmaker");
                    } else {
                        players[n,5] = false;
                    }
                    curr = ds_map_find_next(map, curr);
                }
                ds_map_destroy(map);
            }
            ds_list_destroy(list);
        }
    } else {
        // aaaaaaaaaaaaaaa
        r_str = "JSON error!"
    }
    ds_map_destroy(json);
} else {
    r_str = "null";
}

