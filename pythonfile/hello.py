from flask import Flask, flash, request, redirect, url_for
import flask_cors
import matplotlib.pyplot as plt
import cv2
import os 
from werkzeug.utils import secure_filename
import base64

app = Flask(__name__)
flask_cors.CORS(app)


UPLOAD_FOLDER = ''
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])


@app.route('/', methods = ['POST'])
def image_info():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            return redirect(request.url)
        file = request.files['file']
    
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            #TODO : file 저장 경로 변경 
            file.save(os.path.join('C:\\Users\\qodbw\\Documents\\bean\\pythonfile', filename))
  
    return "hello"
    
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


if __name__ == "__main__":
    app.run(port = 5002)


    

    

    
   





