modules = {
	
	utils {
		dependsOn 'jquery'
		resource url: 'css/bootstrap.min.css'
		resource url: 'css/fancybox/jquery.fancybox.css'
		resource url: 'css/flexslider.css'
		resource url: 'css/style.css'
		resource url: 'css/skins/default.css'
		
		
		resource url: 'css/dist/css/select2.css'
		/*
		 * <link href="path/to/select2.min.css" />
<script src="path/to/select2.min.js"></script>*/
		//select2
		//resource url: 'cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.css'
		//resource url: 'cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2-bootstrap.min.css'
		//resource url: 'css/select2/select2.min.css'
		//resource url: 'css/select2/select2-bootstrap.min.css'
		
		resource url: 'images/valide.png'		
		resource url: 'images/upVote.png'		
		resource url: 'images/downVote.png'		
		resource url: 'images/check.png'		
		resource url: 'images/drapeau-anglais.png'		
		resource url: 'images/Drapeau-francais.png'		 
		
		resource url: 'images/photos/thumb1.jpg'		
		resource url: 'images/photos/thumb2.jpg'		
		
		resource url: 'js/jquery.js'
		resource url: 'js/jquery.easing.1.3.js'
		resource url: 'js/bootstrap.min.js'
		resource url: 'js/jquery.fancybox.pack.js'
		resource url: 'js/jquery.fancybox-media.js'
		resource url: 'js/google-code-prettify/prettify.js'
		resource url: 'js/portfolio/jquery.quicksand.js'
		resource url: 'js/portfolio/setting.js'
		resource url: 'js/jquery.flexslider.js'
		resource url: 'js/animate.js'
		resource url: 'js/custom.js'
		resource url: 'http://html5shim.googlecode.com/svn/trunk/html5.js', disposition: 'head'
		
		
		resource url: 'css/dist/js/select2.js'
		//select2
		//resource url: 'cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.js', disposition: 'head'
		//resource url: 'js/select2/select2.min.js', disposition: 'head'
	}
	
	wysiwyg {
		dependsOn 'jquery'
		defaultBundle false
		resource url: 'js/ckeditor/ckeditor.js', disposition: 'head', exclude: 'hashandcache'
		resource url: 'js/wysiwyg.js'
		}

}
