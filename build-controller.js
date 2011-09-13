$(".workedon").each(function() {
    var worker = $(this).attr("worker");
    var y = parseInt($(this).offset().top + $(this).height() / 2);
    var x = parseInt($(this).offset().left + $(this).width() / 2);
    var id = x + "-" + y;
    var html = '<div class="worker" id="' + id + '">' + worker + '</div>';
    $("#content").append(html);
    var new_element = $("#" + id);
    new_element.css("top", parseInt(y - new_element.height() / 2)).css("left", parseInt(x - new_element.width() / 2));
		new_element.addClass('rotate');
});