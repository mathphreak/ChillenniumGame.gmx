with NetworkInfoBox {
    var ADDR = net_GET_HOST_ADDR();
    
    if !LOADING {
        http_get(ADDR + "/game/" + SHORTCODE)
    }
}
