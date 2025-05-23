% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jsonframe.R
\name{JSONFrame}
\alias{JSONFrame}
\title{A \code{JSONFrame} class.}
\description{
A \code{JSONFrame} class.

A \code{JSONFrame} class.
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-JSONFrame-new}{\code{JSONFrame$new()}}
\item \href{#method-JSONFrame-get_jsonframe}{\code{JSONFrame$get_jsonframe()}}
\item \href{#method-JSONFrame-get_jsonframe_name}{\code{JSONFrame$get_jsonframe_name()}}
\item \href{#method-JSONFrame-get_translation}{\code{JSONFrame$get_translation()}}
\item \href{#method-JSONFrame-filter}{\code{JSONFrame$filter()}}
\item \href{#method-JSONFrame-clone}{\code{JSONFrame$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-JSONFrame-new"></a>}}
\if{latex}{\out{\hypertarget{method-JSONFrame-new}{}}}
\subsection{Method \code{new()}}{
Register \code{JSON} data in the browser.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{JSONFrame$new(input, json_data, session = shiny::getDefaultReactiveDomain())}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{input}}{A \code{Shiny} input parameter.}

\item{\code{json_data}}{A character - should mirror JSON data structure.}

\item{\code{session}}{A \code{Shiny} session parameter.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-JSONFrame-get_jsonframe"></a>}}
\if{latex}{\out{\hypertarget{method-JSONFrame-get_jsonframe}{}}}
\subsection{Method \code{get_jsonframe()}}{
Retrieve \code{JSON} from the browser.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{JSONFrame$get_jsonframe(input, session = shiny::getDefaultReactiveDomain())}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{input}}{A \code{Shiny} input parameter.}

\item{\code{session}}{A \code{Shiny} session parameter.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-JSONFrame-get_jsonframe_name"></a>}}
\if{latex}{\out{\hypertarget{method-JSONFrame-get_jsonframe_name}{}}}
\subsection{Method \code{get_jsonframe_name()}}{
Print data name.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{JSONFrame$get_jsonframe_name(
  input,
  session = shiny::getDefaultReactiveDomain()
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{input}}{A \code{Shiny} input parameter.}

\item{\code{session}}{A \code{Shiny} session parameter.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-JSONFrame-get_translation"></a>}}
\if{latex}{\out{\hypertarget{method-JSONFrame-get_translation}{}}}
\subsection{Method \code{get_translation()}}{
Get \code{JS} translation of filtering expression.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{JSONFrame$get_translation(input, session = shiny::getDefaultReactiveDomain())}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{input}}{A \code{Shiny} input parameter.}

\item{\code{session}}{A \code{Shiny} session parameter.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-JSONFrame-filter"></a>}}
\if{latex}{\out{\hypertarget{method-JSONFrame-filter}{}}}
\subsection{Method \code{filter()}}{
Send \code{JSON} data to the browser.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{JSONFrame$filter(
  input,
  filter_expression,
  session = shiny::getDefaultReactiveDomain()
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{input}}{A \code{Shiny} input parameter.}

\item{\code{filter_expression}}{A character, filtering expression (e.g. "{var} >= 0").}

\item{\code{session}}{A \code{Shiny} session parameter.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-JSONFrame-clone"></a>}}
\if{latex}{\out{\hypertarget{method-JSONFrame-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{JSONFrame$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
