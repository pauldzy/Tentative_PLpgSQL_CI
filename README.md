# Tentative_PLpgSQL_CI

Integrating Continuous Integration practices into database application development can be difficult for a variety of reasons.  More traditional software development is largely about code and making sure that logic components works well together.  Adding in database schema management and the data itself can greatly complicate things as portions or all of the "data" side of things may be maintained by other parties in more of a traditional static database-is-what-database-is manner.  In this situation it can be clunky to try and implement a true CI "create the database from scratch" for each build.  In additional the size of the data in question needs to be taken into account.  Processing 10s of gigs of geospatial data for each build can mean individual builds that last an entire night or even days.  

This "tentative" PLpgSQL repository is meant to document one stab at a logic-only approach to PLpgSQL via CI.  Basically I simply pass on the idea of data and schema management.  Feel free to look down on me for that, I deserve it.  In my case I have a very complex ecosystem of data whereby data and schema are developed much further upstream from PostgreSQL and run through a series of heterogenous ETL conversions.  

![PLpgSQL_Data_Flow](readme1.png)

So again my approach is to simply implement CI on the logic side as a good start.  So from the point of view of my CI system, the data-only PostgreSQL pg_dump file is the input.  The data and schema flow down to me and I simply consume it into my CI system.  Hopefully communication is in place to notify me of schema or data changes that affect my logic that come down the above pipeline.

####Database Setup Job


![PLpgSQL_Data_Flow](readme2.png)

