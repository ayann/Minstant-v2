jQuery(window).bind('page:change',function() {
	var tmp=[]
	$('#form-change').click(function(e) {
		e.preventDefault();
		path=$(this).attr('href');
		console.log(path)
		if (path=='#inscription') {
			$(this).attr('href', '#connexion');
			$(this).text('Connexion');
			$('#connexion').stop().slideUp(500);
			$('#image img').slideUp('500');
			$('#inscription').stop().delay(500).slideDown('500', function() {
				$('#image img').attr('src', '/assets/clip.png').slideDown('500');
			});
		}else{
			$(this).attr('href', '#inscription');
			$(this).text('Inscription')
			$('#inscription').stop().fadeOut(500);
			$('#image img').fadeOut('500');
			$('#connexion').stop().delay(500).fadeIn('500', function() {
				$('#image img').attr('src', '/assets/Lockicon.png').fadeIn('500');
			})
		}
	});
	//----- partenaires
	$('#partenaires .columns').each(function(index, el) {
		$(this).hover(function() {
			/* Stuff to do when the mouse enters the element */
			$(this).find('.panel div.text').stop().delay(200).slideDown('slow');
		}, function() {
			$(this).find('.panel div.text').stop().delay(200).slideUp('slow');
			/* Stuff to do when the mouse leaves the element */
		});
	});
});