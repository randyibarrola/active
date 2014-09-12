$(document).ready(function(){
	$('.flexslider').flexslider({
    animation: "fade",
    controlNav: "thumbnails",
    slideshow: false,
    after: function(slider){
      $('.outlet_price_background, .outlet_price_container').fadeOut();  
    }
  });
  window.setTimeout(function (argument) {
      $('.outlet_price_background, .outlet_price_container').fadeIn();
  },500);
  
  $('#servicios_scroll').click(function(){
    $("html, body").animate({ scrollTop: $('#'+SERVICIO_ID).offset().top-57}, 400);
    return false;
  });

  $('#inicio_scroll').click(function(){
    $("html, body").animate({ scrollTop:0}, 400);
    return false;
  });
  
  $(document).scroll(verificarServicioMenu);
  
  cookiesbar();


});

function verificarServicioMenu() {
    var windowTop = $(window).scrollTop();
    
    if($('#'+SERVICIO_ID).offset().top - 60 <= windowTop && !$('#servicios_scroll').parent().hasClass('active')) {
        $('#servicios_scroll').parent().addClass('active');
        $('#inicio_scroll').parent().removeClass('active');
    } else if ($('#'+SERVICIO_ID).offset().top - 60 > windowTop && $('#servicios_scroll').parent().hasClass('active')) {
        $('#servicios_scroll').parent().removeClass('active');
        $('#inicio_scroll').parent().addClass('active');
    }
}

function cookiesbar(){
    if(!checkCookie()) {
        $('#accept-cookies').slideDown('fast');
        $('#accept-cookies-btn').click(function(e){
            e.preventDefault();
            $('#accept-cookies').hide();
            setCookie('accept-vikahotel-cookie', 1, 365);
            return false;
        });

        $('#readCookiesBtn').click(function(e){
            e.preventDefault();

            $('#blocker').fadeIn().find('div').html('Loading...');
            $.ajax({
                url: BASE_URL + '/ajax-popup',
                data: {id: 'cookies'},
                type: 'get',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    $('#cookies_modal .modal-body').html(response.data);
                    $('#cookies_modal').modal();
                }
            });
        });

        $('#main-content-theme *').click(function(e){
            setCookie('accept-vikahotel-cookie', 1, 365);
            $('#accept-cookies').hide();
        })
    }
}

function setCookie(cname, cvalue, exdays)
{
    var d = new Date();
    d.setTime(d.getTime()+(exdays*24*60*60*1000));
    var expires = "expires="+d.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname)
{
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++)
    {
        var c = $.trim(ca[i]);
        if (c.indexOf(name)==0) 
            return c.substring(name.length,c.length);
    }
    return "";
}

function checkCookie()
{
    var c=getCookie("accept-vikahotel-cookie");
    return c == 1;
}