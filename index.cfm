<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/css/custom.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">		
		<script src="/js/jquery-1.12.0.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<title>Supacrypter</title>
	</head>
	<body>
	<div class="container">
        <div class="row centered-form">
        <div class="col-lg-8 col-md-offset-2">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    	<h2>Supercrypter</h2>
			    	<hr class="colorgraph">
			    	<p><i>Encrypt to your heart's content!</i></p>
			 	</div>
			 	<div class="panel-body">
				 	<div id="tabs">
						<ul>
							<li><a href="#tabs-1">String Decrypt / Encrypt</a></li>
							<li><a href="#tabs-2">Auto-login</a></li>
						</ul>
						<div id="tabs-1">
							<cfform role="form">
								<div class="row">
									<div class="col-xs-4 col-sm-4 col-md-4">
										<div class="form-group">
											<label for="enctype">Mode: </label><br>
											<label class="radio-inline">
											<input type="radio" id="enctype" name="enctype" value="encrypt" checked>Encrypt</label>
				
											<label class="radio-inline">
											<input type="radio" name="enctype" value="decrypt" >Decrypt</label>
										</div>
									</div>
									<div class="col-xs-8 col-sm-8 col-md-8">
										<div class="form-group">
											<label for="custKey">Custom Key: </label>
											<input type="text" id="custKey" name="custKey" class="form-control" placeholder="Your custom key string (optional)">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12">
										<div class="form-group">
											<label for="msg">Message: </label>
											<textarea name="msg" id="msg" class="form-control" placeholder="Your Message to encrypt or decrypt" rows="3" cols="50" required></textarea>
										</div>
									</div>
								</div>

								<div class="row resultDiv" style="display: none">
									<div class="col-xs-12 col-sm-12 col-md-12">
										<div class="form-group">
											<label for="result">Result: </label>
											<textarea name="result" id="result" class="form-control" rows="3" cols="50"></textarea>
										</div>
									</div>
								</div>
					
								<input type="submit" name="submit" id="submit" class="btn btn-success btn-block" value="Submit">
							</cfform>
						</div>

						<div id="tabs-2">
							Login Stuff goes here
						</div>
					</div>
			    </div>
	    	</div>
    	</div>
    </div>
	<video id="my-video" class="video" loop="loop" muted="yes" autoplay>
  		<source src="/video/timelapse.mp4" type="video/mp4" />
  	</video>
	</body>
	<script>
		$( function() {
			$( "#tabs" ).tabs();
		});
		
		$( "#submit" ).click( function( e ) {
			e.preventDefault();

			var mode = $('input[name=enctype]:checked').val();
			var nkey = $('#custkey').val();
			var msg  = $('#msg').val();

			if( msg.length ) {
				$.ajax({
					dataType: 'JSON',
					method: "POST",
					url: "/ajax/encrypt.cfm",
					data: {mode: mode, nkey: nkey, msg: msg}
				})
				.done(function(msg) {
					if( msg.STATUS && msg.RESULT != "" ) {
						$('.resultDiv').slideUp( function(){
							$('#result').val(msg.RESULT);
							$('.resultDiv').slideDown();
						});
					}else {
						$('.resultDiv').slideUp( function(){
							alert('Could not ' + mode + ' string.');
						});
					}
				});
			} else {
				alert("Please type message to encrypt / decrypt.");
			}
		});
  </script>
</html>