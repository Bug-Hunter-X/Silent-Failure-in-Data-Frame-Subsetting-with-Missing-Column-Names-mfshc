```r
# This corrected code uses dplyr to handle missing column names gracefully.
library(dplyr)

df <- data.frame(a = 1:3, b = 4:6, c = 7:9)
cols_to_select <- c("a", "b", "d")

# Use dplyr::select with any_of to handle missing columns
subset_df <- df %>% select(any_of(cols_to_select))

# This will print only columns 'a' and 'b', but will give a warning about the missing column
print(subset_df)

#Alternatively, you can check for the existence of all columns before subsetting
if(all(cols_to_select %in% names(df))){ 
  subset_df <- df[, cols_to_select] 
} else {
  warning("Some columns are missing")
}
print(subset_df)
```