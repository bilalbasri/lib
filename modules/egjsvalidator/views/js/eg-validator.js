/**
 * 2020  (c) Egio digital
 *
 * MODULE EgJsValidator
 *
 * @author    Egio digital
 * @copyright Copyright (c) , Egio digital
 * @license   Commercial
 * @version    1.0.0
 */

$(document).ready(function() {
	// validation forms
	$.extend( $.validator.messages, {
		required: "Ce champ est obligatoire.",
		remote: "Veuillez corriger ce champ.",
		email: "Veuillez fournir une adresse électronique valide.",
		url: "Veuillez fournir une adresse URL valide.",
		date: "Veuillez fournir une date valide.",
		dateISO: "Veuillez fournir une date valide (ISO).",
		number: "Veuillez fournir un numéro valide.",
		digits: "Veuillez fournir seulement des chiffres.",
		creditcard: "Veuillez fournir un numéro de carte de crédit valide.",
		equalTo: "Veuillez fournir encore la même valeur.",
		notEqualTo: "Veuillez fournir une valeur différente, les valeurs ne doivent pas être identiques.",
		extension: "Veuillez fournir une valeur avec une extension valide.",
		maxlength: $.validator.format( "Veuillez fournir au plus {0} caractères." ),
		minlength: $.validator.format( "Veuillez fournir au moins {0} caractères." ),
		rangelength: $.validator.format( "Veuillez fournir une valeur qui contient entre {0} et {1} caractères." ),
		range: $.validator.format( "Veuillez fournir une valeur entre {0} et {1}." ),
		max: $.validator.format( "Veuillez fournir une valeur inférieure ou égale à {0}." ),
		min: $.validator.format( "Veuillez fournir une valeur supérieure ou égale à {0}." ),
		step: $.validator.format( "Veuillez fournir une valeur multiple de {0}." ),
		maxWords: $.validator.format( "Veuillez fournir au plus {0} mots." ),
		minWords: $.validator.format( "Veuillez fournir au moins {0} mots." ),
		rangeWords: $.validator.format( "Veuillez fournir entre {0} et {1} mots." ),
		letterswithbasicpunc: "Veuillez fournir seulement des lettres et des signes de ponctuation.",
		alphanumeric: "Veuillez fournir seulement des lettres, nombres, espaces et soulignages.",
		lettersonly: "Veuillez fournir seulement des lettres.",
		nowhitespace: "Veuillez ne pas inscrire d'espaces blancs.",
		ziprange: "Veuillez fournir un code postal entre 902xx-xxxx et 905-xx-xxxx.",
		integer: "Veuillez fournir un nombre non décimal qui est positif ou négatif.",
		vinUS: "Veuillez fournir un numéro d'identification du véhicule (VIN).",
		dateITA: "Veuillez fournir une date valide.",
		time: "Veuillez fournir une heure valide entre 00:00 et 23:59.",
		phoneUS: "Veuillez fournir un numéro de téléphone valide.",
		phoneUK: "Veuillez fournir un numéro de téléphone valide.",
		mobileUK: "Veuillez fournir un numéro de téléphone mobile valide.",
		strippedminlength: $.validator.format( "Veuillez fournir au moins {0} caractères." ),
		email2: "Veuillez fournir une adresse électronique valide.",
		url2: "Veuillez fournir une adresse URL valide.",
		creditcardtypes: "Veuillez fournir un numéro de carte de crédit valide.",
		ipv4: "Veuillez fournir une adresse IP v4 valide.",
		ipv6: "Veuillez fournir une adresse IP v6 valide.",
		require_from_group: "Veuillez fournir au moins {0} de ces champs.",
		nifES: "Veuillez fournir un numéro NIF valide.",
		nieES: "Veuillez fournir un numéro NIE valide.",
		cifES: "Veuillez fournir un numéro CIF valide.",
		postalCodeCA: "Veuillez fournir un code postal valide.",
		password: "8 caractères combinant 1 majuscule, 1 minuscule et 1 chiffre.",
		phone: "Veuillez fournir un numéro de téléphone valide."
	});


	//add required to input
	$('input').each(function(){
		if($(this).attr('name') == 's' || $(this).attr('type') == 'email' || $(this).attr('name') == 'message') {//input search
			$(this).attr('required', true);
		}
	});

	//add required to textarea
	$('textarea').each(function(){
		if($(this).attr('name') == 'message') {//input search
			$(this).attr('required', true);
		}
	});

	$('#search-form, #form-newsletter, #contactus-form, #login-form, #customer-form, #pwd-form').each(function(){
		$(this).validate({
			rules: {
				password: {
					required: true,
				},

				s: {
					required: true,
					minlength: 3
				}
			},
			submitHandler: function(form) {
				if($(this).attr("id") === "form-newsletter"){
					e.preventDefault();
					return false;
				}else{
					form.submit();
				}
			},
			success: function(element){
				$('[type="submit"]').removeClass('disabled');
			},
			errorPlacement: function(error, element) {
				if (element.attr('type')=='password')
				{
					error.insertAfter($(element).parents('.input-group')); //So i putted it after the .form-group so it will not include to your append/prepend group.
				}
				else
				{
					error.insertAfter(element);
				}
			}
		});

	});
}, 3000);