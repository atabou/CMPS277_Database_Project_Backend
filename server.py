
from flask import Flask, Blueprint
from flask_restplus import Resource, Api

# Start the server
app = Flask(__name__)

# Define the api documentation
blueprint = Blueprint('api', __name__, url_prefix='/api')
api = Api(blueprint, doc='/documentation', title="CMPS 277 Project API", description="The api documentation for the CMPS 277 Project")

# Register the api blue print
app.register_blueprint(blueprint)

@api.route('/home')
class Home(Resource):

    def get( self ):
        """
        This the get method of /home
        """
        return 200

    def post( self ):
        """The post method for /

        Post method
        """
        return 200


@api.route('/hello')
class Home(Resource):

    def get( self ):
        """
        This the get method of /hello
        """
        return 200

if  __name__ == "__main__":
    app.run(debug=True)