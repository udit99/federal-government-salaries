Source code for http://www.thegovernmentpaycheck.com/
### Local Environment setup
  #### Prereqs
     * MySQL
     * Memcached (It'll still work without Memcached but bug you with
       timeouts)
  #### Setup Steps
    * git clone git@github.com:udit99/federal-government-salaries.git
    * cd federal-government-salaries
    * bundle
    * rake db:create:all
    * rake db:migrate
    * rake spec
    * gunzip data/salaries.sql.gz
    * mysql -u root -p salaries_development < data/salaries.sql
    * rake median_salaries:derive
    * rake update:agency_median_salaries
    * foreman start -e local.env
    * Browse to http://localhost:3004
