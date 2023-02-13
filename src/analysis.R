# Load library 
library("ProjectTemplate")
# Load Project
load.project()

# EDA of Enrolments data #

# Print first couple of rows
head(cyber.security.1_enrolments) #raw data
head(enroll_1) #after preprocessing

# Education Level with Employment status
stbar_emp_st_edu <- ggplot(enroll_1, aes(x=employment_status)) +
  geom_bar(aes(fill=highest_education_level), position=position_dodge()) +
  scale_x_discrete(name="Employment Status", labels=emp_status_list) +
  scale_fill_discrete(name="Highest Education Level", labels=edu_level_list) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
stbar_emp_st_edu

# Distribution of Employment area
## Count for each Employment area
table(enroll_1$employment_area)
## Bar Plot for Top 10 Employment area by count order
bar_area <- enroll_1 %>%
  mutate(employment_area = fct_lump_n(fct_infreq(employment_area), n = 10), # Only keep the 5 most frequent categories and lump the rest into "Other"
         highlight = fct_other(employment_area, keep = "Other", other_level = "Top 10")) %>% # Create a factor variable with two levels to use as fill/highlight
  ggplot(aes(x = employment_area, fill = employment_area)) + 
  geom_bar() +
  scale_x_discrete(name="Employment Area", labels=emp_area_list) +
  theme(legend.position = "none", axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
bar_area

# Distribution of Country
## Count for each country
table(enroll_1$country)
## Bar Plot for Top 10 country by count order
bar_country <- enroll_1 %>%
  mutate(country = fct_lump_n(fct_infreq(country), n = 10), # Only keep the 5 most frequent categories and lump the rest into "Other"
         highlight = fct_other(country, keep = "Other", other_level = "Top 10")) %>% # Create a factor variable with two levels to use as fill/highlight
  ggplot(aes(x = country, fill = country)) + 
  geom_bar() +
  theme(legend.position = "none")
bar_country

# Ratio of Enroll/Unenroll users
bar_ratio_unenroll <- ggplot(enroll_1, aes(x=unenroll, fill=unenroll)) + 
  geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = -0.3)
bar_ratio_unenroll

# Background of Unenrolled Learners
## Pie chart for Employment Status
pie_un_emp_status <- ggplot(Unenroll, aes(x="", y = employment_status, fill = employment_status)) + 
  geom_bar(stat = "identity") +
  geom_col() +
  labs(x='', y='Employment Status') +
  scale_fill_discrete(name="Employment Status", labels=emp_status_list) +
  coord_polar("y",start=0) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank())
pie_un_emp_status

## Count for each Employment area
table(Unenroll$employment_area)
## Bar Plot for Top 10 Employment area by count order
bar_un_area <- Unenroll %>%
  mutate(employment_area = fct_lump_n(fct_infreq(employment_area), n = 10), # Only keep the 5 most frequent categories and lump the rest into "Other"
         highlight = fct_other(employment_area, keep = "Other", other_level = "Top 10")) %>% # Create a factor variable with two levels to use as fill/highlight
  ggplot(aes(x = employment_area, fill = employment_area)) + 
  geom_bar() +
  scale_x_discrete(name="Employment Area", label=un_emp_area_list) +
  theme(legend.position = "none", axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
bar_un_area

## Count for each country
table(Unenroll$country)
## Bar Plot for Top10 country by count order
bar_un_country <- Unenroll %>%
  mutate(country = fct_lump_n(fct_infreq(country), n = 10), # Only keep the 5 most frequent categories and lump the rest into "Other"
         highlight = fct_other(country, keep = "Other", other_level = "Top 10")) %>% # Create a factor variable with two levels to use as fill/highlight
  ggplot(aes(x = country, fill = country)) + 
  geom_bar() +
  theme(legend.position = "none")
bar_un_country


# EDA of Activity data #

# Print first couple of rows
head(cyber.security.1_step.activity) #raw data
head(activity_1) #after preprocessing

# Count of each column
table(activity_1$step)
table(activity_1$week_number)
table(activity_1$step_number)

# Ratio of Complete/Noncomplete users
bar_ratio_complete <- ggplot(activity_1, aes(x=complete, fill=complete)) + 
  geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = -0.3)
bar_ratio_complete

# Explore Complete Time Taken
## Histogram of Time Taken
hist_time_all <- ggplot(data = activity_1, aes(x = complete_time_taken)) +
  geom_histogram(alpha = 0.5, position = "identity", fill="orange") +
  labs(x='Time (minutes)') +
  xlim(0, 50)
hist_time_all
## Min and Max value
min(activity_1$complete_time_taken, na.rm = TRUE)
max(activity_1$complete_time_taken, na.rm = TRUE)

# Average time taken by the Step (Box Plot) - Top 10 longest and shortest 
box_long <- ggplot(longest_top_10, aes(x=step,y=complete_time_taken, fill=step)) + 
  geom_boxplot() +
  labs(title="Top 10 Longest Completion Time",y="Time (minutes)") +
  scale_fill_brewer(palette="Set3" ) +
  ylim(0,8)
box_short <- ggplot(shortest_top_10, aes(x=step,y=complete_time_taken, fill=step)) + 
  geom_boxplot() +
  labs(title="Top 10 Shortest Completion Time", y="Time (minutes)") +
  scale_fill_brewer(palette="Paired") +
  ylim(0,8)

ggarrange(box_long, box_short,
          ncol = 2, nrow = 1, legend = "none")

























