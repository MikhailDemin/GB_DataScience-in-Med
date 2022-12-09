# USAGE
# Start the server:
# 	python run_server.py
# Submit a request via cURL:
# 	curl -X POST -F image=@dog.jpg 'http://localhost:5000/predict'
# Submit a request via Python:
# python simple_request.py

# import the necessary packages
# import numpy as np
import dill
import pandas as pd
import flask
dill._dill._reverse_typemap['ClassType'] = type
# import cloudpickle
# import sklearn
# from catboost import CatBoostClassifier

# initialize our Flask application and the model
app = flask.Flask(__name__)
model = None


def load_model(model_path):
	# load the pre-trained model
	global model
	with open(model_path, 'rb') as f:
		model = dill.load(f)
	# print(model)


@app.route("/", methods=["GET"])
def general():
	return "Welcome to fraudelent prediction process"


@app.route("/predict", methods=["POST"])
def predict():
	print('Start predict')
	# initialize the data dictionary that will be returned from the
	# view
	data = {"success": False}
	# ensure an image was properly uploaded to our endpoint
	print("*" * 20)
	print(type(flask.request.get_json()))
	print("*" * 20)
# if flask.request.method == "POST":
# 	age, gender, height, weight, ap_hi, ap_lo, cholesterol, gluc, smoke, alco, active_a = ""
	request_json = flask.request.get_json()
	# print(type(request_json))
	age = gender = height = weight = ap_hi = ap_lo = cholesterol = gluc = smoke = alco = active = 0

	if request_json["age"]:
		age = request_json['age']
	if request_json["gender"]:
		gender = request_json['gender']
	if request_json["height"]:
		height = request_json['height']
	if request_json["weight"]:
		weight = request_json['weight']
	if request_json["ap_hi"]:
		ap_hi = request_json['ap_hi']
	if request_json["ap_lo"]:
		ap_lo = request_json['ap_lo']
	if request_json["cholesterol"]:
		cholesterol = request_json['cholesterol']
	if request_json["gluc"]:
		gluc = request_json['gluc']
	if request_json["smoke"]:
		smoke = request_json['smoke']
	if request_json["active"]:
		active = request_json['active']
	if request_json["alco"]:
		alco = request_json['alco']
	print(age, gender, height, weight, ap_hi, ap_lo, cholesterol, gluc, smoke, alco, active)
	print(pd.DataFrame({"age_years": [age], 'gender': [gender], 'height': [height], 'weight': [weight],
						'ap_hi': [ap_hi], 'ap_lo': [ap_lo], 'cholesterol': [cholesterol], 'gluc': [gluc],
						'smoke': [smoke], 'alco': [alco], 'active': [active]}))
	preds = model.predict_proba(pd.DataFrame({"age_years": [age], 'gender': [gender], 'height': [height],
											'weight': [weight], 'ap_hi': [ap_hi], 'ap_lo': [ap_lo],
											'cholesterol': [cholesterol], 'gluc': [gluc], 'smoke': [smoke],
											'alco': [alco], 'active': [active]}))

	data["predictions"] = preds[:, 1][0]
	# data["description"] = description
	# indicate that the request was a success
	data["success"] = True

	# return the data dictionary as a JSON response
	return flask.jsonify(data)


# if this is the main thread of execution first load the model and
# then start the server
if __name__ == "__main__":
	print(("* Loading the model and Flask starting server..."
		"please wait until server has fully started"))
	modelpath = "models\Catboost_pipeline.pkl"
	load_model(modelpath)
	app.run()
