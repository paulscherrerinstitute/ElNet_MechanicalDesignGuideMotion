%% This is file "psi_easy.cls"
%% Slightly extends standard LaTeX document class "article.cls" 
%%
%% Suitable for formatting documents to be used
%% with EASY, the document management system of PSI
%% 
%% Written by Ruediger Scheibl, 2019-11-18
%% Best effort, no support provided
%% Use at your own risk.
%%
%% Supersedes "tm.cls" [2000/02/01 v1.0]
%% written by Colin.Higgs@psi.ch, also based on "article.cls" 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Information / Instructions for use
%% ==================================
%%
%% Creates centered page headers and footers
%% Header 1st line: classification re confidentiality 
%% Header 2nd line: title as defined by \PsiEasyTitle{...}
%% Footer: Page Numbering
%%
%% Title pages are created automatically by EASY
%% and must not be included in the TeX output.
%% Please start page numbering with page 2 in yourfile.tex
%%
%% Use \PsiEasyTitle{Document Title} in yourfile.tex
%% to set the document title in the page header
%%
%% \PsiEasyCustomFoot{Text} provides an additional entry in the footer,
%% after the page number. Default is the current date (20YY-MM-DD).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{psi_easy}[2019/11/18 v0.1]
\LoadClass{article}
% \LoadClass{scrartcl}

%\usepackage[num,german]{isodate}
%\isodate\numdate

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\psiclassification{NICHT {\"O}FFENTLICH}

%
\DeclareOption{english}
   {\def\myside{Page}
    \def\psiclassification{NOT FOR PUBLIC USE}}
%
\DeclareOption{german}
   {\def\myside{Seite}
    \def\psiclassification{NICHT {\"O}FFENTLICH}}

%% \ExecuteOptions{...} tells which are the default.
\ExecuteOptions{german,tmheadings,a4paper,11pt,oneside,onecolumn,final}

%% \Declareoption*{} handles every option not explicitly defined.
%% \PassOptionsToClass{}{} all unknown options will be passed to article.cls 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%%\ProcessOptions\relax terminates the option processing.
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% protect against potential paper size problems with pdf
\usepackage[a4paper]{geometry}
\special{papersize=210mm,297mm}

%% Custom margins

\hoffset -5.4mm
\voffset -5.4mm
\marginparwidth 0mm \marginparsep 0mm
\oddsidemargin 0mm  \evensidemargin 0mm
\textheight 244mm   \textwidth 168mm
\topmargin -12mm
\headheight 12mm    \headsep 25pt
\columnsep 15pt     \columnseprule 0pt
\footskip 10mm



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\PsiEasyTitle#1{\def\@PsiEasyTitle{#1}}   \def\@PsiEasyTitle{Document Titel as defined by PsiEasyTitle}
\def\PsiEasyCustomFoot#1{\def\@PsiEasyCustomFoot{#1}}   \def\@PsiEasyCustomFoot{\quad(\the\year-\the\month-\the\day)}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modify the odd and even running page headings.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\mark{{}{}}

\def\ps@tmheadings{

\def\eleven{\fontsize{11}{14pt}\selectfont}

   \def\@oddhead{\hfil\begin{minipage}[b][0.5cm][b]{\textwidth}\begin{center}
      \fontsize{8}{14pt}\selectfont \psiclassification \\[3pt]
      \fontsize{11}{14pt}\selectfont \@PsiEasyTitle \\
      \noindent\rule{\textwidth}{0.5pt}
      \end{center}\end{minipage}\hfil}

   \def\@oddfoot{\hfil\begin{minipage}[t][0.5cm][t]{\textwidth}\begin{center}
      \noindent\rule{\textwidth}{0.5pt} \\[5pt]
      {\eleven\myside~\thepage\@PsiEasyCustomFoot}
      \end{center}\end{minipage}\hfil}

   \if@twoside
      \let\@mkboth\markboth
      \def\@evenhead{\@oddhead}	 
      \def\@evenfoot{\@oddfoot}
   \else
      \let\@mkboth\markboth
      \def\@evenhead{}
      \def\@evenfoot{}
   \fi
}

\pagestyle{tmheadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput
%%
%% End of file "psi_easy.cls".
