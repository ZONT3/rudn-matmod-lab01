pdf: %.md
	-pandoc .\report.md -F pandoc-crossref --pdf-engine=xelatex --pdf-engine-opt=--shell-escape --citeproc --number-sections -o .\report.pdf

docx: report.md
	-pandoc .\report.md -F pandoc-crossref --number-sections --citeproc -o .\report.docx
