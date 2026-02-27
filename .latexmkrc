$pdf_mode = 1;          # pdfLaTeX
$pdflatex = 'pdflatex -synctex=1 -output-directory=build -interaction=nonstopmode -file-line-error -halt-on-error %O %S';
$biber = 'biber %O %S';
$bibtex_use = 2;        # usa biber
$aux_dir = 'build';
$out_dir = 'build';
$preview_continuous_mode = 0;