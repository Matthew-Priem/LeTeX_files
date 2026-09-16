
% This is the msuapp class that gives a format of the APP according to the Minnesota State University regulations.  To use it, type "\documentclass{msuapp}" on the first line of your main .tex file.

% You need to supply file format.tex, where you define the packages you want to use, etc.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msuappclass}

%  This defines different fontsizes you could use -- MSU gives a certain amount of choice, but requests (strongly urges, that is!) 12pt font with double-spacing.  You will type whichever you choose in "\documentclass{msuapp}[12pt]".  Or, for example, "\documentclass{msuapp}[10pt]".
\newcommand\@msuappclsptsize{12pt}
\DeclareOption{12pt}{\renewcommand\@msuappclsptsize{12pt}}
\DeclareOption{11pt}{\renewcommand\@msuappclsptsize{11pt}}
\DeclareOption{10pt}{\renewcommand\@msuappclsptsize{10pt}}
\ProcessOptions
\LoadClass[\@msuappclsptsize,letterpaper,oneside]{book}

%  Here the page setup based on the Minnesota State University regulation of 1.5" left margin, all others 1".
%  And I quote...
%		"Margins at the left of the page must be one and one-half inches. Margins at the right, top and bottom of the page must be one inch. The only exception to this policy is for the first page of each new chapter."

%   "If permitted by the style manual, the page numbers should be one inch from the top and one inch from the right side of the paper, with typing of the body of the paper beginning on a double space below the page number. If a discrepancy regarding margins exists between a specific manual of style and these guidelines, the student should follow the margins and page numbers placement specified above.
% Set left margin - The default is 1 inch, so the following command sets a 1.50-inch left margin.
\setlength{\oddsidemargin}{0.50in} 

% Next, we set the width of the text - state how wide the text should be, and then whatever is left will be the right margin. In this case, right margin is 8.5in - 1.5in - 6in = 1.in.
\setlength{\textwidth}{6.in} 

% Set top margin - The default is 1 inch, which is what we need.  The space between the header (page number) and top of page needs to be exactly 1".
\setlength{\topmargin}{0.in} 

% Set height of the header -- make sure this is large enough for the text, or TeX will squawk when you "build" the file.
\setlength{\headheight}{0.21in}
% Set vertical distance between the header and the text
\setlength{\headsep}{0.2in} 

% Similarly to the width of the text, we state how high the text should be, and then whatever is left will be the bottom margin.  In this case, the bottom marging should be 1".  We don't need to worry about the footer, since we're (well, I'm) not using any footers.  Here we have 11.in - 1.in (top margin) - 0.5in (header) - 8.5in (length of text) = 1.in
\setlength{\textheight}{8.5in} 
 
% Sets the distance from the bottom of the last line of text in the body to the bottom of the footer 
  %  \setlength{\footskip}{0.3in}
\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{\centerline{Table of Contents}
 \@mkboth{TABLE OF CONTENTS}{TABLE OF CONTENTS}}
% \contentsline{chapter}{\underline{Section}}{\underline{Page}}
 \@starttoc{toc}\if@restonecol\twocolumn\fi}

\def\listoffigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{\centerline{Table of Figures}\@mkboth
 {LIST OF FIGURES}{LIST OF FIGURES}}
% \contentsline{figure}{\ignorespaces\underline{Number}
% \hspace*{\@flakespace}\underline{Page}}{}
 \addvspace{10pt}\@starttoc{lof}\if@restonecol \twocolumn\fi}
 
%  Redefinition thebibliograph in book.cls
\renewenvironment{thebibliography}[1]
     {\chapter*{\centerline{\bibname}
        \@mkboth{\bibname}{\bibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}      
 %  The chapter heading is created here.  The command \vspace always means vertical space.  Here I've adjusted the top margin so that it will be 1 inch for the first page of the chapter, instead of 2 inches.  To change this back to normal, type \vspace{0in} or just delete the command altogether.
 
 \def\@makechapterhead#1{             % Heading for \chapter command
		\vspace*{0.in}                       % Space at top of text page.
  { \parindent 0pt \raggedright 
    \ifnum \c@secnumdepth >\m@ne     % IF secnumdepth > -1 THEN
      \large\bf \centerline{\@chapapp{} \thechapter} % Print 'Chapter' and number.
      \par 
      \vskip 20pt \fi                  % Space between number and title.
    \large \bf                        % Title.
   \centerline{#1}\par 
    \nobreak                         % TeX penalty to prevent page break.
    \vskip 40pt                      % Space between title and text.
  } }
