<!DOCTYPE html>
<html>
	<head>
		<style>
			.container {
				margin-top: 15%;
			}
		</style>
		<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/css/custom.css">
		<script src="/js/jquery-1.12.0.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<title>Supacrypter</title>
	</head>
	<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form method="post" enctype="multipart/form-data" >
					<div class="form-group">
						<label for="enctype">Encryption Type: </label><br>
						<label class="radio-inline">
    					<input type="radio" name="enctype" value="encrypt" checked>Encrypt</label>
		
  						<label class="radio-inline">
    					<input type="radio" name="enctype" value="decrypt" >Decrypt</label>
					</div>
					<div class="form-group">
						<label for="newkey">Custom Encryption string (optional): </label>
						<input type="text" name="newkey" class="form-control" placeholder="Your AES key">
					</div>
					<div class="form-group">
						<label for="msg">Message: </label>
						<textarea name="msg" class="form-control" required></textarea>
					</div>
					<input type="submit" name="submit" class="btn btn-primary" value="Submit">
				</form>
			</div>
		</div>
		<br>
		<div class="row">
		<cfif isDefined('FORM.submit')>
			<cfif isDefined('FORM.newkey') AND FORM.newkey is not "">
				<cfset thekey="#FORM.newkey#">
			<cfelse>
				<cfset thekey="your_key_here">
			</cfif>
			<cfset results = "">
			<cfswitch expression="#FORM.enctype#">
				<cfcase value="encrypt">
					<cfset results = encrypt(form.msg, theKey, 'AES', 'Hex')>
					<!--- <cfset results = Hash( form.msg & thekey, "SHA-384" ) > --->
					<label>Encrypted Message: </label>
				</cfcase>
				<cfcase value="decrypt">
					<cfset results = decrypt(form.msg, theKey, 'AES', 'Hex')>
					<label>Decrypted Message: </label>
				</cfcase>
			</cfswitch>
			<textarea class="form-control"><cfoutput>#results#</cfoutput></textarea>
		</cfif>
		</div>
	</div>
	</body>
</html>