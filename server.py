
from flask import Flask, Blueprint, jsonify, request
from flask_restplus import Resource, Api, reqparse, fields
from flask_cors import CORS

import mysql.connector
import os


from dotenv import load_dotenv
load_dotenv(".env")



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


# Setup the doctor endpoint

doctor = api.namespace('doctor')

create_doctor = api.model( 'create_doctor', {
    'FirstName': fields.String(description='First Name of the doctor'),
    'LastName': fields.String(description='Last Name of the doctor'),
    'Address': fields.String(description='Address of the doctor'),
    'Specialty': fields.String(description='Specialty of the doctor')
})

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


# Setup the patient endpoint

patient = api.namespace('patient')

create_patient = api.model( 'create_patient', {
    'FirstName': fields.String(description='First Name of the patient'),
    'LastName': fields.String(description='Last Name of the patient'),
    'BirthDate': fields.Date(description='Birth date of the patient'),
    'SS_Status': fields.String(description='Status of the patient'),
    'Address': fields.String(description='Address of the patient'),
    'PhoneNumner': fields.String(description='Phone number of the patient')
})

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


#Trial code

# Setup the Storage Provider endpoint

storageProvider = api.namespace('storageProvider')

create_storageProvider = api.model( 'create_storageProvider', {
    'Storage_Provider_ID': fields.String(description='Storage Provider ID')
})

@storageProvider.route('')
class StorageProvider(Resource):

    @api.expect(pagination)
    def get( self ):
        """Get method to get a specified amount of Storage providers entries.
        """
        args = pagination.parse_args( request )

        page = args.get('page', 1)
        per_page = args.get('per_page', 10)

        inputs = (per_page, page*per_page)
        sql = "SELECT * FROM storageProvider LIMIT %s OFFSET %s"

        query.execute(sql, inputs)

        data = query.fetchall()

        print(data)

        return jsonify(data)

    @api.response(201, 'Storage Provider successfully created.')
    @api.expect(create_storageProvider)
    def post( self ):
        """Create a new storage provider
        """

        new_storageProvider = api.payload
        print( new_storageProvider );
        inputs = (new_storageProvider["Storage_Provider_ID"])
        sql = "INSERT INTO StorageProvider(Storage_Provider_ID) VALUES (%s)"

        query.execute(sql, inputs)

        db.commit()

        return "", 201


# Setup the Hospital endpoint

hospital = api.namespace('hospital')

create_hospital = api.model( 'create_hospital', {
    'H_Registration': fields.String(description='the registration number of the hospital'),
    'Name': fields.String(description='the name of the hospital'),
    'Address': fields.String(description='the address of the hospital'),
    'isPublic': fields.String(description='specifies wether or not the hospital is public'),
    'offersVaccination': fields.String(description='specifies wether or not the hospital offers vaccination'),
    'Storage_Provider_ID': fields.String(description='a foreign key referencing the ID of the storage provider of the hospital')
})

@hospital.route('')
class Hospital(Resource):

    @api.expect(pagination)
    def get( self ):
        """Get method to get a specified amount of hospital entries.
        """
        args = pagination.parse_args( request )

        page = args.get('page', 1)
        per_page = args.get('per_page', 10)

        inputs = (per_page, page*per_page)
        sql = "SELECT * FROM hospital LIMIT %s OFFSET %s"

        query.execute(sql, inputs)

        data = query.fetchall()

        print(data)

        return jsonify(data)

    @api.response(201, 'Hospital successfully created.')
    @api.expect(create_hospital)
    def post( self ):
        """Create a new hospital
        """

        new_hospital = api.payload
        print( new_hospital );
        inputs = (new_hospital["H_Registration"], new_hospital["name"], new_hospital["address"], new_hospital["isPublic"], new_hospital["offersVaccination"], new_hospital["Storage_Provider_ID"])
        sql = "INSERT INTO Hospital(H_Registration, name, address, isPublic, offersVaccination, Storage_Provider_ID) VALUES (%s, %s, %s, %s, %s. %s)"

        query.execute(sql, inputs)

        db.commit()

        return "", 201


# Setup the Orders endpoint

orders = api.namespace('orders')

create_orders = api.model( 'create_orders', {
    'OrderID': fields.String(description='the ID number of the order'),
    'C_Registration': fields.String(description='a foreign key referencing the registration number of the company'),
    'GOV_ID': fields.String(description='a foreign key referencing the ID number of the government'),
    'OrderDate': fields.String(description='the date of placing the order'),
    'ETA': fields.String(description='the estimated time of arrival of the order'),
    'DateReceived': fields.String(description='the date of receiving the order'),
    'Status': fields.String(description='the status of the order')
})

@orders.route('')
class Orders(Resource):

    @api.expect(pagination)
    def get( self ):
        """Get method to get a specified amount of orders' entries.
        """
        args = pagination.parse_args( request )

        page = args.get('page', 1)
        per_page = args.get('per_page', 10)

        inputs = (per_page, page*per_page)
        sql = "SELECT * FROM orders LIMIT %s OFFSET %s"

        query.execute(sql, inputs)

        data = query.fetchall()

        print(data)

        return jsonify(data)

    @api.response(201, 'Order successfully created.')
    @api.expect(create_orders)
    def post( self ):
        """Create a new Order
        """

        new_orders = api.payload
        print( new_hospital );
        inputs = (new_orders["OrderID"], new_orders["C_Registration"], new_orders["GOV_ID"], new_orders["OrderDate"], new_orders["ETA"], new_orders["DateReceived"], new_orders["Status"])
        sql = "INSERT INTO Hospital(OrderID, C_Registration, GOV_ID, OrderDate, ETA, DateReceived, Status) VALUES (%s, %s, %s, %s, %s. %s, %s)"

        query.execute(sql, inputs)

        db.commit()

        return "", 201

if  __name__ == "__main__":

    app.run(debug=True)

    