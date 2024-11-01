from flask import Flask,request,jsonify
from flask_cors import CORS
import requests

def publishedResult(index):
    key_url="https://api.ktu.edu.in/ktu-web-service/anon/result"

    headers={
        "Origin":"https://ktu.edu.in/",
        "Referer":"https://ktu.edu.in/",
        "User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36",
    }

    json={
        "program":str(index)
    }

    response=requests.post(key_url,headers=headers,json=json,verify=False)
    return response.json()


app=Flask(__name__)
CORS(app)

@app.route("/",methods=["POST"])
def proxy():
    data=request.get_json()
    data=publishedResult(data["index"])
    return data,200
    
if __name__=="__main__":
    app.run(debug=True,port=8000)