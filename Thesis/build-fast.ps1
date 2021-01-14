[String]$rootdir = Get-Location
Set-Location src
pdflatex.exe -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="$rootdir/src" --shell-escape -draftmode main.tex
bibtex.exe -include-directory="$rootdir/src" main
pdflatex.exe -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="$rootdir/src" --shell-escape -draftmode main.tex
pdflatex.exe -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="$rootdir/src" --shell-escape main.tex