# Makefile for LaTeX using Latexmk
# Use the following to include dependencies in your .tex files:
# \newcommand\inputfile[1]{%
#     \InputIfFileExists{#1}{}{\typeout{No file #1.}}%
# }

MAIN = main.tex # MAIN LaTeX FILE HERE
TARGET_FT = pdf # TARGET FILE TYPE HERE (pdf, dvi, etc.)
BUILD_ARGS = -pdflua -verbose -file-line-error -Werror -interaction=nonstopmode -halt-on-error -synctex=1 -use-make

TARGET = $(patsubst %.tex,%.$(TARGET_FT),$(MAIN))
.PHONY: $(TARGET) all clean full_clean


all: full_clean $(TARGET) clean

# Custom build rules
%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@


clean:
	latexmk -c

full_clean:
	latexmk -C

$(TARGET): $(MAIN)
	latexmk $(BUILD_ARGS) $<
