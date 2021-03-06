Workout01
================
Richard Jin

``` r
library (dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
all <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)

all$try2 <- 1
all$try2[all$shot_type != "2PT Field Goal"] <- 0 
all$in2 <- 1
all$in2[all$shot_made_flag == "shot_no" | all$shot_type != "2PT Field Goal"] <- 0 
twopoints <- arrange(summarise(group_by(all, name),total= sum(try2),made = sum(in2), perc_made = made/total), desc(perc_made))

all$try3 <- 1
all$try3[all$shot_type != "3PT Field Goal"] <- 0 
all$in3 <- 1
all$in3[all$shot_made_flag == "shot_no" | all$shot_type != "3PT Field Goal"] <- 0 
threepoints <- arrange(summarise(group_by(all, name),total= sum(try3),made = sum(in3), perc_made = made/total), desc(perc_made))

threepoints
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <dbl> <dbl>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Draymond Green   232    74     0.319

``` r
all$total <- 1 
all$totalin <- all$in2 + all$in3
bothpoints <- arrange(summarise(group_by(all, name),total= sum(total),made = sum(totalin), perc_made = made/total), desc(perc_made))

bothpoints
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <dbl> <dbl>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

How the Golden State Warriors Broke the NBA: Applying Data Analytics to GSW's Phenomenal Success"
=================================================================================================

#### Introduction

Over the past several years, the Golden State Warriors has posed as one of the most formidable teams in the current NBA. With four All-Star players on the team, many argue that the Golden State Warriors has become a monopoly in the the NBA and is ruining the league for other teams and their fans. Although this is certainly a very cynical perception of the NBA, I completely agree with it. As a diehard Houston Rockets fan, I utterly despise the Golden State Warriors, and, within this report, I will use data analytics and visuals to explain why the Golden State Warriors should be antitrusted. Throughout this report, we will look at the following five players: Stphen Curry, Draymond Green, Klay Thompson,the shooting statistics of the Golden State Warriors' five starting players based on their 2-point shooting abilities, 3-point shooting abilities, and their overall shooting abilities. We will also use visual graphs of the Warriors' shooting positions to determine the shooting range of the Warriors. Through examining these two aspects, we will find that the Warriors is composed of five incredibly strong players who are extremely adept at playing basketball under today's circumstances.

#### Data 1

The first data we will look at is the shooting percentages for the all of the players on the team for two-point shots. Conventionally, two-point layups have dominated the NBA scene, as they are often perceived as the most reliable way of scoring. In the following table, we see a summary of the Golden State Warriors two-point shooting abilities.

``` r
twopoints #GSW Two-pointer Data 
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <dbl> <dbl>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

#### Analysis & Conclusions 1

As shown above, four of five Warriors have two-point shooting percentages that are above the 50% threshold. Draymond Green, the only player who does not have a two-point shooting percent of 50%, is still not far behind with an impressive 49.4%. These statistics show us that with regards to the most conventional scoring style, the Warriors are ahead of most teams. With simple math, we can find that the average two-point shooting percentage across the entire team is 55.8%, making it one of the top two two-point shooting teams in the NBA. Within the team, although Andre Iguodala has the highest shooting percentage, Kevin Durant is still a better shooter due to the fact that he took 643 shoots and was still able to maintain a shooting percentage of 60%. Iguodala's 63.8% is certainly impressive, but he only took 210 shot throughout the season, which sheds doubt on whether he will be as consistent if he took more shots. Kevin Durant's ridiculous two-point shooting statistics has helped the Warriors firmly establish themselves as the strongest team in the NBA. Kevin Durant only recently joined the Warriors after the 2015-2016 season and contributed strongly to the team's two-point game. Prior to Kevin Durant's appearance, the overall two-point percentage and attempts from the Warriors was not extremely impressive. The most accurate two-point shooter barely made attempts, and the rest of the team only hovered around the 50% mark. Kevin Durant increased the two-point shooting percentage and attempts of the Warrriors, filling in a former weakness of the team. The two-point statistics from the Golden State Warriors not only reflects its prominence in conventional scoring methods, but also the team's ability to attract elite basketball players like Kevin Durant to further strengthen the team.

#### Data 2

After examining the two-point the statistics of the Warriors, we will now examine the three-point shooting statistics of the Warriors, which are absolutely ridiculous. In the following table, we see a summary of the Golden State Warriors three-point shooting abilities. These numbers can be perceived as the beginnings of the Warriors dominance, as the Warriors heavily rely on their sharp shooting to make simple and energy-consuming plays. And the most notable three-point shooter of them all is Stephen Curry.

``` r
threepoints #GSW Three-pointer Data 
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <dbl> <dbl>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Draymond Green   232    74     0.319

