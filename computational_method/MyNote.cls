% MyNote.cls - A XeLaTeX Class for Math and Physics Notes v0.0.1

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MyNote}[2024/06/23 v3.1 A XeLaTeX Note Class - Final fix for fancyhdr]

% --- 基类和编码 ---
\LoadClass[a4paper, oneside]{ctexbook}
\setCJKmainfont[Mapping = fullwidth-stop,BoldFont=STHeitiSC-Medium, ItalicFont=STKaitiSC-Regular]{STSongti-SC-Regular}

% --- 常用宏包 ---
\RequirePackage{xparse}
\RequirePackage{physics}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{siunitx}
\RequirePackage[dvipsnames, svgnames]{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows, positioning}
\RequirePackage[most]{tcolorbox}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage[colorlinks=true, 
                linkcolor=blue, 
                anchorcolor=blue, 
                citecolor=blue,
                urlcolor=blue]{hyperref}
\RequirePackage{dsfont}
\RequirePackage{mathrsfs}

% --- 自定义颜色定义 ---
\definecolor{myblue}{RGB}{235, 245, 255}
\definecolor{myblueframe}{RGB}{100, 150, 255}
\definecolor{myyellow}{RGB}{249, 236, 195}
\definecolor{myyellowframe}{RGB}{252, 195, 7}
\definecolor{mygreen}{RGB}{235, 255, 240}
\definecolor{mygreenframe}{RGB}{80, 180, 120}
\definecolor{mypurple}{RGB}{245, 240, 255}
\definecolor{mypurpleframe}{RGB}{160, 120, 220}
\definecolor{light-gray}{RGB}{245, 245, 245}
\definecolor{mid-gray}{RGB}{180, 180, 180}

% --- 页面样式和页眉设置 ---
\geometry{
  a4paper,
  left=2.5cm,
  right=2.5cm,
  top=2.5cm,
  bottom=2.5cm
}

\setlength{\headheight}{13pt}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\nouppercase{\leftmark}}
\fancyhead[R]{\nouppercase{\rightmark}}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}



% --- 定理类环境定义 ---

\newcounter{theorem}[section]
\renewcommand{\thetheorem}{\thesection.\arabic{theorem}}

\newtcbtheorem[
    use counter=theorem
]{theorem}{定理}
{
    enhanced,
    breakable,
    colback=myblue,
    colframe=myblueframe,
    fonttitle=\bfseries\large,
    boxrule=1pt,
    arc=3mm,
    auto outer arc,
    toptitle=1mm,
    bottomtitle=1mm,
    before upper={\par\vspace{1mm}}
}
{th}

\newcounter{defcounter}[section]
\renewcommand{\thedefcounter}{\thesection.\arabic{defcounter}}
\newtcbtheorem[
    use counter=defcounter
]{definition}{定义}
{
    enhanced,
    breakable,
    colback=myyellow,
    colframe=myyellowframe,
    fonttitle=\bfseries\large,
    boxrule=1pt,
    arc=3mm,
    auto outer arc,
    toptitle=1mm,
    bottomtitle=1mm,
    before upper={\par\vspace{1mm}}
}
{def}



\theoremstyle{definition}
\newtheorem{example}{例}[chapter]
\renewcommand{\theexample}{\thechapter.\arabic{example}}
\newtheorem{exercise}{练习}[chapter]
\renewcommand{\theexercise}{\thechapter.\arabic{exercise}}

\theoremstyle{plain}
\newtheorem*{solution}{解}
\renewcommand{\proofname}{证明}


\newtcolorbox{problembox}{
    enhanced,
    breakable,
    colback=light-gray,
    colframe=mid-gray,
    boxrule=0.8pt,
    arc=3mm,
    auto outer arc,
    left=5mm,
    right=5mm,
    top=3mm,
    bottom=3mm,
    before skip=\medskipamount,
    after skip=\medskipamount
}


\def\maketitle{%
  \begin{titlepage}
    \centering
    \vspace*{\stretch{0.5}}
    {\Huge\bfseries \@title\par}
    \vspace{1.5cm}
    {\Large \@author\par}
    \vspace{0.5cm}
    {\large \@date\par}
    \vspace*{\stretch{1.5}}
  \end{titlepage}%
  \cleardoublepage%
}

\ClassInfo{MyNote}{Class for typesetting math and physics notes loaded.}
\endinput
%%
%% End of file `MyNote.cls'.