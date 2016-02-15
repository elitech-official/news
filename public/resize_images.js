$(document).ready( function(){

	var mh = $(document).height()-$('.footer-div').height()- $('.header-wrapper').height();
	$('#size').css('min-height', mh);
	
	$('.sizable').each( function(){
		var par = $(this).parent();
		par.css('overflow','hidden');
		var wi =  par.width();
		var he =  par.height();
		
		if ( wi > he) { $(this).css('width', wi); $(this).css('height', wi); $(this).css('margin-top', ($(this).height() - par.height())/-2);}
		else { $(this).css('width', he); $(this).css('height', he); $(this).css('margin-left', ($(this).width() - par.width())/-2); }
	});	
});

$(window).resize( function(){

	var mh = $(document).height()-$('.footer-div').height()- $('.header-wrapper').height();
	$('#size').css('min-height', mh);
	
	$('.sizable').each( function(){
		var par = $(this).parent();
		par.css('overflow','hidden');
		var wi =  par.width();
		var he =  par.height();
		
		if ( wi > he) { $(this).css('width', wi); $(this).css('height', wi); $(this).css('margin-top', ($(this).height() - par.height())/-2);}
		else { $(this).css('width', he); $(this).css('height', he); $(this).css('margin-left', ($(this).width() - par.width())/-2); }
	});	
});