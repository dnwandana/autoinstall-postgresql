# autoinstall-postgresql
This is an automatic script to install PostgreSQL 12 and PgAdmin 4 for Linux Ubuntu.

This script is already tested and working in Linux Ubuntu 18.04 LTS.

## Installation
1. Download or clone this repo
   ```bash
   git clone https://github.com/dnwandana/autoinstall-postgresql.git
   cd autoinstall-postgresql
   ```
2. Make the file `install.sh` is executable
    ```bash
    sudo chmod +x install.sh
    ```
3. Execute `install.sh`, this will take a minutes to finish
   ```bash
   ./install.sh
   ```

### Installation Note
- You'll be prompted twice, when creating a PostgreSQL user and when creating account for the initial pgAdmin user account.
- When creating PostgreSQL user, a prompt will be shown to you, asking you to input your desired username, password, and if you want the user to be a superuser.
  ```bash
  Enter name of role to add: dana
  Enter password for new role:
  Enter it again:
  Shall the new role be a superuser? (y/n) y
  ```
- When creating PgAdmin user, a prompt will be shown to you, asking you to input your desired email address, password, and some confirmation about new `Apache Web Server` configuration.
  ```bash
  Setting up pgAdmin 4 in web mode on a Debian platform...
  Creating configuration database...
  NOTE: Configuring authentication for SERVER mode.

  Enter the email address and password to use for the initial pgAdmin user account:

  Email address: dana@example.com
  Password: 
  Retype password: 
  pgAdmin 4 - Application Initialisation
  ======================================

  Creating storage and log directories...
  We can now configure the Apache Web server for you. This involves enabling the wsgi module and configuring the pgAdmin 4 application to mount at /pgadmin4. Do you wish to continue (y/n)? y
  The Apache web server is running and must be restarted for the pgAdmin 4 installation to complete. Continue (y/n)? y
  Apache successfully restarted. You can now start using pgAdmin 4 in web mode at http://127.0.0.1/pgadmin4/
  ```
- When the installaton complete, you'll see information like this in your terminal.
  ```bash
   DONE  Installation Complete!

    Service running at:
    - PostgreSQL: 127.0.0.1:5432
    - PgAdmin4:   http://127.0.0.1/pgadmin4/
  ```

## Reference
- [PostgreSQL: Linux downloads (Ubuntu)](https://www.postgresql.org/download/linux/ubuntu/ "PostgreSQL: Linux downloads (Ubuntu)")
- [PostgreSQL Documentation: createuser](https://www.postgresql.org/docs/12/app-createuser.html "PostgreSQL Documentation: createuser")
- [PgAdmin 4 (APT)](https://www.pgadmin.org/download/pgadmin-4-apt/ "PgAdmin 4 (APT)")