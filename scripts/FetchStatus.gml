ADDR = "http://abd78339.ngrok.io"

if !LOADING {
    http_get(ADDR + "/game/" + SHORTCODE)
}

