# WorldCupDataBase

Project Description: World Cup Database PSQL for Educational Purposes

To use the worldcup.sql dump you can use psql -U postgres < worldcup.sql
Or use the ready script, the script will insert all data from `games.csv` in the database, but the database and the tables has to be created for this.
I sugest use the dump, than drop the rows.

The World Cup Database project is designed to provide an educational platform for learning and practicing database management concepts using PostgreSQL. The project focuses on the World Cup tournament data, including information about games, teams, and various statistics related to goals scored.

The project consists of two main components: data import and database queries. The data import component uses a Bash script to read data from a CSV file (`games.csv`) and insert it into the PostgreSQL database. The script ensures that the teams participating in the games are properly inserted into the "teams" table, and the game details are inserted into the "games" table.

The second component involves executing several predefined SQL queries on the World Cup database. These queries retrieve useful information and statistics related to the tournament. Some of the queries include:

1. Total number of goals in all games from winning teams.
2. Total number of goals in all games from both teams combined.
3. Average number of goals in all games from the winning teams.
4. Average number of goals in all games from the winning teams rounded to two decimal places.
5. Average number of goals in all games from both teams.
6. Most goals scored in a single game by one team.
7. Number of games where the winning team scored more than two goals.
8. Winner of the 2018 tournament team name.
9. List of teams who played in the 2014 "Eighth-Final" round.
10. List of unique winning team names in the whole data set.
11. Year and team name of all the champions.
12. List of teams that start with 'Co'.

The World Cup Database project serves as an educational resource for learning SQL queries, data manipulation, and analysis in the context of a real-world dataset. It provides hands-on experience with importing data, creating database tables, and executing queries to retrieve valuable insights from the World Cup tournament data.

Note: The provided code includes the database schema, sample data, and sample queries. The project can be further enhanced by adding additional queries, implementing data validation, and expanding the functionality based on specific educational requirements.
