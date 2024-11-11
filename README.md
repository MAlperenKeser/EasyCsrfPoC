# EasyCsrfPoC
Basic CSRF proof of concept generator

I made this script especially for gain time in PortSwigger labs Csrf poc generator is specific to BurpSuite pro with this script you get rid of the writing payload
Script take three parameters first parameter is url second parameter is form data name of the file to generate example usage dropped below

Usage: ./EasyCsrfPoC "http://example.com/submit" "mail=anon@mail.com&password=newpassword" "output.html"
