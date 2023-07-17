//1.approach영역



$(window).on('scroll resize',function(){
    var scrollPos =0;
    scrollPos = $(document).scrollTop();
    fix();

    function fix(){
        if(scrollPos > 500){
            $('.fix .text').addClass('on');
        }
        else{
            $('.fix .text').removeClass('on');
        }
        if(scrollPos > 5000){
            $('.fix .text').removeClass('on');

        }
    }
});