from flask import Flask, request, jsonify
import joblib
import numpy as np
import pyttsx3

app = Flask(__name__)

# ───── TTS 설정 ───── #
engine = pyttsx3.init()
engine.setProperty('rate', 170)
def speak(text):
    engine.say(text)
    engine.runAndWait()

# ───── 모델 로딩 ───── #
squat_model = joblib.load("squat_model/model/LR_model.pkl")
lunge_model = joblib.load("lunge_model/model/err_LR_model.pkl")
plank_model = joblib.load("plank_model/model/LR_model.pkl")  # ← 리네임했으면 이 이름 사용

# ───── 스쿼트 API ───── #
@app.route('/predict/squat', methods=['POST'])
def predict_squat():
    data = request.get_json()
    keypoints = data.get("keypoints", [])
    if len(keypoints) != 34:
        return jsonify({"error": "스쿼트는 34개의 float 좌표가 필요합니다."}), 400

    pred = squat_model.predict(np.array(keypoints).reshape(1, -1))[0]
    result = "정자세" if pred == 1 else "오자세"
    feedback = "스쿼트 정확합니다!" if pred == 1 else "무릎과 엉덩이를 조정해주세요."
    speak(feedback)
    return jsonify({"result": result, "feedback": feedback})

# ───── 런지 API ───── #
@app.route('/predict/lunge', methods=['POST'])
def predict_lunge():
    data = request.get_json()
    features = data.get("features", [])
    if len(features) != 10:
        return jsonify({"error": "런지는 10개의 float 특징값이 필요합니다."}), 400

    pred = lunge_model.predict(np.array(features).reshape(1, -1))[0]
    result = "정자세" if pred == 1 else "오자세"
    feedback = "런지 자세 좋습니다!" if pred == 1 else "무릎이 발끝을 넘지 않게 하세요."
    speak(feedback)
    return jsonify({"result": result, "feedback": feedback})

# ───── 플랭크 API ───── #
@app.route('/predict/plank', methods=['POST'])
def predict_plank():
    data = request.get_json()
    angles = data.get("angles", [])
    if len(angles) != 3:
        return jsonify({"error": "플랭크는 3개의 각도값이 필요합니다."}), 400

    pred = plank_model.predict(np.array(angles).reshape(1, -1))[0]
    result = "정자세" if pred == 1 else "오자세"
    feedback = "플랭크 훌륭해요!" if pred == 1 else "허리를 곧게 펴주세요."
    speak(feedback)
    return jsonify({"result": result, "feedback": feedback})

# ───── 서버 실행 ───── #
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
