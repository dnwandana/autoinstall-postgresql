# Install PostgreSQL
# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt-get update -y

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get install postgresql-12 -y

# Create PostgreSQL user:
clear
sudo su postgres -c "createuser --interactive --pwprompt"

# Start database server:
pg_ctlcluster 12 main start

# Install pgAdmin
# Install the public key for the repository (if not done previously):
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install for web mode only: 
sudo apt install pgadmin4-web -y

# Configure the webserver for pgadmin4-web:
clear
sudo /usr/pgadmin4/bin/setup-web.sh

# Replace the default configuration:
sudo cp postgresql.conf /etc/postgresql/12/main
sudo cp pg_hba.conf /etc/postgresql/12/main

# Allow incoming TCP packets on port 5432 (PostgreSQL default port):
sudo ufw allow 5432/tcp

# Restart PostgreSQL:
sudo systemctl restart postgresql

# Get Public IP Address:
IP=$(curl icanhazip.com)
URL="http://$IP/pgadmin4/"

# Done.
clear
echo -e "\e[102m \e[30mDONE \e[49m\e[92m Installation Complete!"
echo -e "\n  \e[39mService running at:"
echo -e "  - PostgreSQL: \e[36m$IP\e[97m:\e[36m5432"
echo -e "  \e[39m- PgAdmin4:   \e[36m$URL\n"
