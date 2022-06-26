$(document).ready(function(){
    $('.scoreboard').hide();

    window.addEventListener('message', function(event) {

        

        var data = event.data;

        if (data.show != null) {
            if (data.show) {
                $(".scoreboard").fadeIn(250);
            } else {
                $(".scoreboard").fadeOut(250);
            }
        }

        if (data.players != null){
            $('.players').text(data.players + "/300");
        }

        $('.police-count').text(data.police);
        $('.ambulance-count').text(data.ambulance);
        $('.mechanic-count').text(data.mechanic);
        $('.taxi-count').text(data.taxi);
        $('.guardias-count').text(data.guardias);
        $('.pdi-count').text(data.pdi);

        if (data.ping != null){
            $('.ping').text(data.ping + " ms");
        }
        $('.username').text(data.playerName);
    });
});