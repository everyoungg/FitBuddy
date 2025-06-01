from flask import Flask, request, jsonify
import pickle
import numpy as np
from tensorflow.keras.models import load_model

app = Flask(__name__)

# 모델 및 스케일러 로드
with open('plank_model/model/input_scaler.pkl', 'rb') as f:
    scaler = pickle.load(f)

with open('plank_model/model/plank_dp.pkl', 'rb') as f:
    model = pickle.load(f)

@app.route('/predict', methods=['POST'])
def predict_pose():
    try:
        data = request.get_json()

        # 예: {"elbow": 95.2, "torso": 165.8}
        angles = [data['elbow'], data['torso']]
        input_data = np.array([angles])
        scaled = scaler.transform(input_data)
        pred = model.predict(scaled)

        label = int(pred[0])
        result = "정자세" if label == 1 else "오자세"

        return jsonify({'result': result, 'label': label})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
