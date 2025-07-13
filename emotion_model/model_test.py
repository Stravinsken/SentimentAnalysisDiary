from tensorflow.keras.models import load_model
import numpy as np
import tensorflow as tf
import pickle

# 1. 모델과 tokenizer 불러오기
model = load_model('model.h5')
with open('tokenizer.pickle', 'rb') as handle:
    tokenizer = pickle.load(handle)

# 2. 입력 문장
input_text = input("문장을 입력하세요: ")

# 3. 토큰화 및 패딩
maxlen = 66  # 학습 때 사용한 maxlen과 동일하게!
seq = tokenizer.texts_to_sequences([input_text])
pad = tf.keras.preprocessing.sequence.pad_sequences(seq, maxlen=maxlen)

# 4. 예측
pred = model.predict(pad)[0]  # (6,) shape, 각 감정별 확률

# 5. 감정별 확률 출력
emotion_dict = {0: 'sadness', 1: 'happy', 2: 'love', 3: 'anger', 4: 'fear', 5: 'suprise'}
for idx, prob in enumerate(pred):
    print(f"{emotion_dict[idx]}: {prob*100:.2f}%")

# 6. 가장 높은 확률의 감정도 함께 출력하고 싶다면
pred_label = np.argmax(pred)
print("예측 감정:", emotion_dict[pred_label])