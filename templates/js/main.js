$(document).ready(function() {
    
    completeHotel();
    
  if($('.calidad').attr('data-score')>0){
    setTimeout(function(){
        $(".calidad").raty({
          starHalf    : BASE_URL+'/templates/images/icons/star-half.png' ,
          starOff     : BASE_URL+'/templates/images/icons/star-off.png',
          starOn      : BASE_URL+'/templates/images/icons/star-on.png'  ,
          readOnly    : true,
          score: function() {
            return $(this).attr('data-score');
          },
          number: function() {
            return $(this).attr('data-score');
          }
        }).show();
    },500);
  }
   $('#buscar_disponibilidad_btn').click(function(){
        $(this).button('loading');
    });

  $('a.ver-excursion').on('click', function(e){
      e.preventDefault();/*
      idExcursion = $(this).attr('href');
      
      $.ajax({
          url: BASE_URL + '/ajax-detalle' + END_URL,
          data: {id:idExcursion},
          type: 'post',
          dataType: 'json',
          success: function(response){
              if(response.msg == 'ok') {
                  $('#detalle_modal .modal-body').html(response.html);
                  $('#detalle_modal').modal();
              }
          }
      })*/
    });
    
    $('#suscribe-form').submit(function(e){
        e.preventDefault();
        var valid = $(this).validationEngine('validate');
        _this = $(this);
        if(valid) {
            var data = $(this).serialize();
            $.ajax({
                url: BASE_URL + '/ajax-suscripcion',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        _this.find('input[type=text], textarea').val('');
                    } else {
                        toastr.error(response.data);
                    } 
                }
            });
        }
    })
  
    $(".breadcrumb-custom .active a").click(function() {
        return false;
    });
    $('.to_scroll_top').click(function() {
        $("html, body").animate({scrollTop: $("body").offset().top - 57}, 400);
        return false;
    });

//    if($('#date-start').val()){
  
//  var start_date = new Date(new Date().setDate(new Date().getDate() + VENTA_ANTICIPADA));
  /*
  if(FECHAS_DETENER_VENTAS.length > 0) {
      arr = [];
      for(i=0;i<FECHAS_DETENER_VENTAS.length; i++) {
          fs = FECHAS_DETENER_VENTAS[i].split('-');
          d = new Date(fs[0], parseInt(fs[1]) - 1, parseInt(fs[2]));
          arr.push(d.getTime());
      }
      FECHAS_DETENER_VENTAS = arr;
      
      while($.inArray( start_date.getTime(), FECHAS_DETENER_VENTAS) != -1)  {
        start_date = new Date(start_date.setDate(start_date.getDate() + 1));        
      }
  }*/
  
//  var end_date = new Date(new Date(start_date).setDate(start_date.getDate()+ ESTANCIA_MINIMA));

  //console.log(start_date, end_date);

