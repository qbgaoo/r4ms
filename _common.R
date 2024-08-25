set.seed(1000)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = F,
  # cache = TRUE,
  fig.retina = 2,
  fig.height = 4,
  fig.asp = 2/3,
  fig.show = "hold"
)

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  stringr.view_n = 6,
  # Temporarily deactivate cli output for quarto
  cli.num_colors = 0,
  cli.hyperlink = FALSE,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

ggplot2::theme_set(ggplot2::theme_gray(10))
showtext::showtext_auto()  # 支持坐标轴中文正常显示

# list_to_tibble()函数可将长度不同的列表列组成的数据框
# 转换为等长的数据框
list_to_tibble <- function (tbl) {
  max_len <- tbl |>                 # 计算tbl的最大行数
    sapply(pluck) |> 
    map(length) |> 
    unlist(use.names = F) |> 
    max()
  n_col <- tbl |>                   # 计算tbl的列数
    ncol()
  
  new_tbl <- matrix(
    nrow = max_len,
    ncol = n_col
  ) |> 
    as_tibble(.name_repair = "minimal") |> 
    set_names(nm = names(tbl))
  
  for(i in 1:n_col){
    element_len <- tbl |> 
      pluck(i) |> 
      unlist() |> 
      length() 
    len_diff = max_len - element_len
    
    # 用空字符填充行数较少的列
    if(len_diff > 0){
      new_tbl[,i] <- tbl |> 
        pluck(i) |> 
        unlist() |> 
        c(rep(NA, len_diff)) 
    } else{
      new_tbl[,i] <- tbl  |> 
        pluck(i) |> 
        unlist()
    }
  }
  return (new_tbl)
}



