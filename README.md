# Case Study: Bicyclist Ride Share

## Business Task:
	
  To compare the difference in riding habits between casual riders and riders with monthly reoccurring memberships. Bicyclistic’s intentions for this study is to try and convert casual riders to monthly members.

## Data Sources:
	
  I used 12 months of public data about bike sharing statistics in the Chicago area. This data was made available by Motivate International Inc. under this license.
  
 The main drawback of this dataset is that there is no personal information. Therefore, this analysis could not be about the specific trends of individual riders and their demographics, where they live, how many times they ride per week, etc. Far better analysis could be done with data centered around the riders rather than the rides themselves.

## Cleaning and Manipulation:
	
  This data came to me in 12 different CSV files, altogether it amounted to over five million data points. I did some basic cleaning and inspecting (TRIM, checking for inconsitencies, etc.) in each individual file using excel. I used the WEEKDAY function to extract the day of week from the date and used the IF function to switch numbers to actual words.
	
  From there I imported all 12 updated files to Microsoft SQL Server and created the following Query
  
  ## Analysis:
	
  #### Location:
	 
  There are quite a few differences between how members and casual riders use bikes. Firstly, the locations in which they travel are different. From the following map, we can see that casual riders tend to travel to the coastline the most, as that is where their data points are most dense. On the other hand, member’s travel locations are less dense in those areas but are more spread out in other areas of the city.
  
  ![Screenshot MAP](https://user-images.githubusercontent.com/99245093/152954776-9fe0023c-8275-491c-a910-77dec63d276a.png)
  
  By looking at the top 5 lists below, we see that the densest location for members only reaches about 25k visits in the year. While three of the top 5 locations for casual riders exceed that, and one of which, Grand & Streeter (Navy Pier), has 3x as many yearly visits from casual riders than the number one spot does for members.
	
![Screenshot Members Top 5](https://user-images.githubusercontent.com/99245093/152964566-b736c3df-c5f7-4428-8b7e-e14751ff0da7.png)
![Casual Riders Top 5](https://user-images.githubusercontent.com/99245093/152964582-6a95c79e-98fe-46a3-902b-83db02889563.png)

  Casual members tend to ride most commonly to tourist areas and leisure areas, Navy Pier, Millennium Park, Theater on the Lake, etc., while members ride most commonly to random spots in the city near office buildings.
	
  #### Time:
	
  Overall ridership increases significantly in the summer months and decreases in the winter. It is pretty cold in Chicago, so it makes sense. What is interesting though, is that casual riders ride less than members for the majority of the year, but in the summer peak, casual rider numbers exceed member’s numbers.
  
![Monthly Screenshot](https://user-images.githubusercontent.com/99245093/152966373-3fffb32f-248d-435e-b53f-040c0b57883f.png)
  
Per day rates/week rates aligns with this idea of commuting vs. leisure of the last section. As seen below, casual riders are far more likely to rent bikes on the weekends, while members have increased ridership in the middle of the week and decreased ridership on the weekends.

![Day of Week Screenshot](https://user-images.githubusercontent.com/99245093/152967882-dad15b7e-fddd-47cf-8c39-09442e068657.png)

Lastly, we see from the hourly numbers that around 5:00pm is the peak for both casual riders and members, which make sense as 5:00pm is the most common time to travel for leisure and for work. There is a second peak around 8:00am for members and casual riders are more likely to ride late at night.

![Time of Day Screenshot](https://user-images.githubusercontent.com/99245093/152967947-87789db1-3bae-49bd-b851-3fdab4670ee7.png)

#### Ride Lengths and Bike Types:
	
  From the below visualization, we can see that there are more total rides from the members than the casual riders. For both parties, individuals prefer classic bikes over both electric and docked.
  
  ![Membership Plan and Ride Type](https://user-images.githubusercontent.com/99245093/152970029-e5e2a360-f232-4141-b2e7-05b232094b2b.png)
  
  As we can see here, though members tend to ride more often, casual riders ride significantly longer on average. 
  
  ![Ride Length with Docked Bikes](https://user-images.githubusercontent.com/99245093/152970117-d56e59fe-c580-4378-96a3-0e146ab93b02.png)
  
  Something to note, however, is that docked bikes are ridden far longer than any other bike and it is only ridden by daily riders, no members.  I am not entirely sure whythis occurs. My guess is that docked bikes are not offered to members.
  
  ![Ride Length by Type Screenshot](https://user-images.githubusercontent.com/99245093/152970097-20b7324f-59e2-491c-9493-279b618384f3.png)
  
  So, when taking the docked bikes out of the equation to compare apples to apples, we see that the ride length averages are about 7 points closer together. Still a significant difference.
  
  ![Ride Length without Docked Bikes](https://user-images.githubusercontent.com/99245093/152970142-042f750a-bd74-4613-a360-ca12c05b7447.png)

## Recommendations:
1.	Firstly, we know that casual riders are most likely to travel to coastal locations, mostly known for leisure activities. For example, Navy Pier, Millennium Park, Theater on the Lake, etc. Therefore, a targeted campaign to convert casual riders should do two things: 
     - It should include these locations in the material of the advertisement itself, to attract people who know the location and enjoy being there. 
     - Physical advertisements about the membership specifically should be shown at or near those locations, to target casual riders who tend to frequent those locations.

2.	Secondly, I would propose Bicyclist offer a one-month free trial in April and May (the months with the largest increase in riders) to casual riders who have used Bicyclist’s services multiple times. 
    - If Cyclistic were to offer this trial to casual riders at the beginning of summer, they will be most likely to see the benefits of the service through the summer and decide to stay members through to the rest of the year. 
    - By offering it only to existing Bicyclist customers, you reduce the risk of one-time users, like tourists, using the free month of membership and never returning to Chicago.


3.	Lastly, we see that casual riders are most likely to take longer rides mostly for leisure. I would propose the Bicyclist app create a rewards program for miles travelled. If casual riders already enjoy taking long rides, a reward program that rewards them for longer (and more frequent) rides, could help them take the first step in becoming a member.
    - Perhaps rewards could earn them less off for future Bicyclist purchases, or maybe Bicyclist can partner with local Chicago stores and company for discounts off of local merchandise or food?
    - Rewards can also be used in tandem with fitness apps, and a partnership could be formed with a company like Fit Bit or My Fitness Pal.

