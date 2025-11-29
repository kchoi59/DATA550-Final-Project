here::i_am("code/final_make_figures.R")


# Load libraries
library(ggplot2)
library(data.table)
library(dplyr)
library(patchwork) 

# load data
dat <- fread(here::here("data/breast-cancer.data"))
# add column names
colnames(dat) <- c("class", "age", "menopause", "tumor_size",
                   "inv_nodes", "node_caps", "deg_malig", "breast",
                   "breast_quad", "irradiat")


# Visualization
make_plot <- function(var) {
  ggplot(dat, aes_string(x = var, fill = "class")) +
    geom_bar(position = "fill") +
    labs(
      title = paste("Recurrence by", var),
      x = var, y = "Proportion"
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "none"
    )
}
vars <- c("age", "menopause", "tumor_size", "inv_nodes", "node_caps",
          "deg_malig", "breast", "breast_quad", "irradiat")
plots <- lapply(vars, make_plot)
grid_plots <- wrap_plots(plots, nrow = 3, ncol = 3)
legend_plot <- ggplot(dat, aes(x = factor(deg_malig), fill = class)) +
  geom_bar(position = "fill") +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    legend.key.size = unit(0.4, "cm"),
    legend.text = element_text(size = 8),
    legend.title = element_text(size = 9)
  ) +
  labs(fill = "Recurrence Status")
legend <- cowplot::get_legend(legend_plot)
combined_figure <- cowplot::plot_grid(
  grid_plots,
  legend,
  ncol = 1,
  rel_heights = c(1, 0.05)  # grid taller, legend shorter
)



saveRDS(
  combined_figure,
  file=here::here("figures/combined_figure.rds")
)