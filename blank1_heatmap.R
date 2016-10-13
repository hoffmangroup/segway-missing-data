### Imports ##################################################################
library("BoutrosLab.plotting.general");

### Global Variables #########################################################
labels <- seq(0,9);
colour_bounds <- c("white", "lightgreen");
tracks <- c("CTCF", "H3K27ac", "H3K27me3", "H3K4me1", "H3K4me3");

### Functions ################################################################
# Colfunc
# Description:
#   Generate colour along the spectrum
colfunc <- colorRamp(colour_bounds);

# plot_heatmap
# Description:
#   Use BoutrosLab.plotting.general create.heatmap tailored to this data
plot_heatmap <- function(x, filename, covariates){
    create.heatmap(
        x = x,
        filename = filename,
        xlab.label = "Segway Label",
        xaxis.lab = NA,
        xaxis.cex = 0.75,
        xaxis.fontface = 1,
        ylab.label = "Removed Track",
        yaxis.lab = NA,
        yaxis.cex = 0.75,
        yaxis.fontface = 1,
        legend.side = "right",
        legend.cex = 0.5,
        resolution = 500,
        colourkey.cex = 1,
        colourkey.labels.at = c(0, 0.2, 0.4, 0.6, 0.8, 1),
        colour.scheme = colour_bounds,
        covariates = covariates
    )
}


### Main #####################################################################
# read coverage summary
data <- read.table(
    "summary_coverage.tsv",
    sep="\t",
    header=TRUE
);

# initialize data structures
length_data = matrix(, nrow = 5, ncol = 10);
coverage_data = matrix(, nrow = 5, ncol = 10);
fraction_data = matrix(, nrow = 5, ncol = 10);
colnames(length_data) <- labels;
rownames(length_data) <- tracks;
colnames(coverage_data) <- labels;
rownames(coverage_data) <- tracks;
colnames(fraction_data) <- labels;
rownames(fraction_data) <- tracks;

# extract length and coverage information from summary_coverage.tsv
for (r in 1:5) {
    for (c in 1:10) {
        length_data[r, c] = data[10*(r-1)+c, "Length"];
        coverage_data[r, c] = data[10*(r-1)+c, "Coverage"];
        fraction_data[r, c] = coverage_data[r, c]/length_data[r,c];
    }
}

# create nx3 matrix full of RGB values for the covariate
covar_rgb_mtx <- colfunc(apply(fraction_data, 1, mean));

# create covariate
covar <- list(
    rect = list(
        col = "black",
        fill = rgb(covar_rgb_mtx, maxColorValue=255),
        lwd = 1.5
    )
);

# create heatmap
plot_heatmap(t(fraction_data), "heatmap.png", covar); # transposed for visual layout
