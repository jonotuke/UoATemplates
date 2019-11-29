#' Function to give question template
#'
#' @return question template
#' @export
#'
#' @examples
question_template <- function() {
  rstudioapi::insertText(
"
1. QUESTION

```{r, results='asis', echo=FALSE}
add_marks(1)
```

```{block, type = 'solutions', include= params$sol}
SOLUTIONS
```

```{block, type = 'marking', include = params$marking}
MARKING
```

```{r, results='asis', echo=FALSE}
add_Q_total()
```
"
)
}


