%% mcitexpose.cls
%% 
%% Author: Daniel Mur-Spiegl <news@spiegl.me>
%% ------------------------------------------

%
%% Package Information
%% ------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mcitexpose}[2019/01/20]
\usepackage{graphicx}
\graphicspath{ {./img/} }

%
%% Handling class options
%% ------------------------------------------

\DeclareOption{titlepage}{\PassOptionsToPackage{\CurrentOption}{mcit}}
\DeclareOption{english}{\PassOptionsToPackage{\CurrentOption}{mcit}}
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{mcit}}
\DeclareOption{master}{\PassOptionsToPackage{\CurrentOption}{mcit}}
\DeclareOption{bachelor}{\PassOptionsToPackage{\CurrentOption}{mcit}}
\DeclareOption*{
    \ClassWarning{mcitexpose}{Unknown document option '\CurrentOption'.}
}
\ProcessOptions


%
%% Paper options and style file -----------------------------------------------

\LoadClass[a4paper,12pt]{article}

\RequirePackage{mcit}       % mcit.sty with options registered above


%
%% Commands
%% ------------------------------------------

\newcommand{\keywords}[1]{
    \newcommand{\thekeywords}{#1}
}

\newcommand{\method}[1]{
    \newcommand{\themethod}{#1}
}

\newcommand{\company}[1]{
    \newcommand{\thecompany}{#1}
}

\newcommand{\advisor}[1]{
    \newcommand{\theadvisor}{#1}
}

\newcommand{\authoremail}[1]{
    \newcommand{\theauthoremail}{#1}
}

\renewcommand{\maketitlepage}{
    \pagenumbering{Roman}
    \begin{titlepage}
        \newgeometry{top=3.5cm,bottom=2.5cm}
                
        {\Large\bfseries\lsstyle Master's Thesis: \thetitle \par}
          
        \vspace{0.5cm}
        
        \small    
       Master’s Program “Management, Communication \& IT” at MCI – Management Center Innsbruck \ifdefined\thedate (\thedate)\else (\today)\fi.

        \vspace{0.5cm}

        {\bfseries Keywords:} \thekeywords\par
        
        \vspace{0.5cm}
        
        {\bfseries Empirical Method:} \themethod \par
    
        \vspace{0.5cm} 

        \ifdefined\thecompany {\bfseries Commissioning Company:}
            \thecompany \par
        \else\fi

        \vfill     
        
        {\scshape ACADEMIC ADVISOR:}\newline
        \theadvisor

        \vspace{0.5cm}

        {\scshape AUTHOR}\newline
        \theauthor\newline
        Master Program Management, Communication \& IT\newline
        MCI - Management Center Innsbruck\newline
        Bridging University \& Business\newline
        Universitätsstraße 15\newline
        6020 Innsbruck, Austria\newline
        EMail: \theauthoremail

        \restoregeometry
        \normalsize
    \end{titlepage}   

    %% Table of Contents
    \tableofcontents
    \newpage

    %% Main Document
    \pagenumbering{arabic}
    \setcounter{page}{1} 
}

\let\oldbibliography\bibliography

\renewcommand{\bibliography}[1]{
    \begingroup
    \renewcommand{\section}[2]{}
    \oldbibliography{#1}
    \endgroup
}

\endinput
