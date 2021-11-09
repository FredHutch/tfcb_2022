# Lecture 12: Working with tabular data using `R` and `tidyverse`

[Rasi Subramaniam](http://rasilab.org/)

Nov 9, 2021

To interactively work with the code below, open [lecture12.ipynb](./lecture12.ipynb) in VSCode. Make sure to select the `kernel` for `R` so that you can execute `R` code. You should have already set this up following the software installation instructions [here](../../software/README.md).

`R` is the second programming language after `Python` that we will learn in this course. We will use `R` over the next 5 lectures.

`R` is particularly well suited for reading, manipulating, and visualizing data in tabular and biological sequence formats. 
Many statistical tests are also available out of the box in `R`.

While "base" `R` is used widely, I almost exclusively use `R` for its two excellent package collections:

1. [Tidyverse](https://www.tidyverse.org/) - suited for tabular data
2. [Bioconductor](https://www.bioconductor.org/) - suited for biology-aware analyses

Today we will learn a few basic functions from `tidyverse` for working with tabular data.

Unlike `pandas` which is a single package with lot of functionality, `tidyverse` is a collection of packages that are focused on specific tasks.

1. [ggplot2](https://ggplot2.tidyverse.org/) - for plotting data
2. [dplyr](https://dplyr.tidyverse.org/) - for filtering, aggregating, and transforming data
3. [readr](https://readr.tidyverse.org/) - for reading and writing data
4. [tidyr](https://tidyr.tidyverse.org/) - for cleaning and transforming data
5. [stringr](https://stringr.tidyverse.org/) - for manipulating strings
6. [purrr](https://purrr.tidyverse.org/) - for manipulating lists of R objects
7. [forcats](https://forcats.tidyverse.org/) - for manipulating categorical data

You can load all the above packages in one go:

```R
library(tidyverse)
```

## Reading data

Various options for reading and writing data are in package [`readr`](https://readr.tidyverse.org/).

```R
data <- read_tsv("data/example_dataset_1.tsv")

data
```

The tabular data structure is called a `tibble` in `tidyverse`, and is a souped-up version of the [data.frame](https://en.wikipedia.org/wiki/Data_frame) R data structure with additional nice features.

The ` <- ` assignment operator is equivalent to the ` = ` assignment operator and can be used interchangeably. However, using the ` <- ` operator is more conventional.

## Plotting data

```R
ggplot(data, aes(x = kozak_region, y = mean_ratio)) +
  geom_point()

```

**Anatomy of a `ggplot2` plot**

 - Begins with `ggplot` function with a `tibble` argument as the first argument.
 - `aes` specifies the variables to plot.
 - `geom` specifies the type of plot.
 - `+` adds additional `layers` to the plot.


**Key differences with `Python`**
  - No need to specify variables within quotes.
  - Indentation convention is different.

## Change size of plot globally

```R
options(repr.plot.width = 5, repr.plot.height = 3)
```

## How do we show multiple experimental variables?


Plotting a point graph with color

```R
ggplot(data, aes(x = kozak_region,
                 y = mean_ratio,
                 color = insert_sequence)) +
  geom_point()
```

Plotting a line graph

```R
ggplot(data, aes(x = kozak_region,
                 y = mean_ratio,
                 color = insert_sequence,
                 group = insert_sequence)) +
  geom_line()
```

Plotting point and line graphs

```R
ggplot(data, aes(x = kozak_region,
                 y = mean_ratio,
                 color = insert_sequence,
                 group = insert_sequence)) +
  geom_line() +
  geom_point()
```

## ‘Faceting’ – Plotting in multiple panels

```R
options(repr.plot.width = 6, repr.plot.height = 3)

ggplot(data, aes(x = kozak_region,
                 y = mean_ratio,
                 group = insert_sequence)) +
  geom_line() +
  geom_point() +
  facet_grid(~ insert_sequence)
```

# In-class `ggplot2` exercises

(20 min)

## 1. Make X, Y, legend labels into nice strings

See https://ggplot2.tidyverse.org/reference/labs.html

```R
ggplot(data, aes(x = kozak_region,
                 y = mean_ratio,
                 color = insert_sequence,
                 group = insert_sequence)) +
  geom_line() +
  geom_point()
```

## 2. Add title to the above plot

## 3. Change the plot look to a `classic` theme

See https://ggplot2.tidyverse.org/reference/ggtheme.html

## 4. Change Y axis to log scale

See https://ggplot2.tidyverse.org/reference/scale_continuous.html

## 5. Change Y scale to go linearly from 0 to 5

# Transforming data

Uses functions from the [`dplyr`](https://dplyr.tidyverse.org/) package.

```R
data <- read_tsv("data/example_dataset_1.tsv")


data
```

## Select specific columns

```R
select(data, strain, mean_ratio, insert_sequence, kozak_region)
```

## Combine operations using the ` %>% ` operator

```R
data <- read_tsv("data/example_dataset_1.tsv") %>% 
  select(strain, mean_ratio, insert_sequence, kozak_region)
```

Above is the same as the following:

```R
data <- read_tsv("data/example_dataset_1.tsv") %>% 
  select(., strain, mean_ratio, insert_sequence, kozak_region)
```

The `%>%` operator lets you `chain` different data analysis tasks together and makes the analysis logic easier to understand.

Side note: You can create keyboard shortcuts for ` <- ` and ` %>% ` in VSCode as explained [here](https://code.visualstudio.com/docs/getstarted/keybindings). 

I use `Alt + -` for ` <- ` and `Alt + Shift + m` for ` %>% ` following `RStudio` convention.

You can get a view of the transformed data using `print()` as the last step in a chain of commands

```R
data <- read_tsv("data/example_dataset_1.tsv") %>% 
  select(strain, mean_ratio, insert_sequence, kozak_region) %>% 
  print()
```

## Filter rows

```R
data <- read_tsv("data/example_dataset_1.tsv")
```

```R
data %>% 
  filter(kozak_region == "A")
```

```R
data %>%
  filter(kozak_region == "A", insert_sequence == "10×AGA")
```

```R
data %>%
  filter(kozak_region == "A") %>% 
  filter(insert_sequence == "10×AGA")
```

## Arrange (sort) rows in a specific order

```R
data %>%
  arrange(mean_ratio)
```

## Create new columns using `mutate`

```R
data <- read_tsv("data/example_dataset_2.tsv") %>% 
  print()
```

```R
data <- data %>%
  mutate(mean_ratio = mean_yfp / mean_rfp) %>%
  print()
```

Use mutate to modify existing columns

```R
data %>%
  mutate(mean_ratio = round(mean_ratio, 2))
```

## Combine tables using `join` functions

Variants: `inner_join`, `left_join`, `right_join`, `full_join`

See [https://dplyr.tidyverse.org/reference/mutate-joins.html](https://dplyr.tidyverse.org/reference/mutate-joins.html)

```R
annotations <- read_tsv("data/example_dataset_3.tsv")

annotations
```

```R
data %>% 
  inner_join(annotations, by = "strain")
```

```R
data %>% 
  left_join(annotations, by = "strain")
```

```R
data %>% 
  right_join(annotations, by = "strain")
```

## You can combine `dplyr` and `ggplot2` functions

But remember to use ` %>% ` in `dplyr` vs ` +` in `ggplot2`!

```R
data %>% 
  mutate(mean_ratio = mean_yfp / mean_rfp) %>%
  left_join(annotations, by = "strain") %>%
  ggplot(aes(x = kozak_region, y = mean_ratio, 
             color = insert_sequence, group = insert_sequence)) +
  geom_line() +
  geom_point()
```

## Use `stringr` functions to manipulate string columns

All functions are named nicely and begin with `str_`. I find them easier to use than the equivalent `Python` regular expression functions.

See [https://stringr.tidyverse.org/reference/index.html](https://stringr.tidyverse.org/reference/index.html)

```R
data %>% 
  mutate(mean_ratio = mean_yfp / mean_rfp) %>%
  left_join(annotations, by = "strain") %>% 
  mutate(codon = str_extract(insert_sequence, "[A-Z]{3}$"))
```

# In-class data transformation exercises

(20 min)

## 1. Create log2-transformed YFP/RFP ratio as a new column

Google for `log2 R` to find the appropriate function

```R
data <- read_tsv("data/example_dataset_2.tsv")
```

## 2. Extract strain number from the `strain` column into a new column and sort numerically by strain number

Extract the strain number using a `stringr` function.

Google for `character to integer R` to find appropriate function to use in `mutate`.

Then sort.

```R
annotations <- read_tsv("data/example_dataset_3.tsv")

annotations
```

## 3. Plot with the X axis as `kozak_region` but sorted by strain number

This requires a bit more reading and discussion, but it is a good example of how to learn new `tidyverse` functions on your own!

Use [fct_reorder](https://forcats.tidyverse.org/reference/fct_reorder.html) function from the [`forcats`](https://forcats.tidyverse.org/reference/index.html) package to sort `kozak_region` by strain number you created above in a `mutate` step and then feed it into `ggplot`.

```R
data %>% 
  mutate(mean_ratio = mean_yfp / mean_rfp) %>%
  left_join(annotations, by = "strain") %>%
  ggplot(aes(x = kozak_region, y = mean_ratio, 
             color = insert_sequence, group = insert_sequence)) +
  geom_line() +
  geom_point()
```
