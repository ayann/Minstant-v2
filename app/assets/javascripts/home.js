jQuery(window).bind('page:change',function() {
	$('#inscrip-connex').on('click', '#form-change[href=#inscription]', function(event) {
		event.preventDefault();
		/* Act on the event */
		$('#connexion').stop().slideUp(500);
		$('#image img').slideUp('500');
		$('#inscription').stop().delay(500).slideDown('500', function() {
			$('#image img').attr('src', '/assets/clip.png').slideDown('500');
		});
	});
	$('#inscrip-connex').on('click', '#form-change[href=#connexion]', function(event) {
		event.preventDefault();
		/* Act on the event */
		$('#inscription').stop().slideUp(500);
		$('#image img').slideUp('500');
		$('#connexion').stop().delay(500).slideDown('500', function() {
			$('#image img').attr('src', '/assets/Lockicon.png').slideDown('500');
		})
	});
});
