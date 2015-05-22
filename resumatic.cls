% resumatic.cls
% A LaTeX class for easy, professional résumés.
% 2015-May-18 --- Daniel Wysocki --- https://dwysocki.github.io

% --- Class structure: identification part
% ---
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resumatic}[2015/05/18 Resumatic 0.0.1]

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers



% --- Class structure: class options
\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}
\ProcessOptions \relax

\def\namesize{\huge}
\def\nameskip{\bigskip}
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section


\LoadClass{article}


% --- Class structure: external heading commands
% ---

% define \name command to set name
\def \name#1 {\def\@name{#1}}
% set \@name to be empty by default
\def \@name {}


% --- Class structure: internal heading commands
% ---

\def \@printname {
  \begingroup
    \hfil{\namesize\bf \@name}\hfil
    \nameskip\break
  \endgroup
}


\newcommand{\Section}[2]{%
  \sectionskip%
  \textbf{#1}%
  \hfill%
  #2%
  \sectionlineskip%
  \hrule}


\let\ori@document=\document
\renewcommand{\document}{%
  \ori@document  % Begin document
  \@printname % Print the name specified with \name
}
