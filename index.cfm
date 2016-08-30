<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/css/custom.css">
		<script src="/js/jquery-1.12.0.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<title>Supacrypter</title>
	</head>
	<body>
	<div class="container">
        <div class="row centered-form">
        <div class="col-lg-6 col-md-offset-3">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    	<h2>Supercrypter</h2>
			    	<hr class="colorgraph">
			    	<p><i>Encrypt to your heart's content!</i></p>
			 	</div>
			 	<div class="panel-body">
			    	<cfform role="form">
			    		<div class="row">
			    			<div class="col-xs-4 col-sm-4 col-md-4">
			    				<div class="form-group">
			    					<label for="enctype">Mode: </label><br>
									<label class="radio-inline">
    								<input type="radio" name="enctype" value="encrypt" checked>Encrypt</label>
		
  									<label class="radio-inline">
    								<input type="radio" name="enctype" value="decrypt" >Decrypt</label>
    							</div>
			    			</div>
			    			<div class="col-xs-8 col-sm-8 col-md-8">
			    				<div class="form-group">
			    					<label for="newkey">Custom Key: </label>
									<input type="text" name="newkey" class="form-control" placeholder="Your custom key string (optional)">
			    				</div>
			    			</div>
			    		</div>

			    		<div class="row">
			    			<div class="col-xs-12 col-sm-12 col-md-12">
			    				<div class="form-group">
			    					<label for="msg">Message: </label>
									<textarea name="msg" class="form-control" placeholder="Your Message to encrypt or decrypt" rows="3" cols="50" required></textarea>
			    				</div>
			    			</div>
			    		</div>

			    		<cfif isDefined('FORM.submit')>
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<!--- Set Key --->
									<cfif isDefined('FORM.newkey') AND FORM.newkey is not "">
										<cfset thekey="#FORM.newkey#">
									<cfelse>
										<!--- <cfset thekey= generateSecretKey('AES')> --->
										<!--- the default key --->
										<cfset thekey="JAwuzU7AJLskFkYVQ2XWFA==">
									</cfif>
									
									<!--- Encrypt / Decrypt depending on what mode was chosen --->
									<cfswitch expression="#FORM.enctype#">
										<cfcase value="encrypt">
											<cfset results = encrypt(form.msg, theKey, 'AES', 'Hex')>
											<!--- <cfset results = Hash( form.msg & thekey, "SHA-384" ) > ---->
											<label>Encrypted Message: </label>
										</cfcase>
										<cfcase value="decrypt">
											<cfset results = decrypt(form.msg, theKey, 'AES', 'Hex')>
											<label>Decrypted Message: </label>
										</cfcase>
									</cfswitch>
									<div class="form-group">
										<textarea class="form-control"><cfoutput>#results#</cfoutput></textarea>
									</div>
								</div>
							</div>
						</cfif>
						<input type="submit" name="submit" class="btn btn-success btn-block" value="Submit">
			    	</cfform>
			    </div>
	    	</div>
    	</div>
    </div>
	<video id="my-video" class="video" loop="loop" muted="yes" autoplay>
  		<source src="/video/timelapse.mp4" type="video/mp4" />
  	</video>
	</body>
</html>