# 원티드 프리온보딩 코스 사전과제 - 날씨 정보 앱 ☀️
- 여러 도시의 날씨를 한눈에 볼 수 있습니다.
- 특정 도시의 날씨 상세 정보를 확인할 수 있습니다.

## 목차
1. [동작 화면](https://github.com/3dots3craters/wanted_pre_onboarding/edit/main/README.md#%EB%8F%99%EC%9E%91-%ED%99%94%EB%A9%B4)
2. [개발 기록](https://github.com/3dots3craters/wanted_pre_onboarding/edit/main/README.md#%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EB%A1%9D)
3. [과제 후기](https://github.com/3dots3craters/wanted_pre_onboarding/edit/main/README.md#%EA%B3%BC%EC%A0%9C-%ED%9B%84%EA%B8%B0) 

## 1. 동작 화면
|여러 도시의 날씨(가로) | 특정 도시의 날씨(가로) |
|:--------------:|:--------------:|
|![Simulator Screen Shot - iPhone SE (3rd generation) - 2022-06-22 at 11 35 33](https://user-images.githubusercontent.com/66169740/174931524-e019b694-34f4-4097-85c0-63ac04cab65d.png)|![Simulator Screen Shot - iPhone SE (3rd generation) - 2022-06-22 at 11 35 47](https://user-images.githubusercontent.com/66169740/174931529-f8a84030-720e-4737-ba57-2b222e8dde87.png)|
| 여러 도시의 날씨 | 특정 도시의 날씨 |  
|![Simulator Screen Shot - iPhone SE (3rd generation) - 2022-06-22 at 11 35 17](https://user-images.githubusercontent.com/66169740/174931518-e7ae51f1-1ea7-4026-aa45-cc4bf9a943d0.png)|![Simulator Screen Shot - iPhone SE (3rd generation) - 2022-06-22 at 11 35 21](https://user-images.githubusercontent.com/66169740/174931421-344ba60c-7a50-4aa2-a255-d1c6a3d5dca4.png)|

## 2. 개발 기록

#### DAY1 (2022.06.19)
- 스토리보드를 이용해 UI를 구상했다.

#### DAY2 (2022.06.20)
- Open Weather의 API를 이용해 날씨 정보를 받아왔다.
- 받아온 날씨 정보를 화면에 적절히 출력되도록 했다.

#### DAY3 (2022.06.21)
- 캐시를 활용해 날씨 아이콘 이미지를 불러왔다.
- 오토레이아웃을 이용해 UI를 다듬었다.

#### DAY4 (2022.06.22)
- UI 마무리 작업을 진행했다.
- 코드를 전체적으로 리팩토링했다.

## 3. 과제 후기
- `ImageCache`, `async/await` 등 이전에 잘 알지 못했던 많은 것들을 공부해볼 수 있어 좋았다.
- 과제 요구 사항이 세세한 편은 아니라 여러가지로 다양하게 고민하는 시간을 가질 수 있어 좋았다.
  - ex. 날씨 정보를 받아오기 위해 내장 `GeoCoding API`를 쓸지 별도의 `GeoCoding API`를 쓸지 등
- 시간이 촉박해서 기능 구현에 힘쓰느라 새로운 개념에 대해 깊이 있게 공부할 여유가 없었던 점이 아쉬웠다.
- 과제 제출 이후, 내가 코드에 쓴 요소들에 대해 다시 한번 확실히 공부하는 시간을 가질 계획이다.
