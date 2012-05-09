/*
   define funtion to exec when scroll to page bottom
   Param:
   data(Number) -1:一直翻页; 0:不翻页; n:翻n页
   fn(Function) 当滚动条拖到底部时要执行的函数
   */
var ie = -1;

jQuery.extend({
  scrollPage:function(p, f){
               var n = c = t = h = new Number;
               $(function(){
                 $(window).scroll(function(e){
                   if (n == p) { $(this).unbind("scroll"); }
                   c = document.documentElement.clientHeight;
                   t = $(document).scrollTop();
                   h = $(document).height();
                   res=h - t - c
                   if ( res == 0 || res==1){
                     f();
                     if ( p > 0 ) n += 1;
                   }
                 });
               });
             }
});

var reentry = false;
$.scrollPage(-1, function(){
  startLoadMore();
});

function startLoadMore() {
  if (!reentry) {
    $('#loading_more').show();
    loadMore();
  }
}

function loadMore() {
  reentry = true;
  var lastItemID = $('.hidden-time:last').text();
  var scrollPos = $(document).scrollTop();

  $.ajax({
    url: "/load/"+lastItemID,
    dataType: "script",
    type: "GET",
    success: function (data) {
      if (data === undefined || data === null || data === "") {
        //display warning
      } else {
        $('#loading_more').hide();
        //hookUpMouseEvent();
      }
    },
    complete: function (data) {
                if (ie >= 7 && ie < 9) {
                  window.setTimeout(function() {
                    $(document).scrollTop(scrollPos);
                    reentry = false;
                  }, 10);
                } else {
                  reentry = false;
                }
              }
  });
}

function hookUpMouseEvent() {
  $('.news-item').mouseenter(function() {
    this.style.backgroundColor='#FDFFBF';
    this.style.border='solid 1px #ddd';
    var node = this;
  });

  $('.news-item').mouseleave(function() {
    this.style.backgroundColor='#fff';
    this.style.border='solid 1px #fff';
  });
}

