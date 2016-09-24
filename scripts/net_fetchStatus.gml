var ADDR = net_getHostAddr();

if !LOADING {
    http_get(ADDR + "/game/" + SHORTCODE)
}

