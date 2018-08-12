$(function() {
    //01.五秒内自动关闭弹窗
    setInterval(function() {
        var $ad = $("#addiv");
        // console.log($ad);
        // $ad[0].style.display = 'none';
        $ad.hide(2000);
    }, 5000)

    //02.点击按钮直接关闭弹窗
    $("#close").click(function() {
        $("#addiv")[0].style.display = 'none';
    })

    //03.返回主页效果
    var $back = $('#returnTop');
    window.onscroll = function() {
        if (window.scrollY > 100) {
            $back.show(1000);
        } else {
            $back.hide(1000);
        }
        leader = window.scrollY;
    }
    var timer = null;
    var target = 0;
    var leader = 0;
    $back.click(function() {
        clearInterval(timer);
        timer = setInterval(function() {
            var step = (target - leader) / 10;
            step = step > 0 ? Math.ceil(step) : Math.floor(step);
            leader = leader + step;
            window.scrollTo(0, leader);
            if (leader === 0) {
                clearInterval(timer);
            }
        }, 25);
    });

    // 04.蜂巢效果
    $("#beeimg2").mouseover(function(){
        $("#beeimg2").fadeOut(300,function(){
        this.src = "../images/logo/man.png";
        }).fadeIn(300);
    });
    $("#beeimg2").mouseleave(function(){
        $("#beeimg2").fadeOut(300,function(){
        this.src = "../images/logo/square_small.png";
        }).fadeIn(300);
    });
    $("#beeimg3").mouseover(function(){
        $("#beeimg3").fadeOut(300,function(){
        this.src = "../images/logo/plane.png";
        }).fadeIn(300);
    });
    $("#beeimg3").mouseover(function(){
        $("#beeimg3").fadeOut(300,function(){
        this.src = "../images/logo/square_small.png";
        }).fadeIn(300);
    });
    $("#beeimg4").mouseover(function(){
        $("#beeimg4").fadeOut(300,function(){
        this.src = "../images/logo/man.png";
        }).fadeIn(300);
    });
    $("#beeimg4").mouseover(function(){
        $("#beeimg4").fadeOut(300,function(){
        this.src = "../images/logo/square_small.png";
        }).fadeIn(300);
    });
});