library(ggplot2)
library(dplyr)
library(grid)
library(jpeg)

all <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)

klay_scatterplot <- ggplot(data = thompson) + geom_point(aes(x=x,y=y,color =  shot_made_flag))

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

pdf("../images/andre-iguodala-shot-chart.pdf",width =6.5, height=5)
iguodala_shot_chart
dev.off()

pdf("../images/draymond-green-shot-chart.pdf",width =6.5, height=5)
green_shot_chart
dev.off()

pdf("../images/kevin-durant-shot-chart.pdf",width =6.5, height=5)
durant_shot_chart
dev.off()

pdf("../images/klay-thompson-shot-chart.pdf",width =6.5, height=5)
thompson_shot_chart
dev.off()

pdf("../images/stephen-curry-shot-chart.pdf",width =6.5, height=5)
curry_shot_chart
dev.off()

gsw_shot_chart <- ggplot(data = all) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Golden State Warriors (2016 season)') +
  theme_minimal()+facet_wrap(~name)

pdf("../images/gsw-shot-charts.pdf",width =8, height=7)
gsw_shot_chart
dev.off()

png(filename = "../images/gsw-shot-charts.png",width = 8,height = 7,units = "in",res = 1500)
gsw_shot_chart
dev.off()






