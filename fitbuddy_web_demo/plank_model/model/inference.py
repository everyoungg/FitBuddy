import pickle
import numpy as np

# 📦 모델 & 스케일러 불러오기

with open('plank_model/model/input_scaler.pkl', 'rb') as f:
    scaler = pickle.load(f)

with open('plank_model/model/plank_dp.pkl', 'rb') as f:
    model = pickle.load(f)


# ✅ 예측 함수
def predict_pose(keypoints):
    """
    keypoints: 33개 관절의 [x1, y1, x2, y2, ..., x33, y33] 형태 (총 66개 float)
    """
    keypoints = np.array(keypoints).reshape(1, -1)       # (1, 66)
    keypoints_scaled = scaler.transform(keypoints)       # 정규화
    prediction = model.predict(keypoints_scaled)

    result = prediction[0] if hasattr(prediction, '__getitem__') else prediction
    return "Good" if result == 1 else "Bad"

# 🧪 테스트용 예시 (임시 데이터)
if __name__ == '__main__':
    dummy_input = [0.1] * 66  # 33개 관절의 더미 (x, y)
    print("Plank 자세 결과:", predict_pose(dummy_input))
