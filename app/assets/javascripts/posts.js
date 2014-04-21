$(function(){
	$(".hide-btn").click(function(){
		if ($(".comments").hasClass("hide")){
			$(".comments").removeClass("hide");
			$(".hide-btn").text("hide comments");
		}else{
			$(".comments").addClass("hide");
			$(".hide-btn").text("show comments");
		}
	});
});