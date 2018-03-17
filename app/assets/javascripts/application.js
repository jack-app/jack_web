// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .


$(function() {
    $(window).scroll(function () {
        if (($(window).scrollTop() > 0)&&($(window).width() <= 768)) {
            $('.header').css({"top": "-75px"});
            $('.header ul').css({"opacity": "0"});

        } else {
            $('.header').css({"top": "-0px"});
            $('.header ul').css({"opacity": "1"});
        }
    });
});

$(document).on('turbolinks:load', function(){
    //Barba.js用トランジション設定
    var FadeTransition = Barba.BaseTransition.extend({
        start: function() {
//この関数は、遷移が開始されるとすぐに自動的に呼び出されます。

//読み込みが終了し、古いページがフェードアウトするとすぐに、新しいページがフェードインします。
            Promise
                .all([this.newContainerLoading, this.fadeOut()])
                .then(this.fadeIn.bind(this));
        },

        fadeOut: function() {
//this.oldContainerは古いコンテナのHTMLElementです。この場合はアニメーションでフェードアウトさせている。
            return $(this.oldContainer).animate({ opacity: 0 }).promise();
        },

        fadeIn: function() {
            var _this = this;
//this.newContainerは、新しいコンテナのHTMLElementです。
//この段階では、newContainerはDOM上にあります（barba-container内にあり、visibility：hiddenで囲まれています）。
            var $el = $(this.newContainer);

//古いコンテナをdisplay:none;にした後、新しいコンテナに初期値を設定。
            $(this.oldContainer).hide();
            $el.css({
                visibility : 'visible',
                opacity : 0
            });

            $el.animate({ opacity: 1 }, 400, function() {
//.done（）の記述で古いコンテナを自動的にDOMから削除。
                _this.done();
            });
        }

    });
// returnに作ったトランジションを設定。
    Barba.Pjax.getTransition = function() {
        return FadeTransition;
    };
    //Barba.jsを動かすのに最低限必要な記述。
    Barba.Pjax.start();
});