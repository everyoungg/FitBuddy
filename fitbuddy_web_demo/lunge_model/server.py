from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

# 모델 & 스케일러 로드
with open('stage_lunge_dp.pkl', 'rb') as f:
    model = pickle.load(f)

with open('input_scaler.pkl', 'rb') as f:
    scaler = pickle.load(f)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    features = np.array(data['features']).reshape(1, -1)  # 예: 관절 각도 10개
    scaled = scaler.transform(features)
    prediction = model.predict(scaled)
    return jsonify({'result': prediction[0]})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)


