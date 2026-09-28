% Intro Options
\ProvidesClass{resume-openfont}[2021/05/30 Abdullah's version]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%--------------------------------------------------------------
% Package Imports
\RequirePackage[english]{babel}
% page setup 
\RequirePackage{fancyhdr}
% Set boundaries
\RequirePackage[hmargin=1cm, vmargin=0.94cm]{geometry}
% remove ugly boxes around links
\usepackage[hidelinks]{hyperref}
% setup custom titles
\RequirePackage{titlesec}
% For skills table
\RequirePackage{enumitem}
% Set up font 
\RequirePackage{fontspec}
\RequirePackage{font-color}
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary]{Arial}
\setsansfont{Arial}
% make underlying constants: credits to Alex Beattie for noticing and suggesting fix
\RequirePackage{ulem}
%--------------------------------------------------------------
% Reformatting default sections
% section
\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\section}{%
\color{headings}% Using comments to allow us to split the command across multiple line
\scshape%
\fontsize{16pt}{24pt}%first number is size, second number is space between lines
\selectfont%
\raggedright%
\uppercase%
} {}{0em}{}

% remove header footer stuff like page numbers 
\newcommand{\resetHeaderAndFooter}{%
\fancyhf{}%
\fancyfoot{}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
}
%--------------------------------------------------------------
% Formatting commands - commands to control spacing

% Command to simulate new line, to fix spacing glitches
\newcommand{\fakeNewLine}{\newline \vspace{-\baselineskip}}

%--------------------------------------------------------------
% Subheadings command - create different types of heading
\newcommand{\runsubsection}[1]{%
\color{subheadings}%
\fontsize{12pt}{12pt}%
\selectfont%
\bfseries%
#1%
\normalfont}%

% Descriptors command
\newcommand{\descript}[1]{%
\color{subheadings}%
\raggedright%
\scshape%
\fontsize{11pt}{13pt}%
\selectfont{#1}%
\normalfont}

% Location command
\newcommand{\location}[1]{%
\color{headings}%
\raggedright%
\fontsize{11pt}{13pt}%
\selectfont{#1}%
\normalfont}

% Command for table 
\newcommand{\singleItem}[2]{\normalsize{\textbf{#1} #2}}
\newcommand{\doubleItem}[4]{\singleItem{#1}{#2}{\vspace{2pt}} & \singleItem{#3}{#4}}

%--------------------------------------------------------------
% Section separators command
\newcommand{\sectionsep}[0]{\vspace{7pt}}

%--------------------------------------------------------------
% Bullet Lists with fewer gaps command
\newenvironment{bullets}{
\vspace{-1mm}
\begin{itemize}
\itemsep1pt 
\parskip1.5pt 
\parsep1.5pt
}{
\end{itemize}
\vspace{-\topsep}
}

% Command for skill table
\newenvironment{skillList}{%
\noindent%
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}%
}{%
\end{tabular*}%
}

%--------------------------------------------------------------
% Customize built-in commands
% Align Sections
\let\oldSection\section
\renewcommand{\section}[1]{\oldSection{#1}\raggedright}
\renewcommand{\underline}[1]{\uline{#1}}