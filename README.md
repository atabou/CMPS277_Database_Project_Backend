# CMPS_277_Backend

## Setup

### Database:

Create a new MYSQL database using the file in database/project.sql

### Web-Server (Windows + Anaconda):

1. Create a new python environment: `conda create --name cmps_277_backend --python=3.9`
2. Activate the environment: `conda activate cmps_277_backend`
3. Install python dependencies: `pip install -r requirements.txt`

### Environment Variables:

1. Create a file called `.env` at the root folder of the project
2. Insert the following in the file you just created:

```
MYSQL_SERVER=127.0.0.1
MYSQL_USER=<MYSQL_USERNAME> (Replace)
MYSQL_PASS=<MYSQL_PASSWORD> (Replace) (Insert "" if you do not have a password)
MYSQL_DATABASE=<Database_Name> (Replace)
```

## Run

`python server.py`

## Documentation

After starting the server go to `http://127.0.0.1/api/documentation` to check the documentation of our api.

