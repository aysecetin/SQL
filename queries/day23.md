# *Day 23*



## Challenge

To build a castle the builder needs to have many tools. It is difficult to understand which tools he should use and in which order to use them. For that, we will extract the important information and help the builder create his castle. 

 

Now the builder has a strength table that indicates the number of points he has to handle the tools every hour. Each hour he can use each tool once, and he should use as many tools as he can every hour. A tool difficulty is the number of points the builder is using. 

 

The builder wants to decide in which hours to build the castle. The best hours are the ones with a bigger difference between the power and the used.  

Return the hour, and the difference between the power and the used columns - call this column space.

Remove all the rows with space equal to zero and remove all of the hours that contain 30 minutes (13:30, 14:30)

 

Return the hour, points and the points he used that hour - call this column used

