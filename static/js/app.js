function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}

$(document).ready(function () {
    var xsrf = getCookie("_xsrf");
    $('#play_audio').click(function () {
        $.post("/a/play", {
            _xsrf: xsrf,
            audio_file: $('#audio_file').val()
        });
    });
    $('#stop_audio').click(function () {
        $.post("/a/stop", {
            _xsrf: xsrf
        });
    });
});