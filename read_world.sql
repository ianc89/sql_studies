# Set up import
.mode csv
.import worldcities.csv world
.schema
# Run commands
# Get the total pop per country 
select sum(population), country from world group by country;
# Make a new table
create table world2 as select city, population from world;
# would use INTO in sql normally

# Join the two tables and make some inspection
select world2.city, world.country from world2 join world on world2.city = world.city;
select sum(world2.population), world.country from world2 join world on world2.city = world.city group by world.country;
# Count number of cities
select country,count(*) from world group by country;
# Select city with pop above average
# Note that we needed to treat population as INT for the comparison which
# was not done by default, hence results were weird
select city, population from world where CAST(population as INT) > (select avg(population) from world);