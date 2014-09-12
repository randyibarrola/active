$(function(){
    $('#printBtn').click(function(e){
        e.preventDefault();
        $('.backstretch').addClass('hidden-print');
        window.print();
    })
})