#### Analysis & Conclusions 1

As seen in the table above, Stephen Curry has shot a grand total of 687 three-pointers. The most interesting aspect of this statistics is not the sheer number of three-point shots that Stephen Curry has made, but rather the fact that Stephen Curry has attempted more three-point shots than two-point shots. This is an unbelieveable strategy because two-point lay ups have always been perceived as the safest and most secure method of earning points. Stephen Curry defies convention, as he chooses to take the much riskier alternative of attempting more three-pointers than two-pointers. While Stephen Curry's number of three-point attempts is certainly impressive, it's also important to look at his accuracy, which is even more impressive given the number of shots he attempts. His accuracy is 40.8%, which is higher than many NBA players' two-point percentages. While Stephen Curry has become the face of the Warrior, another formidable three-point shooter is Klay Thompson, who has a three-point accuracy of 42.4% with a total of 580 attempts. Stephen Curry and Klay Thompson are often known as the "splash bros" because they are the two sharpest shooters in the Warriors and perhaps in the entire NBA. The three-point statistics of these two players suffice to show their capabilities. However, statistics aside, there's an even more amazing aspect to the Splahs Bro's game, and that's their three-point shooting positions.

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" /> \`\`\`

As seen in the above table, Stephen Curries three point shots form a comparatively thicker layer compared to other players with a lot of his three-point shots coming from places that are far from where the three-point line is. No other player on the Warriors has as great a range as Stephen Curry when it comes to shooting three-pointers. What's even more notable is that many of Stephen Curry's three-point attempts from afar make it in. While, the majority of them miss, there are enough made shots to justify Stephen Curry's far shooting. The ability to shoot with such great accuracy and with such great range is what enabled to the Warriors to be so dominant even without Kevin Durant. Imaging the facing the Warrior's defense. Your team has prepared tirelessly to defend against opponents when they try to charge in and make lay ups and two point jump shots. However, all that preparation becomes futile as Stephen Curry can just attempt a shot far from the baseline and still make it in. The above graph not only highlights Stephen Curry's shooting abilities, it also highlights that of his teammates. For Klay Thompson, the entire basketball floor is essentially covered up with dots. It's as if one man is doing an entire team's shooting. The wide-spread dots shown in Klay Thompson's diagram shows that the Warriors have a very well-rounded shooter who can score points when a two-point play is possible and when a three-point play is possible.

#### Data 3

Watching the Warriors play is like watching a well-oiled machine. You have Curry and Thompson who are in charge of making prolific three-point plays. You have Kevin Durant to fill in the former gap with two-point plays. You have Draymond Green and Andre Iguodala who are strong on defense and provide turnover potential. I would like to display the overall shooting statistics for two-points and three-points to show how each member is able to contribute their part to the team.

``` r
bothpoints #GSW Overall Points Data
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <dbl> <dbl>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

#### Analysis & Conclusions 3

The overall shooting percentage for the entire team falls in a range that is just a little bit over 10%. This shows that everyone on the team can make plays and everyone on the team can be offensive. With such balanced offensive statistics, it is also possible to deduce that the team's defensive statistics must be well-balanced too. The Golden State Warriors is so strong because each individual member of their team has the ability to carry their team forward to a title.

#### Conclusion

Based on the above analysis, we know that the Warriors is an incredible team that not only has a strong foundation with its ability to shoot three-pointers, but also the ability to attract strong players from other teams to fill in loopholes that are present in the current team to constantly improve the overall team. It has star shooters, but is also well-rounded overall. Throughout this analysis, I have dedicated most of the text toward analyzing Stephen Curry, Klay Thompson, and Kevin Durant. Some might wonder why Draymond Green and Andre Iguodala were not mentioned as much. The reason is this paper is more so concerned with offensive analysis rather than defensive analysis, and both Draymond Green and Andre Iguodala are strong defensive players. One might wonder, as a diehard Houston Rocket's team, why I am praising the Warriors so excessively. The simple reason is, their team is truly awe-inspiring.

#### References

<https://on.nba.com/2Vv1t2u> <https://bit.ly/2HcDJMD> <https://bit.ly/2BWTmoc> <https://bit.ly/2EnDkUD> <https://sportsknowhow.com/basketball/dimensions/nba-basketball-court-dimensions.html> <https://www.sportscourtdimensions.com/wp-content/uploads/2015/02/nba_court_> <https://github.com/ucb-stat133/stat133-hws>
