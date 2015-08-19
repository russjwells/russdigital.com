$(document).ready(function () {
	//alert("javascript on");

	//leftList toggle
	var leftListOut = 1;

	$('#listButton img').click(function() {
		//alert('clickled');
		if (leftListOut==1){
				$('#leftList').animate({
					left: "-200",
				}, 200, function(){
					//switch arrow
					leftListOut=0;
					$('#listButton img').attr("src", "g/img/rightarrow.png");
				});
				$('#workContainer').css("marginLeft","40");
				//$('#workContainer').animate({
				//	marginLeft: '40px';
				//}, 200);
		}else{
			$('#workContainer').css("marginLeft","240");
			$('#leftList').animate({
					left: "0",
				}, 200, function(){
					//switch arrow
					leftListOut=1;
					$('#listButton img').attr("src", "g/img/leftarrow.png");
					//$('#workContainer').css("marginLeft","240");
				});
			
			//$('#workContainer').animate({
			//		marginLeft: '240px';
			//	}, 200);
		}
	

	});

	//slide project links
	$(function() {
		//alert("new function");
	    $('.anchorLink').bind('click',function(event){
	        var anchor = $(this);
	 
	        $('html, body').stop().animate({
	            scrollTop: $(anchor.attr('href')).offset().top-60
	        }, 1500,'easeInOutExpo');
	        /*
	        if you don't want to use the easing effects:
	        $('html, body').stop().animate({
	            scrollTop: $($anchor.attr('href')).offset().top
	        }, 1000);
	        */
	        event.preventDefault();
	    });
	});


	//project gallery
	$('.projectThumbnails img').on('click', function(event) {
		var projectName = this.src.match(/(\w+(?=[\d][_]t.jpg))/)[0];
		var imageName = this.src.match(/(\w+[\d])(?=[_]t.jpg)/)[0];
		var targetImage = ('w/' + projectName + "/" + imageName + ".jpg");

		var project = "#" + projectName;
		$(project).find('img').fadeOut(400, function() {
			$(project).find('img').attr('src', targetImage);
			$(project).find('img').fadeIn(400);
			// $(project).html("<img width=\"750\" height=\"430\" src=\"" + targetImage + "\"</img>").fadeIn('slow');
		});

		// $("." + projectName).find('img').fadeOut(400, function() {
		// // $(this).parent('.projectThumnails').prev('.projectImage').find('img').fadeOut(400, function() {
		// 	this.src = targetImage;
		// 	$(this).fadeIn(400);
		// });
	});
	// $('.projectThumbnails img').click(function() {
	// 	var thmb = this;
	// 	var src  = this.src;
	// 	alert(this);
	// 	$(thmb).parent('.projectThumbnails').prev('.projectImage').find('img').fadeOut(400,function(){
	// 	    thmb.src = this.src;
	// 	    $(this).fadeIn(400)[0].src = src;
	// 	});
	// });

});