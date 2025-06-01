# inference_squat.py

import joblib
import numpy as np

# ✅ 모델 경로 (스쿼트용 모델로 경로 맞추세요)
MODEL_PATH = "squat_model/model/LR_model.pkl"

# ✅ 모델 불러오기
def load_model():
    return joblib.load(MODEL_PATH)

# ✅ 예측 함수
def predict_posture(model, landmarks):
    """
    landmarks: 1차원 리스트 or np.array, 예: [x1, y1, x2, y2, ..., xN, yN]
    (총 34개 정도의 좌표값이면 17개 관절 x,y쌍일 가능성 높음)
    """
    features = np.array(landmarks).reshape(1, -1)
    prediction = model.predict(features)
    proba = model.predict_proba(features)
    return prediction[0], proba[0]

# ✅ 테스트 코드
if __name__ == "__main__":
    model = load_model()

    # 예시 입력 (실제 사용할 땐 MediaPipe 등에서 추출된 좌표 사용)
    example_input = [0.1] * 34  # x1, y1, x2, y2, ..., x17, y17

    label, confidence = predict_posture(model, example_input)
    print(f"예측 결과: {'정자세' if label == 1 else '오자세'}")
    print(f"신뢰도: {confidence}")
