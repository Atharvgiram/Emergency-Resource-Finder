# Emergency Resource Finder

Java Servlet + JSP + JDBC + MySQL + Bootstrap project.

## Requirements
- JDK 8+
- Apache Tomcat 9
- MySQL 8+
- Maven
- Eclipse / IntelliJ IDEA

## Setup
1. Create the database by running `database/emergency_finder.sql`.
2. Open `DBConnection.java`.
3. Change:
   - USER
   - PASSWORD
4. Build:
   `mvn clean package`
5. Deploy `target/EmergencyResourceFinder.war` to Tomcat 9.
6. Open:
   `http://localhost:8080/EmergencyResourceFinder/`

## Current modules
- User registration
- User login/logout
- Emergency category search
- Resource type filtering
- Area/city filtering
- Verified + available resource filtering
- Resource details
- Call link
- Google Maps directions

## Next modules to add
- Admin login/dashboard
- Add/edit/delete resources
- Resource verification
- User reports
- Search history
- Password hashing
- Location-based distance ranking
- Emergency mode
