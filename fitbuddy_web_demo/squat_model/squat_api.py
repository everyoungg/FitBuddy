# squat_api.py

from flask import Flask, request, jsonify
from flask_cors import CORS
import joblib
import numpy as np
import pyttsx3

app = Flask(__name__)
CORS(app)

# 🔹 모델 불러오기
MODEL_PATH = "squat_model/model/LR_model.pkl"
model = joblib.load(MODEL_PATH)

# 🔹 TTS 초기화
engine = pyttsx3.init()
engine.setProperty('rate', 170)  # 말하는 속도 조절

def speak(text):
    engine.say(text)
    engine.runAndWait()

# 🔹 예측 함수
def predict_posture(landmarks):
    features = np.array(landmarks).reshape(1, -1)
    prediction = model.predict(features)
    return int(prediction[0])  # 0 or 1

# 🔹 Flask API endpoint
@app.route('/squat/predict', methods=['POST'])
def predict_squat():
    data = request.get_json()
    landmarks = data.get("keypoints", [])

    if len(landmarks) != 34:
        return jsonify({"error": "입력 keypoints는 34개의 float값이어야 합니다."}), 400

    result = predict_posture(landmarks)

    if result == 1:
        feedback = "스쿼트 자세가 정확합니다!"
    else:
        feedback = "스쿼트 자세가 잘못되었습니다. 무릎과 엉덩이 각도를 확인해주세요."

    speak(feedback)  # 🗣 음성 피드백 출력
    return jsonify({"result": "정자세" if result == 1 else "오자세", "feedback": feedback})

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
