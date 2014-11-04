jQuery(document).ready(function($) {
  $('a[rel*=facebox]').facebox()

  $("input[name=is_done]").on("click", function (event) {
  	var checkbox = $(this);
  	var item = checkbox.parent();
  	if (item.hasClass('is_done') == true) {
  		checkbox.is_done = false;
  		item.removeClass('is_done');
  		console.log("unmarking as done");
  	} else {
  		checkbox.is_done = true;
  		item.addClass('is_done');
  		console.log("marking as done");
  	}
  });

	$(".delete_chore").on('click', function (event) {
		event.preventDefault();
		var parent = $(this).parent();	
		parent.remove();
	});

})

