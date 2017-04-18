<cfset password = "your_password">
<cfset serial   = "rfidserialnum">
<cfoutput>#encrypt(password,serial,'CFMX_COMPAT','Hex')#</cfoutput>