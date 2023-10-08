BEGIN { FS = ": *" }
$1 == "Image Name" { image_name = $2 }
$1 == "Services" && $2 != "N/A" { print image_name, $2 }
