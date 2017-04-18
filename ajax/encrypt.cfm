<cfset mode = FORM.mode>
<cfset msg  = Trim(FORM.msg)>
<cfset nkey = isDefined('FORM.nkey') ? FORM.nkey : "" >


<!--- Set Key --->
<cfif len(nkey)>
    <cfset thekey = nkey>
<cfelse>
    <!--- the default key --->
    <cfset thekey="">
</cfif>

<cfset jsonData = StructNew()>

<!--- Encrypt / Decrypt depending on what mode was chosen --->
<cftry>
<cfswitch expression="#mode#">
    <cfcase value="encrypt">
        <cfset result = encrypt(msg, theKey, 'AES', 'Hex')>
    </cfcase>
    <cfcase value="decrypt">
        <cfset result = decrypt(msg, theKey, 'AES', 'Hex')>
    </cfcase>
</cfswitch>

<cfset jsonData.result = result>
<cfset jsonData.status = 1>

<cfcatch>
    <cfset jsonData.status = 0>
</cfcatch>
</cftry>

<cfset jsonData = serializeJSON(jsonData)>
<cfoutput>#jsonData#</cfoutput>