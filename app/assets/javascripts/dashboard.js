    jQuery(document).ready(function($) {
        function hauteur () {
            var ch= parseInt($("#container").css('height'));
            var ph= parseInt($("#panel-left").css('height'));
            if (ch>ph) {
                $("#panel-left").css('height',(ch+10)+"px");
            }
        }
        hauteur();
        $('a').click(function(event) {
            hauteur();
        });
    });