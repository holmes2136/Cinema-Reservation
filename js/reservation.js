﻿$(function () {

    var settings = {
        rows: 5,
        cols: 15,
        rowCssPrefix: 'row-',
        colCssPrefix: 'col-',
        seatWidth: 20,
        seatHeight: 20,
        seatCss: 'seat',
        selectedSeatCss: 'selectedSeat',
        selectingSeatCss: 'selectingSeat'
    };


    //初始化
    //若有已經訂位的位置,則需要預設顏色
    function init() {

    }


    //點擊每個位置時
    $('.' + settings.seatCss).dblclick(function () {

        if ($(this).attr('class') == settings.seatCss) {
            $(this).removeClass(settings.seatCss)
                   .toggleClass(settings.selectingSeatCss);
        } else {
            $(this).toggleClass(settings.seatCss);
        }

    });

    //正常選位
    $("#reservation").click(function () {
        var col, row, seatId,
            $hasSelected = $(".selectingSeat"),
            hasSelectedLen = $hasSelected.length,
            res_constraint = $("#txt_reservation_constraint").val();

        if (hasSelectedLen > res_constraint) { alert('訂票數量不能超過' + res_constraint + "張!"); return; }

        var result = preventCrossSeat();

        if (result === false) return;

        $.each($('#place li.' + settings.selectingSeatCss), function (index, value) {

            col = $(this).attr('col');
            row = $(this).attr('row');

            $(this).addClass(settings.selectedSeatCss);
            $(this).removeClass(settings.selectingSeatCss);
            TakeReservation(seatId, col, row);
        });

    });

    //隨機選位
    $("#btn_random_reservation").click(function () {
        var $seats = $(".seat"),
                maxSeats = $seats.length,
                radom_number = Math.floor((Math.random() * 21) + 1);

        $($seats[radom_number]).removeClass(settings.seatCss).addClass(settings.selectedSeatCss);

    });


    //避免選取跨位的座位
    function preventCrossSeat() {
        var $selectedSeat = $(".selectingSeat"),
             selectedSeatArray = [],
             result = true;

        $selectedSeat.each(function (index, val) {
            var $seat = $(val);
            selectedSeatArray.push($seat.attr('col'));
        });

        $.each(selectedSeatArray, function (index, val) {
            var first = val;
            var next = !!selectedSeatArray[index + 1] ? selectedSeatArray[index + 1] : 0;
            var number;

            number = next - first;

            if (number > 1) {
                result = false;
                alert('不能選取跨位的座位');
                return false;
            }
        });

        return result;
    }


    //預約動作
    function TakeReservation(seatId, col, row) {
        $.ajax({
            type: "GET",
            url: "Webservice/Reservation_do.ashx",
            data: { seatId: seatId, col: col, row: row }
        }).done(function (msg) {
            alert("訂位: " + msg.Msg);
        });

    }

});