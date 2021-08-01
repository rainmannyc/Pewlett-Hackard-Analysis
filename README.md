# **PEWLETT HACKARD ANALYSIS**

## **OVERVIEW**

The purpose of the analysis challenge was to analyze Pewlett Hackard wave of retiring employees per title and to identify which employees are eligible for the mentorship program. We were able to use our database software and SQL query language to filter the parameters required to analyze the data.

### **Results**

After reviewing our filtered data, we found 4 major points:

* 72,458 employees who are currently employed would be ready for retirement in the near future.

* This also indicates 72,458 positions which will require new employees as the "silver tsunami" begins to make its impact on Pewlett Hackard

* There are 1,549 employees eligible for the mentorship program

* This also indicates that there are not nearly enough employees eligible for the mentorship program compared to the number of retirees. 

### **Summary**

![retiring_titles](https://github.com/rainmannyc/Pewlett-Hackard-Analysis/blob/b42359204009a438fe31363f9d5b401516dda887/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/retiring_titles_count.png)

![retiring_totals](https://github.com/rainmannyc/Pewlett-Hackard-Analysis/blob/b42359204009a438fe31363f9d5b401516dda887/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/retiring_titles_total.png)

As we can see in the image above as well, there are significant number of "Senior Engineers" ready for retirement more than any other positions. I have also added a breakdown of queries at the end of the "Employment_Database_challenge.sql" file which can total the number of engineers by specific title. By doing this, we are able to see how many engineers would be required specifically for each level of engineering. We may also rewrite the code to apply to the other staff positions as well. 

Pewlett Hackard can now see where they would need to start hiring the most as well as which positions need to be filled in the near future. 

### **Mentorship Eligibility**

From our data, we can see that 72,458 positions are required across all levels for Pewlett Hackard to prepare for the upcoming wave of the "silver tsunami". To prepare, one of the elements Pewlett Hackard would like us to check is how many employees are eligible for their mentorship program.  

Unfortunately, there aren't nearly enough employees to one on one mentor the number of positions required as the wave of current retiring employees begins to retire. As shown from the data in the chart below, the number eligible mentors is only at 1,549 at the moment. 
We can find this by adding the code below to our query:

![mentorship_eligibility](https://github.com/rainmannyc/Pewlett-Hackard-Analysis/blob/b42359204009a438fe31363f9d5b401516dda887/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/mentorship_count.png)

As we can see, there aren't nearly enough employees compared to the number of employees ready to be retirees. However, it may be possible to mentor or train new employees in groups. In any case, Pewlett Hackard will have to do a substantial amount of hiring and training up ahead. 