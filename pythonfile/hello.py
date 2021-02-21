from flask import Flask
from flask import request
import flask_cors

app = Flask(__name__)
flask_cors.CORS(app)

# post 요청 받음
# TODO : 사진 객체를 파라미터로 받음
@app.route('/', methods = ['POST'])
def image_info():

    print('hello python')

    return "hello"
    


if __name__ == "__main__":
    app.run(port = 5002)


    

    

    
   





