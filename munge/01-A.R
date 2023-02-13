# Preprocessing of Enrolments data #

# Get the first year of enrollments data
enroll_1 = cyber.security.1_enrolments
# Remove missing values
enroll_1 <- unknownToNA(enroll_1, unknown="Unknown") #Convert Unknown to NA
enroll_1 <- enroll_1 %>% drop_na() #Remove column with NA values
enroll_1 <- unknownToNA(enroll_1, unknown="") #Convert blank cell to NA

# Ratio of Enroll/Unenroll users
enroll_1 <- enroll_1 %>% 
  mutate(unenroll = if_else(is.na(enroll_1$unenrolled_at), "Enroll", "Unenroll"))

# Create a new dataframe only for Unenrolled learners
Unenroll <- subset(enroll_1, unenroll=="Unenroll", select=learner_id:unenroll)

# Background List
edu_level_list = c('Apprenticeship', 'Less than Secondary', 'Professional',
                   'Secondary', 'Tertiary', 'University Degree',
                   'University Doctorate', 'University Masters')
emp_status_list = c('Full-time student', 'Looking for work', 'Not working',
                    'Retired', 'Self-employed', 'Unemployed',
                    'Working full-time', 'Working part-time')
emp_area_list = c('IT & Information Services','Teaching & Education','Engineering & Manufacturing',
                  'Health & Social Care','Public Sector','Business Consulting & Management',
                  'Charities & Voluntary Work','Accountancy Banking & Finance','Law',
                  'Science & Pharmaceuticals','Other')
un_emp_area_list = c('IT & Information Services','Teaching & Education','Public Sector',
                     'Business Consulting & Management','Accountancy Banking & Finance',
                     'Engineering & Manufacturing','Health & Social Care','Creative Arts & Culture',
                     'Science & Pharmaceuticals','Charities & Voluntary Work','Retail & Sales', 'Other')
                    

# Preprocessing of Activity data #

# Get the data
activity_1 = cyber.security.1_step.activity #first year of activity
# Remove missing values
activity_1 <- unknownToNA(activity_1, unknown="") #Convert blank cell to NA

# Ratio of Complete/Noncomplete users
activity_1 <- activity_1 %>% 
  mutate(complete = if_else(is.na(activity_1$last_completed_at), "Not Complete", "Complete"))

# Calculate the time taken to complete the course
## Convert character type into date type
activity_1$last_completed_at <- ymd_hms(activity_1$last_completed_at) 
activity_1$first_visited_at <- ymd_hms(activity_1$first_visited_at)
## Differentiate the time
activity_1$complete_time_taken <- difftime(activity_1$last_completed_at, activity_1$first_visited_at, units="mins")
activity_1$complete_time_taken <- as.numeric(round(activity_1$complete_time_taken, 2)) #Round and convert into numeric

# Top 10 longest and shortest 
## Dataframe of users who complete the step only
completed_act <- activity_1 %>% drop_na()
## New dataframe: mean value by group (step)
mean_of_step <- completed_act %>%
  group_by(step) %>%
  summarise_at(vars(complete_time_taken), list(name = mean))
## Top 10 longest and shortest mean time of step
longest_top_10 = top_n(mean_of_step,n=10)$step
shortest_top_10 = top_n(mean_of_step,n=-10)$step
## Format into proper type
longest_top_10 <- activity_1[activity_1$step %in% top_n(mean_of_step,n=10)$step, ]
longest_top_10$step <- as.character(longest_top_10$step)

shortest_top_10 <- activity_1[activity_1$step %in% top_n(mean_of_step,n=-10)$step, ]
shortest_top_10$step <- as.character(shortest_top_10$step)


