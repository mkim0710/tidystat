# f_df.ggplot.dev.r


dataset %>% 
    dplyr::filter(!is.Case) %>% 
    cor |> as.table() |> as.data.frame() %>% dplyr::filter(!is.na(Freq)) %>% 
    ggplot(aes(Var2, Var1, fill = Freq))+
    geom_tile()+
    scale_fill_gradientn(colors = c(rgb(0, 0, 0), rgb(1, 0, 0), rgb(1, 1, 0), rgb(1, 1, 1)), na.value = rgb(1, 1, 1),
                         space = "Lab", trans = "log1p", limit = c(-1/4, 1/2),
                         name="value") +
    theme_minimal()+ 
    theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                     size = 8, hjust = 1))+
    coord_fixed() +
    geom_text(aes(Var2, Var1, label = sprintf("%4.3f", Freq)), color = "black", size = 2) +
    theme(
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks = element_blank(),
        legend.title = element_blank(),
        legend.justification = c(0.5, 0),
        legend.position = c(0.5, 1),
        legend.direction = "horizontal")
ggsave("dataset dplyr::filter(!is.Case) cor() ggplot().png", width=7, height = 7)
ggsave("dataset dplyr::filter(!is.Case) cor() ggplot().pdf", width=7, height = 7)


  
  
# __________|------  
# 〚〛 END----  
