
from flask import Flask, Blueprint, jsonify
from flask_restplus import Resource, Api

import mysql.connector

from dotenv import load_dotenv
load_dotenv(".env")

import os

# Start the server
app = Flask(__name__)

# Define the api documentation
blueprint = Blueprint('api', __name__, url_prefix='/api')
api = Api(blueprint, doc='/documentation', title="CMPS 277 Project API", description="The api documentation for the CMPS 277 Project")

# Register the api blue print
app.register_blueprint(blueprint)


# Setup DB connection
db = mysql.connector.connect(
    host=os.environ["MYSQL_SERVER"],
    user=os.environ["MYSQL_USER"],
    password=os.environ["MYSQL_PASS"],
    database=os.environ["MYSQL_DATABASE"]
)

query = db.cursor()

@api.route('/company')
class Home(Resource):

    def get( self ):
        """
        This the get method of /home
        """

        sql = "SELECT * FROM company"
        query.execute(sql)

        data = query.fetchall()

        return jsonify(data)

    def post( self ):
        """The post method for /

        Post method
        """
        return 200


@api.route('/hello')
class Other(Resource):

    def get( self ):
        """
        This the get method of /hello
        """
        return 200

if  __name__ == "__main__":

    app.run(debug=True)

    