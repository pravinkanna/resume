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
% Set boundaries
\RequirePackage[margin=1cm]{geometry}
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
% lighter font for paragraph text
\newfontfamily\bodyfont[Color=body]{Arial}
% one body size everywhere below the header: 11pt on 13pt leading
\renewcommand{\normalsize}{\@setfontsize\normalsize{11}{13}}
\AtBeginDocument{\normalsize}
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

%--------------------------------------------------------------
% Formatting commands - commands to control spacing

% Command to simulate new line, to fix spacing glitches
\newcommand{\fakeNewLine}{\newline \vspace{-\baselineskip}}

%--------------------------------------------------------------
% Subheadings command - create different types of heading
\newcommand{\runsubsection}[1]{{%
\color{subheadings}%
\fontsize{12pt}{12pt}%
\selectfont%
\bfseries%
#1}}%

% Descriptors command
\newcommand{\descript}[1]{{%
\color{subheadings}%
\scshape%
\fontsize{11pt}{13pt}%
\selectfont#1}}

% Location command
\newcommand{\location}[1]{{%
\color{headings}%
\fontsize{11pt}{13pt}%
\selectfont#1}}

% Hidden text command - zero width and white, readable by ATS parsers but not seen on the page
\newcommand{\hiddenText}[1]{\makebox[0pt][r]{\addfontfeatures{Color=FFFFFF}#1}}

% Skill line: bold label followed by the list of skills
\newcommand{\skillItem}[2]{\item \textbf{#1} {\bodyfont #2}}

%--------------------------------------------------------------
% Section separators command
\newcommand{\sectionsep}[0]{\vspace{6pt}}

%--------------------------------------------------------------
% Bullet Lists with fewer gaps command
\newenvironment{bullets}{
\vspace{-1mm}
\bodyfont
\begin{itemize}[topsep=8pt, partopsep=0pt, itemsep=1pt, parsep=1.5pt]
}{
\end{itemize}
\vspace{-8pt}
}

% Skills list: one category per line, spaced like the bullet items
\newenvironment{skillList}{%
\begin{itemize}[label={}, leftmargin=0pt, labelwidth=0pt, labelsep=0pt, topsep=0pt, partopsep=0pt, itemsep=1pt, parsep=1.5pt]%
}{%
\end{itemize}%
}

%--------------------------------------------------------------
% Customize built-in commands
% Align Sections
\let\oldSection\section
\renewcommand{\section}[1]{\oldSection{#1}\raggedright}
\renewcommand{\underline}[1]{\uline{#1}}