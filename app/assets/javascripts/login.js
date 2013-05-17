/*
 * MWS Admin v2.1 - Login JS
 * This file is part of MWS Admin, an Admin template build for sale at ThemeForest.
 * All copyright to this file is hold by Mairel Theafila <maimairel@yahoo.com> a.k.a nagaemas on ThemeForest.
 * Last Updated:
 * December 08, 2012
 *
 */
 
(function($) {
	$(document).ready(function() {	
		$("#mws-login-form form").validate({
			rules: {
				username: {required: true}, 
				password: {required: true}
			}, 
			errorPlacement: function(error, element) {  
			}
		});
		
		$.fn.placeholder && $('[placeholder]').placeholder();
	});
}) (jQuery);
