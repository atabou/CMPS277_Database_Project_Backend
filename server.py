
from flask import Flask, Blueprint, jsonify, request
from flask_restplus import Resource, Api, reqparse, fields
from flask_cors import CORS

import mysql.connector


from dotenv import load_dotenv
load_dotenv(".env")

import os

# Setup DB connection
db = mysql.connector.connect(
    host=os.environ["MYSQL_SERVER"],
    user=os.environ["MYSQL_USER"],
    password=os.environ["MYSQL_PASS"],
    database=os.environ["MYSQL_DATABASE"]
)

query = db.cursor(dictionary=True)

# Start the server
app = Flask(__name__)

# Setup cors to be allowed from all endpoints
CORS(app)

# Define the api documentation
blueprint = Blueprint('api', __name__, url_prefix='/api')
api = Api(blueprint, doc='/documentation', title="CMPS 277 Project API", description="The api documentation for the CMPS 277 Project")

# Register the api blue print
app.register_blueprint(blueprint)

# Setup pagination
pagination = reqparse.RequestParser()
pagination.add_argument('page', type=int, required=False, default=0, help='Page number')
pagination.add_argument('per_page', type=int, required=False, default=10, choices=[10, 20, 30, 40, 50])

# Setup the company endpoint

company = api.namespace('company')

create_company = api.model( 'create_company', {
    'Name': fields.String(description='Name of the company.'),
    'Location': fields.String(description='Location of the company (generally the country).')
})

# Setup the vaccine endpoint

vaccine = api.namespace('vaccine')

create_vaccine = api.model( 'create_vaccine', {
    'Name': fields.String(description='Name of the vaccine.'),
    'Description': fields.String(description='Details about the vaccine.'),
    'StorageTemp': fields.String(description='Temperature to store the vaccine at.'),
    'ShelfLife': fields.String(description='Shelf life of the vaccine.'),
    'DosesRequired': fields.Integer(description='Number of doses needed for the vaccine.'),
    'TimeSeperation': fields.String(description='Time between the doses required.') 
})

# Setup the doctor endpoint

doctor = api.namespace('doctor')

create_doctor = api.model( 'create_doctor', {
    'FirstName': fields.String(description='First Name of the doctor'),
    'LastName': fields.String(description='Last Name of the doctor'),
    'Address': fields.String(description='Address of the doctor'),
    'Specialty': fields.String(description='Specialty of the doctor')
})

# Setup the patient endpoint

patient = api.namespace('patientt')

create_patient = api.model( 'create_patient', {
    'FirstName': fields.String(description='First Name of the patient'),
    'LastName': fields.String(description='Last Name of the patient'),
    'BirthDate': fields.Date(description='Birth date of the patient'),
    'SS_Status': fields.String(description='Status of the patient'),
    'Address': fields.String(description='Address of the patient'),
    'PhoneNumner': fields.String(description='Phone number of the patient')
})

@company.route('')
class Company(Resource):

    @api.expect(pagination)
    def get( self ):
        """Get method to get a specified amount of company entries.
        """
        args = pagination.parse_args( request )

        page = args.get('page', 1)
        per_page = args.get('per_page', 10)

        inputs = (per_page, page*per_page)
        sql = "SELECT * FROM company LIMIT %s OFFSET %s"

        query.execute(sql, inputs)

        data = query.fetchall()

        print(data)

        return jsonify(data)

    @api.response(201, 'Company successfully created.')
    @api.expect(create_company)
    def post( self ):
        """Create a new company
        """

        new_company = api.payload
        print( new_company );
        inputs = (new_company["Name"], new_company["Location"])
        sql = "INSERT INTO Company(Name, Location) VALUES (%s, %s)"

        query.execute(sql, inputs)

        db.commit()

        return "", 201




@vaccine.route('')
class Vaccine(Resource):

    @api.expect(pagination)
    def get( self ):
        """Get method to get a specified amount of vaccine entries.
        """
        args = pagination.parse_args( request )

        page = args.get('page', 1)
        per_page = args.get('per_page', 10)

        inputs = (per_page, page*per_page)
        sql = "SELECT * FROM vaccine LIMIT %s OFFSET %s"

        query.execute(sql, inputs)

        data = query.fetchall()

        print(data)

        return jsonify(data)

    @api.response(201, 'Vaccine successfully added.')
    @api.expect(create_vaccine)
    def post( self ):
        """Create a new vaccine
        """

        new_vaccine = api.payload
        print( new_vaccine );
        inputs = (new_vaccine["Name"], new_vaccine["Description"], new_vaccine["StorageTemp"],
        new_vaccine["ShelfLife"],new_vaccine["DosesRequired"],new_vaccine["TimeSeperation"])
        sql = "INSERT INTO Vaccine(Name, Description, StorageTemp, ShelfLife, DosesRequired, TimeSeperation) VALUES (%s, %s, %s, %s, %s, %s)"

        query.execute(sql, inputs)

        db.commit()

        return "", 201

@doctor.route('')
class Doctor(Resource):

    @api.expect(pagination)
    def get( self ):
        """Get method to get a specified amount of doctor entries.
        """
        args = pagination.parse_args( request )

        page = args.get('page', 1)
        per_page = args.get('per_page', 10)

        inputs = (per_page, page*per_page)
        sql = "SELECT * FROM doctor LIMIT %s OFFSET %s"

        query.execute(sql, inputs)

        data = query.fetchall()

        print(data)

        return jsonify(data)

    @api.response(201, 'Doctor successfully added.')
    @api.expect(create_doctor)
    def post( self ):
        """Create a new doctor
        """

        new_doctor = api.payload
        print( new_doctor );
        inputs = (new_doctor["FirstName"], new_doctor["LastName"], new_doctor["Address"], new_doctor["Specialty"])
        sql = "INSERT INTO Doctor(FirstName, LastName, Address, Specialty) VALUES (%s, %s, %s, %s)"

        query.execute(sql, inputs)

        db.commit()

        return "", 201


@patient.route('')
class Patient(Resource):

    @api.expect(pagination)
    def get( self ):
        """Get method to get a specified amount of patient entries.
        """
        args = pagination.parse_args( request )

        page = args.get('page', 1)
        per_page = args.get('per_page', 10)

        inputs = (per_page, page*per_page)
        sql = "SELECT * FROM patient LIMIT %s OFFSET %s"

        query.execute(sql, inputs)

        data = query.fetchall()

        print(data)

        return jsonify(data)

    @api.response(201, 'Patient successfully created.')
    @api.expect(create_patient)
    def post( self ):
        """Create a new patient
        """

        new_patient = api.payload
        print( new_patient );
        inputs = (new_patient["FirstName"], new_patient["LastName"], new_patient["BirthDate"], new_patient["SS_Status"], new_patient["Address"], new_patient["PhoneNumber"])
        sql = "INSERT INTO Patient(Firstname, LastName, BirthDate, SS_Status, Address, PhoneNumber) VALUES (%s, %s, %s, %s, %s, %s)"

        query.execute(sql, inputs)

        db.commit()

        return "", 201







if  __name__ == "__main__":

    app.run(debug=True)

    