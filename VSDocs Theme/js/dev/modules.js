/* global jQuery, ZeroClipboard  */

(function($){
	"use strict";

	// Get the correct copy message depending on client's OS.
	var getCopyMessage = function (action) {
		var actionMsg = '';
		var actionKey = (action === 'cut' ? 'X' : 'C');

		if(/iPhone|iPad/i.test(navigator.userAgent)) {
	        actionMsg = 'no support :(';
	    } else if (/Mac/i.test(navigator.userAgent)) {
	        actionMsg = 'press ⌘-' + actionKey + ' to ' + action;
	    } else {
	        actionMsg = 'press Ctrl-' + actionKey + ' to ' + action;
	    }

	    return actionMsg;
	};
	
	// Module name: Copy to clipboard
	// Dependencies: clipboard.js.min.js
	// Docs: https://github.com/zenorocha/clipboard.js/
	(function(){

		var clipboard = new Clipboard('.js-copy-to-clipboard', {
			target: function (trigger) {
				return $(trigger).parent().find('.js-code')[0];
			}
		}).on('success', function (e) {
			e.clearSelection();

			$(e.trigger).text('copied');
			setTimeout(function () {
				$(e.trigger).text('copy');
			}, 700);

		}).on('error', function (e) {
			$(e.trigger).text(getCopyMessage(e.action)).addClass('copy-code-error');
			setTimeout(function () {
				$(e.trigger).text('copy').removeClass('copy-code-error');
			}, 1400);
		});

	})();

	// Module name: Filetree
	// Dependencies: jquery.treeView.js
	// Docs: https://github.com/samarjeet27/TreeViewJS
	(function(){
		$('.js-file-tree').each(function () {
			var fileTree = $(this);
			var expanded = fileTree.data('expanded');
			fileTree.treeView();

			if(expanded === true){
				fileTree.treeView('expandAll');
			}

			$('.js-expand', fileTree.parent()).click(function () {
				fileTree.treeView('expandAll');
			});

			$('.js-collapse', fileTree.parent()).click(function () {
				fileTree.treeView('collapseAll');
			});
		});
	})();

	// Module name: Modal
	// Dependencies: jquery.bPopup.js
	// Docs: https://github.com/dinbror/bpopup
	(function(){
		$('.js-open-modal').click(function(event) {
			event.preventDefault();

			var button   = $(this),
				target   = $(button.data('target')),
				options  = button.data('config'),
				defaults = {
					closeClass: 'js-close-modal-button'
				};

			$.extend(defaults, options);
			
			target.bPopup(defaults);
		});
	})();

	// Module name: Before and After
	// Dependencies: jquery.twentytwenty.js
	// Docs: https://github.com/zurb/twentytwenty
	(function(){
		$(window).load(function () {
			$('.js-ba').twentytwenty();
		});
	})();

	// Module name: FAQ
	// Dependencies: jquery.fastLiveFilter.js
	// Docs: https://github.com/awbush/jquery-fastLiveFilter
	(function(){
		var faqFilters = $('.js-faq-filter');
		var faqs = $('.js-faq');

		faqFilters.each(function() {
			var faqFilter = $(this);
			var faqFilterInput = faqFilter.find('input');
			var target = faqFilter.data('target');

			if(typeof target !== 'undefined'){
				faqFilterInput.fastLiveFilter(target, {
					selector: $(target).find('.faq-question')
				});
			}

		});

		faqs.each(function() {
			var faq = $(this);
			var questions = faq.find('.faq-question');

			questions.click(function (event) {
				event.preventDefault();

				var question = $(this);
				var scope = question.closest('.faq-item');
				var answer = $('.faq-answer', scope);

				if(answer.hasClass('active')){
					question.removeClass('active');
					answer.stop().slideUp().removeClass('active');
				}else{
					question.addClass('active');
					answer.stop().slideDown().addClass('active');
				}
			});
		});
	})();

	// Module name: Interactive steps
	// Dependencies: jquery.steps.js
	// Docs: https://github.com/rstaib/jquery-steps
	(function(){
		var steps = $('.js-steps-interactive');

		steps.each(function() {
			var step = $(this);
			var config = {
				headerTag: "h4",
			    transitionEffect: "fade",
			    enableAllSteps: true,
			    labels: {
			    	current: ''
			    }
			};
			var userConfig = step.data('config');

			$.extend(true, config, userConfig);
			steps.steps(config);
		});
	})();
		 
	// Module name: Tabs
	// Dependencies: jquery.steps.js
	// Docs: https://github.com/rstaib/jquery-steps
	(function(){
		var tabsList = $('.js-tabs');

		tabsList.each(function() {
			var tab = $(this);
			var config = {
				headerTag: "h4",
			    bodyTag: "div",
			    titleTemplate: '#title#',
			    transitionEffect: "fade",
			    enableFinishButton: false,
		        enablePagination: false,
		        enableAllSteps: true,
		        labels: {
			    	current: ''
			    }
			};
			var userConfig = tab.data('config');

			$.extend(true, config, userConfig);
			tab.steps(config);
		});
	})();

	// Module name: Video
	// Dependencies: jquery.fitvids.js
	// Docs: https://github.com/davatron5000/FitVids.js
	(function(){
		$('body').fitVids();
	})();

	// Module name: Video Advanced
	// Dependencies: jquery.ytv.js
	// Docs: https://github.com/Giorgio003/Youtube-TV
	(function(){
		var vids = $('.js-video-advanced');

		vids.each(function() {
			var vid = $(this);
			var config = {
				apiKey: vid.data('api')				
			};
			var userConfig = vid.data('config');
			$.extend(true, config, userConfig);

			vid.ytv(config);

			vid.removeAttr('data-api');
		});

	})();

	// Module name: Menu Mobile
	// Dependencies: jquery.slicknav.js
	// Docs: https://github.com/ComputerWolf/SlickNav
	(function(){
		var menus = $('.js-menu');

		menus.each(function() {
			var menu = $(this);
			var config = {
				label: '',
				prependTo: menu.parent(),
				closedSymbol: '&#xf054',
				openedSymbol: '&#xf078',
				allowParentLinks: true
			};

			var userConfig = menu.data('config');

			// Merge default and user's configurations
			$.extend(true, config, userConfig);

			// Initialize SlickNav
			menu.slicknav(config);

			// Initialize SuperFish
			menu.superfish({
				delay: 300,
			    autoArrows: false,
			    speed: 'fast',
			    disableHI: true
			});

			// Switch to light menu on mobiles if necessary
			if(menu.hasClass('menu-light')){
				$('.slicknav_menu').addClass('menu-light');
			}

			// Close menu on offclick
			$('body').click(function() {
				if($('.slicknav_btn').hasClass('slicknav_open')){
					menu.slicknav('close');
				}
			});

			$('.slicknav_btn, .slicknav_nav').on('click', function(event) {
				event.stopPropagation();
			});

		});
	})();

	// Module name: Menu Side
	// Dependencies: jquery.sidr.js
	// Docs: https://github.com/artberri/sidr
	(function(){
		var position = 'left';
		var button = $('.js-menu-side');

		if(button.length){
			if(button.data('position') === 'right'){
				position = 'right';
			}

			button.sidr({
				source: '.js-menu-side-content',
				side: position
			});

			$('.page').click(function() {
				if($('#sidr').is(':visible')){
					$.sidr('close');
				}
			});

			button.click(function(event) {
				event.stopPropagation();
			});
		}


	})();

	// Module menu: Fixed sidebar
	// Dependencies: no dependencies
	var FixedSidebar = (function(){
		var sidebars = $('.js-sidebar-fixed');
		var additionalOffset = 30;
		var pub = {};

		pub.updateSidebarWidth = function (sidebar) {
			if(sidebar){
				sidebar.outerWidth(sidebar.parent().outerWidth());
			}
		}
		pub.updateFixedSidebar = function (sidebar) {
			var topDistance = $(window).scrollTop();
			var layout = sidebar.closest('.js-layout');
			var layoutHeight = layout.outerHeight();
			var layoutOffset = layout.offset().top - additionalOffset;
			var sidebarHeight = sidebar.outerHeight();
			var heightLeft = topDistance + sidebarHeight - layoutHeight - layoutOffset;

			// Update wrapper height - act as a placeholder
			sidebar.closest('.js-sidebar-wrapper').height(sidebar.outerHeight());

			// If sidebar should be fixed
			if(topDistance > layoutOffset && heightLeft <= 0){
				sidebar.addClass('sidebar-is-fixed').removeClass('sidebar-is-bottom');
				pub.updateSidebarWidth(sidebar);

			// If sidebar should be sticked to the bottom
			}else if(topDistance > layoutOffset && heightLeft > 0){
				sidebar.removeClass('sidebar-is-fixed').addClass('sidebar-is-bottom');
				pub.updateSidebarWidth(sidebar);

			// If sidebar should be static
			}else{
				sidebar.removeClass('sidebar-is-fixed sidebar-is-bottom');

			}
		}

		sidebars.each(function() {
			var sidebar = $(this);
			var resizeTimer;

			// Wrap all the sidebars
			sidebar.wrap('<div class="js-sidebar-wrapper">');

			pub.updateFixedSidebar(sidebar);
			pub.updateSidebarWidth(sidebar);

			$(window).on('resize', function(e) {
				clearTimeout(resizeTimer);
				resizeTimer = setTimeout(function() {
					if (sidebar.is(':visible')) {
						pub.updateSidebarWidth(sidebar);
						pub.updateFixedSidebar(sidebar);
					}
				}, 250);
			});

			$(window).scroll(function () {
				if (sidebar.is(':visible')) {
					pub.updateFixedSidebar(sidebar);
				}
			});
		});

		return pub;

	})();

	// Module name: Menu Vertical
	// Dependencies: tendina.min.js, jquery.resmenu.js
	// Docs: 
	// https://github.com/iprignano/tendina
	// https://github.com/micc83/ReSmenu
	(function(){
		var menus = $('.js-menu-vertical');

		menus.each(function() {
			var menu = $(this);
			var prependTo = menu.data('prepend-to');
			var select = menu.data('select');

			menu.find('li').each(function() {
				if ($(this).has('ul').length) {
					$(this).addClass('has-children');
				};
			});

			menu.tendina({
				animate: false,
				activeMenu: '.selected',
				openCallback: function() {
					FixedSidebar.updateFixedSidebar(menu.closest('.js-sidebar-fixed'));
				}
			});


			menu.ReSmenu({
				maxWidth: 974,
				prependTo: prependTo,
				menuClass: "vertical-menu-select",
				selectId: "vertical-menu-dropdown",
				activeClass: "selected",
				selectOption: select
			});
		});
	})();

	// Module name: Search Minimal
	// Dependencies: no dependencies
	(function(){
		var searchIcons = $('.js-search-minimal-icon');

		searchIcons.each(function () {
			var btn = $(this);
			var scope = btn.closest('.js-search-minimal');
			var input = scope.find('.js-search-minimal-input');

			btn.click(function () {
				if(!input.is(':visible')){
					input.fadeIn('fast');
					$('input', input).focus();
				}else{
					input.fadeOut('fast');
				}
			});
		});
	})();

	// Module name: Scroll Top
	// Dependencies: no dependencies
	(function(){
		var scrollButton = $('.js-scroll-top');

		scrollButton.click(function(e) {
			e.preventDefault();
			$("html, body").animate({ scrollTop: "0px" });
		});
	})();

	// Module name: Full Page Section
	// Dependencies: no dependencies
	(function(){
		var elems = $('.js-full-page');
		var height = $(window).height();
		var doit;

		elems.outerHeight(height);

		function resizedw(){
			height = $(window).height();
		    elems.outerHeight(height);
		}

		window.onresize = function(){
			clearTimeout(doit);
			doit = setTimeout(resizedw, 100);
		};
	})();

	// Module name: Scroll To
	// Dependencies: no dependencies
	(function(){
		var buttons = $('.js-scroll-to');

		buttons.each(function () {
			var button = $(this);
			var target = button.data('target');
			var speed = button.data('speed') ? button.data('speed') : 1000;

			if(typeof target !== 'undefined' && $(target).length){
				button.click(function(event) {
					event.preventDefault();

					$('html, body').animate({
				        scrollTop: $(target).first().offset().top
				    }, speed);
				});
			}
		});
	})();

	// Module name: Documentation version
	// Dependencies: no dependencies
	(function(){
		var scope = $('.js-docs-version');
		var currentBtn = scope.find('.js-docs-current-version');
		var versionList = scope.find('.js-docs-version-list');

		if(scope.length){
			currentBtn.click(function (e) {
				e.preventDefault();
				e.stopPropagation();

				if(versionList.is(':visible')){
					versionList.fadeOut('fast');
				}else{
					versionList.fadeIn('fast');
				}
			});

			$('body').click(function() {
				if(versionList.is(':visible')){
					versionList.fadeOut('fast');
				}
			});
		}
	})();

	// Module name: Notes
	// Dependencies: no dependencies
	(function(){
		var elems = $('.js-note');

		elems.each(function () {
			var note = $(this);
			var close = note.find('.js-close');
			close.click(function(e) {			
				e.preventDefault();
				note.fadeOut();
			});
		});
	})();

	// Module name: Grid View
	// Dependencies: jquery.equalHeight.js
	// Docs: https://github.com/Sam152/Javascript-Equal-Height-Responsive-Rows
	(function(){
		var grid = $('.js-grid-view');
		var elems = grid.find('.js-grid-view-elem');

		elems.responsiveEqualHeightGrid();
	})();

	// Module name: Steps Slider
	// Dependencies: owl.carousel.min.js
	// Docs: https://github.com/smashingboxes/OwlCarousel2
	(function(){
		var slider = $('.js-steps-slider');

		slider.owlCarousel({
			items: 1,
			margin: 5,
			nav: true,
			navText: ['&#xf104;','&#xf105;'],
			navSpeed: 600,
			dragEndSpeed: 600
		});
	})();

	// Module name: Gif Player
	// Dependencies: jquery.gifplayer.js
	// Docs: https://github.com/rubentd/gifplayer
	(function(){
		var gifs = $('.js-gif-player');

		gifs.gifplayer({
			label: '&#xf04b;'
		});
	})();

	// Module name: Rotator
	// Dependencies: morphext.js
	// Docs: https://github.com/MrSaints/Morphext
	(function(){
		var rotators = $('.js-rotator');

		rotators.Morphext({
			animation: "bounceIn",
			separator: ",",
			speed: 2000
		});
	})();

	// Module name: Notification
	// Dependencies: no dependencies
	(function(){
		var notifications = $('.js-notification');

		notifications.each(function () {
			var elem = $(this);
			var close = elem.find('.js-close');

			close.click(function (e) {
				e.preventDefault();
				elem.slideUp(500);
			});
		});
	})();


	// Module name: Languages
	// Dependencies: no dependencies
	(function(){
		var languages = $('.js-languages');

		languages.each(function() {
			var language = $(this);
			var list = language.find('.js-languages-list');

			language.mouseenter(function() {
				list.stop().fadeIn();
			}).mouseleave(function () {
				list.stop().fadeOut();
			});
		});
	})();

	// Module name: Parallax
	// Dependencies: no dependencies
	(function(){
		var elems = $('.js-parallax');

		elems.each(function () {
			var elem = $(this);
			var height = elem.outerHeight();
			var percent = height * 0.4;

			elem.css('background-size', '120%');

			$(window).scroll(function () {
				var top = $(window).scrollTop();
				var offsetBottom = elem.offset().top + height;
				var scrolledPercents = (top * 100) / height;
				var move = -(percent * scrolledPercents) / 100;


				if (top < offsetBottom){
					elem.css('background-position', 'center '+ move + "px");
				}

			});
		});
	})();

	// Module name: Animate numbers
	// Dependencies: jquery.animateNumbers.js
	// Docs: https://github.com/talmand/jquery-animate-numbers
	(function(){
		var elems = $('.js-animate-number');
		var animateNumbers = function (elem) {
			if(elem.data('animated') !== true){
				var scrollTop = $(window).scrollTop() + $(window).outerHeight();
				var elemOffset = elem.offset().top + elem.outerHeight();

				if(scrollTop > elemOffset){
					elem.data('animated', true);
					elem.animateNumbers(elem.data('number'), false, 2000, "swing");
				}
			}
		};

		elems.each(function() {
			var elem = $(this);
			animateNumbers(elem);

			$(window).scroll(function () {
				animateNumbers(elem);
			});
		});

	})();

	// Module name: Placeholder fix for old browsers
	// Dependencies: jquery.placeholder.js
	// Docs: https://github.com/mathiasbynens/jquery-placeholder
	(function(){
		$('input, textarea').placeholder();
	})();

	// Module name: Info
	// Dependencies: no dependencies
	(function(){
		var infos = $('.js-info');

		infos.each(function () {
			var info = $(this);
			var closeBtn = info.find('.js-info-close');
			closeBtn.click(function (e) {
				e.preventDefault();
				info.slideUp();
			});
		});
	})();

	// Module name: Changelog
	// Dependencies: jquery.instafilta.js
	// Docs: https://github.com/chromawoods/instaFilta/
	(function(){
		var changelogs = $('.js-changelog');

		changelogs.each(function() {
			var changelog = $(this);
			var changelogItems = changelog.find('.js-changelog-item');

			var changelogFilter = changelog.find('.js-changelog-input').instaFilta({
				scope: '.js-changelog',
				targets: '.js-changelog-update-description'
			});
			
			var changelogCheckBox = changelog.find('.js-changelog-checkbox');

			changelogItems.each(function() {
				var changelogItem = $(this);
				var switchBtn = changelogItem.find('.js-changelog-switch');

				switchBtn.click(function(e) {
					e.preventDefault();
					changelogItem.toggleClass('changelog-view-files');
				});
			});

			changelogCheckBox.on('change', function () {
				var checkedCategories = [];

			    changelogCheckBox.each(function() {
			        if ($(this).prop('checked')) {
			            checkedCategories.push($(this).val());
			        }
			    });

			    changelogFilter.filterCategory(checkedCategories);
			});
		});
	})();

	// Module name: Video Playlist Custom
	// Dependencies: video.js, videojs-playlist.js
	// Docs: https://github.com/videojs/video.js
	// https://github.com/tim-peterson/videojs-playlist
	(function(){
		var videoPlaylists = $('.js-video-playlist');

		videoPlaylists.each(function() {
			var video = $(this);
			var videoId = video.attr('id');
			var config = video.data('config');

			videojs(videoId, {
				controlBar: {
				    // Remove the full screen toggle button from the panel
					// It's a workaround, since there's no way to add custom buttons at specific index
					fullscreenToggle: false
				}
			}).ready(function(event){
			    var myPlayer = this;
			    var myPlaylist = null;

			    if (config) {
				    myPlaylist = myPlayer.playlist(config);
			    }else{
				    myPlaylist = myPlayer.playlist();
			    }

			    // Create and add the previous button to the panel
			    myPlayer.controlBar.addChild('button').addClass('vjs-prev-button').on('click', function () {
			    	myPlaylist.prev();
			    });

			    // Create and add the next button to the panel
			    myPlayer.controlBar.addChild('button').addClass('vjs-next-button').on('click', function () {
			    	myPlaylist.next();
			    });

			    // Add the full screen toggle button to the panel
				// It's a workaround, since there's no way to add custom buttons at specific index
			    myPlayer.controlBar.addChild('fullscreenToggle');

			});

		});

		$('.js-video-playlist-item-download').click(function(event) {
			event.stopPropagation();
		});

	})();

	// Module name: Fragment Identifier
	// Dependencies: clipboard.js.min.js
	// Docs: https://github.com/zenorocha/clipboard.js/
	(function(){

		var clipboard = new Clipboard('.js-fragment-identifier', {
			text: function (trigger) {
				return window.location.host + window.location.pathname + $(trigger).attr('href')
			}
		}).on('success', function (e) {
			e.clearSelection();

			$(e.trigger).addClass('fragment-identifier-copied');
			setTimeout(function () {
				$(e.trigger).removeClass('fragment-identifier-copied');
			}, 1000);

		}).on('error', function (e) {
			$(e.trigger).addClass('fragment-identifier-error');
			setTimeout(function () {
				$(e.trigger).removeClass('fragment-identifier-error');
			}, 1400);
		});

		$('.js-fragment-identifier').click(function(event) {
			event.preventDefault();

			var btn = $(this);
			var href = btn.attr('href');

			if (btn.hasClass('fragment-identifier-scroll')) {
			    $('html, body').animate({
			        scrollTop: $(href).offset().top
			    }, 500, function () {
			        window.location.hash = href;
			    });
			}

		});
	})();

	// Module name: Contact Form
	// Dependencies: jquery.form-validator.min.js
	// Docs: https://github.com/victorjonsson/jQuery-Form-Validator
	(function(){
		var form = $('#js-contact-form');

		if(form.length){
			var submitForm = function ($form) {
				var formURL = $form.attr("action"); // Get the form's action
				var postData = $form.serialize(); // Serialize the form's data
				var successMessage = $('.js-contacts-success'); // Select the success modal

				// Submit an AJAX request
				$.ajax({
				    url : formURL,
				    type: "POST",
				    data : postData,
				    success:function(data, textStatus, jqXHR) {
				    	// On success clear the data from the inputs
				    	$form.find('input:text, textarea').val(''); 
				    	// Show the success modal for 2 seconds
				    	successMessage.fadeIn().delay(2000).fadeOut();
				    }
				});

				// Prevent form default behavior
				return false;
			}

			// Validate the contact form, if succeeded, call the submitForm function
			$.validate({
		  		form : form,
		  		onSuccess: submitForm
			});
		}		
	})();

	// Module name: Footer Fixed
	// Dependencies: no dependencies
	(function(){
		var footerFixed = $('.js-footer-is-fixed'); // Select the fixed footer
		var page = $('.js-page'); // Select the page
		var resizeTimer; // Define the timer

		// Calculate the footer height and set it as a padding-bottom to the page 
		var updateHeight = function () {
			var footerHeight = footerFixed.outerHeight();
			page.css('padding-bottom', footerHeight + 'px');
		}

		// Check if fixed footer is enabled of disabled
		if (footerFixed.length) {
			footerFixed.addClass('footer-is-fixed');
			updateHeight();

			// Update the height on window resize
			$(window).on('resize', function(e) {
				clearTimeout(resizeTimer);
				resizeTimer = setTimeout(function() {
					updateHeight();
				}, 250);
			});
		};
	})();

	// Module name: Video Background
	// Dependencies: videojs-bigvideo.js
	// Docs: https://github.com/dfcb/BigVideo.js
	(function(){
		if ($('.js-video-background').length) {
			// Create a BigVideo instance
			var BV = new $.BigVideo({
		        container:$('.js-video-background')
		    });

			// Initiate the BigVideo plugin
		    BV.init();

		    // Check if it's a touch device
		    if (Modernizr.touch) {
		    	// If so, show the video poster as these devices do not support auto-play
		        BV.show("http://themes.vsart.me/presentation/vsdocs/video/header-poster.jpg");
		    } else {
		    	// Play the video by the given sources
	    	    BV.show([
	    		    { type: "video/mp4",  src: "http://themes.vsart.me/presentation/vsdocs/video/header.mp4" },
	                { type: "video/webm", src: "http://themes.vsart.me/presentation/vsdocs/video/header.webm" },
	                { type: "video/ogg",  src: "http://themes.vsart.me/presentation/vsdocs/video/header.ogv" }
	        	],{ambient:true})
		    }
		};
	})();

	// Module name: Custom Scrollbar
	// Dependencies: jquery.jscrollpane.js, jquery.mousewheel-3.0.6.js
	// Docs: https://github.com/vitch/jScrollPane
	// Settings: http://jscrollpane.kelvinluck.com/settings.html
	(function(){
		// Select the custom scrollable areas
		var customScrollbars = $('.js-custom-scrollbar');

		customScrollbars.each(function() {
			var customScrollbar = $(this);
			var resizeTimer;
			var api;

			// Initialize the plugin
			customScrollbar.jScrollPane({
				mouseWheelSpeed: 40
			});

			// Accessing the plugin's API
			api = customScrollbar.data('jsp');

			$(window).on('resize', function(e) {
				clearTimeout(resizeTimer);
				resizeTimer = setTimeout(function() {
					// On Window resize done, update the plugin
					api.reinitialise();
				}, 250);
			});

		});

	})();

	// Module name: One Page Navigation
	// Dependencies: jquery.nav.js
	// Docs: https://github.com/davist11/jQuery-One-Page-Nav
	(function(){
		// Select one page navigation elements
		var navs = $('.js-one-page-nav');

		navs.each(function() {
			var nav = $(this);

			// Initialize the plugin
			nav.onePageNav({
				currentClass: "is-active",
				filter: ':not(.is-external)'
			});
		});
	})();

})(jQuery);