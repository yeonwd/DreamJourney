$(document).ready(function() {
    /* 체크인, 체크아웃 날짜 캘린더 선택 */
    var fp = flatpickr(document.getElementById("checkin"), {
       'monthSelectorType' : 'dropdown',
       "locale": "ko", 
       dateFormat: "Y-m-d",
       minDate: "today"
    });
    
flatpickr(document.getElementById("checkout"), {
       'monthSelectorType' : 'dropdown',
       "locale": "ko",
       dateFormat: "Y-m-d",
       minDate: "today"
    });

    var fp = flatpickr(document.getElementById("startdate"), {
       'monthSelectorType' : 'dropdown',
       "locale": "ko", 
       dateFormat: "Y-m-d",
       minDate: "today"
    });
    
        var fp = flatpickr(document.getElementById("startdate3"), {
       'monthSelectorType' : 'dropdown',
       "locale": "ko", 
       dateFormat: "Y-m-d",
       minDate: "today"
    });     
    
         var fp = flatpickr(document.getElementById("startdate4"), {
       'monthSelectorType' : 'dropdown',
       "locale": "ko", 
       dateFormat: "Y-m-d",
       minDate: "today"
    });     
    
    
// 자동 슬라이드 기능 중지
$("#packageSlider").carousel({
    interval: false
});

$("#activitySlider").carousel({
    interval: false
});

$("#travelSlider").carousel({
    interval: false
});

   
});