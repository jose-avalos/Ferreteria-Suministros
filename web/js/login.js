$(document).ready(function() {

    $(".log").click(function() {

        $("#dialogo").dialog({title: "Iniciar Sesion", width: 250, height: 250, show: "scale", hide: "fade", resizable: "false", modal: "true", closeOnEscape: true, draggable: false, open: function() {
                $('.ui-widget-overlay').bind('click', function() {
                    $('#dialogo').dialog('close');
                });
            }});
        
    });


    $("#dialogo2").dialog({title: "Mensaje", width: 300, height: 175, show: "shake", hide: "fade", resizable: "false", closeOnEscape: true, draggable: false, open: function() {
            $('body').bind('click', function() {
                $('#dialogo2').dialog('close');
            });
        }});


    });