//  $('#date-start').datepicker({
//        autoclose: true,
//        format:'dd-mm-yyyy',
//        startDate : start_date,
//        language: LANG,
//        beforeShowDay: function (date){
//            d = new Date(date.getFullYear(), date.getMonth(), date.getDate());
//
//            return $.inArray(d.getTime(), FECHAS_DETENER_VENTAS) != -1 ? 'red disabled' : true;
//        }
//    }).on('changeDate', function(ev) {
//        start_date = ev.date;
//        $('#date-end').datepicker('show');
//        end_date = new Date(start_date.setDate(start_date.getDate()+ESTANCIA_MINIMA));
//
//        $('#date-end').datepicker('setStartDate',end_date);
//        setNights(ev.date,end_date);
//    });
//
//    $('#date-end').datepicker({
//        autoclose: true,
//        format:'dd-mm-yyyy',
//        startDate: end_date,
//        language: LANG,
//        beforeShowDay: function (date){
//            d = new Date(date.getFullYear(), date.getMonth(), date.getDate());
//            if($.inArray(d.getTime(), FECHAS_DETENER_VENTAS) != -1)
//                return 'red disabled';
//            for(i=0;i<FECHAS_DETENER_VENTAS.length;i++) {
//                if(FECHAS_DETENER_VENTAS[i] > $('#date-start').datepicker('getDate').getTime() && FECHAS_DETENER_VENTAS[i] < date.getTime())
//                    return false;
//            }
//            return true;
//        }
//    }).on('changeDate', function(ev) {
//        start_date = $('#date-start').datepicker('getDate');
//        end_date = ev.date;
//        setNights(start_date,end_date);
//    });
//
//    if(END_DATE_CONTRATO) {
//        END = new Date(new Date(END_DATE_CONTRATO).getTime() + (24 * 3600000));
//        $('#date-end').datepicker('setEndDate',END);
//        $('#date-start').datepicker('setEndDate',END);
//    }
//
//    start_date = $('#date-start').datepicker('getDate');
//    end_date = new Date(start_date.setDate(start_date.getDate()+ESTANCIA_MINIMA));
//    $('#date-end').datepicker('setStartDate',end_date);
//    setNights($('#date-start').datepicker('getDate'),$('#date-end').datepicker('getDate'));
//
//    start_date = $('#date-start').datepicker('getDate');
//    sd = start_date.getDate() < 10 ? ('0' + start_date.getDate()) : start_date.getDate();
//    sd += '-' + (start_date.getMonth() + 1) + '-' + start_date.getFullYear();
//
//    if($('#date-start').val() !== sd)
//        $('#date-start').val(sd);
//
//    end_date = $('#date-end').datepicker('getDate');
//    ed = end_date.getDate() < 10 ? ('0' + end_date.getDate()) : end_date.getDate();
//    ed += '-' + (end_date.getMonth() + 1) + '-' + end_date.getFullYear();
//
//    if($('#date-end').val() !== ed)
//        $('#date-end').val(ed);
//}
//    function setNights(start_date,end_date){
//      var nights = getNights(start_date,end_date);
//
//      $('#noches_label').html(su_reserva_sera_de + ' ' +nights+' '+label_noches+'.');
//    }
//
//    function getNights(start_date,end_date){
//      var day = 24 * 60 * 60 * 1000;
//      var timeDiff = Math.abs(end_date.getTime() - start_date.getTime());
//      var diffDays = parseInt(Math.round(timeDiff / (1000 * 3600 * 24)));
//      return diffDays;
//    }
    
//    $('#privacidad_link').click(function(e){
//        e.preventDefault();
//        $('#blocker').fadeIn().find('div').html('Loading...');
//        $.ajax({
//            url: BASE_URL + '/ajax-popup',
//            data: {id: 'privacidad'},
//            type: 'get',
//            dataType: 'json',
//            success: function(response) {
//                $('#blocker').fadeOut();
//                $('#privacidad_modal .modal-body').html(response.data);
//                $('#privacidad_modal').modal();
//            }
//        });
//    })
//
//    $('#cookies_link').click(function(e){
//        e.preventDefault();
//        $('#blocker').fadeIn().find('div').html('Loading...');
//        $.ajax({
//            url: BASE_URL + '/ajax-popup',
//            data: {id: 'cookies'},
//            type: 'get',
//            dataType: 'json',
//            success: function(response) {
//                $('#blocker').fadeOut();
//                $('#cookies_modal .modal-body').html(response.data);
//                $('#cookies_modal').modal();
//            }
//        });
//    })
    
    
});

var HOTELES = [];
function completeHotel() {
    $('#hotelComplete').typeahead({
        source: function(qry, process){
            $.ajax({
                url: BASE_URL + '/admin-ajax-hoteles',
                type: 'post',
                data: {action:'search', term:qry, nodestinos:1},
                dataType: 'json',
                success: function(response) {
                    HOTELES = [];
                    lista = [];
                    if(response.lista.length > 0) {
                        for(i=0;i<response.lista.length;i++) {
                            HOTELES[response.lista[i].nombre] = response.lista[i];
                            lista.push(response.lista[i].nombre);
                        }
                        
                        return process(lista);
                    } else
                        return process([NO_ELEMENTOS_LABEL]);
                }
            });
        },
        updater: function(item) {
            element = HOTELES[item];
            if(element) {
                url = element.url;
                if(url.replace('http', '').length == url.length)
                    url = 'http://' + url;
                window.location = url;
                return item;
            } 
            
            return '';
        }
    });
}