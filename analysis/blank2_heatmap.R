### Imports ##################################################################
library("BoutrosLab.plotting.general");

### Global Variables #########################################################
labels <- seq(0,9);
colour_bounds <- c("white", "lightgreen");
tracks <- c("CTCF, H3K27ac", "CTCF, H3K27me3", "CTCF, H3K4me1", "CTCF, H3K4me3",
            "H3K27ac, H3K27me3", "H3K27ac, H3K4me1", "H3K27ac, H3K4me3",
            "H3K27me3, H3K4me1", "H3K27me3, H3K4me3",
            "H3K4me1, H3K4me3"
);
single_tracks <- c("CTCF", "H3K27ac", "H3K27me3", "H3K4me1", "H3K4me3");

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
length_data <- matrix(, nrow = length(tracks), ncol = length(labels));
coverage_data <- matrix(, nrow = length(tracks), ncol = length(labels));
fraction_data <- matrix(, nrow = length(tracks), ncol = length(labels));
colnames(length_data) <- labels;
rownames(length_data) <- tracks;
colnames(coverage_data) <- labels;
rownames(coverage_data) <- tracks;
colnames(fraction_data) <- labels;
rownames(fraction_data) <- tracks;

# extract length and coverage information from summary_coverage.tsv
for (r in 1:length(tracks)) {
    for (c in 1:length(labels)) {
        length_data[r, c] = data[length(labels)*(r-1)+c, "Length"];
        coverage_data[r, c] = data[length(labels)*(r-1)+c, "Coverage"];
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

# create heatmap for each individual pair of blank tracks
plot_heatmap(t(fraction_data), "blank2_heatmap.png", covar); # transposed for visual layout


# average fractions for whenever a particular track is missing
fraction_track_data <- matrix(, nrow = 5, ncol = length(labels));
rownames(fraction_track_data) <- single_tracks;
colnames(fraction_track_data) <- labels;
fraction_track_data[1,] <- colMeans(rbind(fraction_data[1:4,]));
fraction_track_data[2,] <- colMeans(rbind(fraction_data[c(1,5,6,7),]));
fraction_track_data[3,] <- colMeans(rbind(fraction_data[c(2,5,8,9),]));
fraction_track_data[4,] <- colMeans(rbind(fraction_data[c(3,6,8,10),]));
fraction_track_data[5,] <- colMeans(rbind(fraction_data[c(4,7,9,10),]));

# create covariate
covar_track_rgb_mtx <- colfunc(apply(fraction_track_data, 1, mean));
covar_track <- list(
    rect = list(
        col = "black",
        fill = rgb(covar_track_rgb_mtx, maxColorValue=255),
        lwd = 1.5
    )
);

# create heatmap for track-specific fractions
plot_heatmap(t(fraction_track_data), "blank2_heatmap_tracks.png", covar_track);
