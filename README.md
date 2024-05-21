# 🕓 24HANE (42Checkin_v2-iOS)

 <div align="center">
<a align="center" href="https://24hoursarenotenough.42seoul.kr/">
  <img width="522" alt="스크린샷 2022-10-02 오후 5 04 40" src="https://user-images.githubusercontent.com/61973070/193444442-3f718559-06b5-43d5-bd31-6f91e9ee4194.png"></a></br>

[![GitHub Stars](https://img.shields.io/github/stars/ittzggd/24HANE_ver2?style=for-the-badge)](https://github.com/ittzggd/24HANE_ver2/stargazers) [![GitHub Stars](https://img.shields.io/github/issues/ittzggd/24HANE_ver2?style=for-the-badge)](https://github.com/ittzggd/24HANE_ver2/issues) [![Current Version](https://img.shields.io/badge/version-2.0.0-black?style=for-the-badge)](https://github.com/IgorAntun/node-chat) [![GitHub License](https://img.shields.io/github/license/ittzggd/24HANE_ver2?style=for-the-badge)](https://github.com/IgorAntun/node-chat/issues)

 </div>

# 💬 프로젝트 소개

### 24 hours are not enough! 24시간이 부족해!

안녕하세요:) 42서울 공식 체크인 서비스 24HANE입니다💌

`"24 Hane" (24 hours are not enough)` 은 Cadet 여러분의 클러스터 출입 여부와 출입 누적 시간을 직접 확인할 수 있도록 개발된 서비스 입니다.

원활하게 서비스를 이용할 수 있도록 기본 기능을 소개합니다. 👋

```
카뎃 여러분이 직접 클러스터 출입 누적 시간을 확인할 수 있는 24 HANE 서비스를 소개합니다.
 - 클러스터 출입태깅이 잘 됐는지 궁금한가요?
 - 클러스터 출입 누적 시간이 궁금한가요?

24HANE 서비스를 이용한다면?
 - 클러스터 출입 누적 시간을 오늘 / 월 기준으로 한 눈에 볼 수 있습니다.
 - 지원금 산정의 기준이 되는 인정 시간을 확인할 수 있습니다.
 - 목표 시간을 설정하여 오늘의 학습 시간 진척도를 그래프로 볼 수 있습니다.
 - 최근 6주간 / 6달간의 학습 시간 진척도를 그래프로 볼 수 있습니다.
 - 클러스터에서 학습중인 실시간 인원을 확인할 수 있습니다.
 - 자신의 상세한 클러스터 출입 기록을 일별로 확인할 수 있습니다.(누락된 기록까지!)
 - 자정 전후로 별도 태깅 없이 학습에만 몰입 할 수 있습니다.
 - 카드를 분실한 경우 카드 재발급을 앱에서 신청할 수 있습니다.
```

## 앱스토어 링크

- https://apps.apple.com/kr/app/24hane/id1659801775

## 웹사이트

- https://24hoursarenotenough.42seoul.kr/

# 🛠 기술 스택

<div>

<table border="1">
  <th align="center">분야</th>
  <th align="center">기술스택</th>
  <th align="center">선정이유</th>
  <tr>
    <td rowspan="2" align="center">iOS</td>
    <td><img src="https://cdn-icons-png.flaticon.com/512/5968/5968371.png" width="15px" alt="_icon"/> Swift</td>
    <td>이미 각 플랫폼별로 팀이 나뉘어 있기 때문에 ReactNative나 Flutter등의 크로스플랫폼 보다 <br>Swift를 기반으로 하는 네이티브가 개발중 발생할 수 있는 문제 해결에 유리할 것으로 판단</td>
  </tr>
  <tr>
    <td><img src="https://developer.apple.com/assets/elements/icons/swiftui/swiftui-96x96_2x.png" width="15px" alt="_icon"/> SwiftUI</td>
    <td>팀원이 모두 앱 개발이 처음이었기 때문에 UIkit의 StoryBoard와 협업을 위해 익숙하지 않은 코드베이스의 작업방식을 배우기 보다는 <br>상대적으로 러닝커브가 낮은 SwiftUI를 선택</td>
  </tr>
  <!-- <tr>
    <td><img src="https://velog.velcdn.com/images/qnm83/post/92952fa1-24b5-4c85-b4a1-bd5d0ef015db/image.png" width="15px" alt="_icon"/> CoreData</td>
    <td>API 호출을 최소화 하기 위해 변하지 않는 과거의 로그데이터를 저장해 둘 캐시 역할이 필요했고 삽입/삭제가 자주 일어나지 않기 때문에 <br>외부 라이브러리 보다는 Apple이 제공해주는 퍼스트파티 프레임워크인 CoreData 선택</td>
  </tr> -->
  <tr>
    <td rowspan="5" align="center">Architecture</td>
    <td>✨ MVVM</td>
    <td>24HANE.ver1 개발 당시 뚜렷한 형식이 없는 소스코드로 인해 코드 수정이나 리팩토링을 시도할 때 예상비용이 굉장히 컸던 이유로 <br>ver2 에서 새로운 디자인에 맞춰 새로운 아키텍쳐를 적용해 보고자 선택</td>
  </tr>
</table>

</div>
<br/>

# 🗓️ 개발 기간

<div align="center">

| 버전 | 기간 | 비고 |
| --- | --- | --- |
| Ver. 1 | 2022.10 - 2022.12 | - |
| Ver. 2 | 2023.02 - 2023.03 | 지원금 정책 변경에 따른 리빌딩, 디자인 개편 |
| Ver. 3 | 2023.12 - 2024.01 | 지원금 정책 변경에 따른 업데이트, 리팩토링 |
| Ver. 4 | 2024.03 - 2024.06 | 내부 리팩토링, watch OS 추가 |

</div>


# 🧑‍💻 멤버

<div align="center">

| 멤버                                              | 역할         |
| ------------------------------------------------- | ------------ |
| [👩🏻‍💻 장희주 (hejang)](https://github.com/ittzggd)  | 기획, 개발   |
| [🐾 황윤기 (yuhwang)](https://github.com/YunKi-H) | 개발         |
| [🐾 임호성 (hoslim)](https://github.com/HiHoi)    | 개발         |
| [🎨 신인호 (inshin)](https://github.com/42inshin) | 기획, 디자인 |

<!-- |  <a href="https://github.com/innovationacademy-kr"><img src="https://img.shields.io/badge/42Seoul-000000?style=flat-square&logo=42&logoColor=white" /></a> |
| ----------------------------------------- | -->
</div>

# 💻 기능 소개

<table align="center">
  <tr>
    <td><img width="345" alt="image" src="https://user-images.githubusercontent.com/80469941/229361889-afde12aa-f12e-466d-8a61-687031216324.PNG"></td>
    <td><img width="345" alt="image" src="https://user-images.githubusercontent.com/80469941/229361906-50b61506-8587-4b1d-be88-430a41ce065d.PNG"></td>
    <td><img width="345" alt="image" src="https://user-images.githubusercontent.com/80469941/229361927-51b90dce-e8d1-4c60-9aa3-1430cd022c30.PNG"></td>
  <tr>
  <tr>
    <td><img width="345" alt="image" src="https://user-images.githubusercontent.com/80469941/229361940-dade4798-5ea8-4880-9c98-da5841ec58cf.PNG"></td>
    <td><img width="345" alt="image" src="https://user-images.githubusercontent.com/80469941/229361953-4d744445-631c-4ba7-a4f3-c0be742dcdad.PNG"></td>
    <td><img width="345" alt="image" src="https://user-images.githubusercontent.com/80469941/229361969-0e32d7d0-4aaf-460e-9b9f-0bdaf71d2cb2.PNG"></td>
  <tr>
</table>

- **로그인**

  - Intra 로그인을 통해 서비스 로그인이 가능합니다.

- **홈**

  - 로그인 후 바로 보이는 페이지로 본인의 정보와 출입 누적 시간(오늘, 이번 달) 현황을 한 눈에 볼 수 있습니다.
  - **`개인 정보`**
    - 본인의 인트라 사진과 ID를 통해 본인의 정보를 확인합니다.
  - **`출입 여부`**
    - 입실 시 홈 화면의 전체 배경이 바뀝니다. 또한
      인트라ID의 우측 상단에 있는 작은 원으로 출입 여부가 표시됩니다.
    - **(초록색🟢)** 정상적으로 입실(check-in) 되었음을 의미합니다.
  - **`이용시간`**
    - 오늘의 클러스터 누적 시간을 표시합니다.
    - 단, 개인별 사진 출입 카드의 ‘입실’ 과 ‘퇴실’ 태깅 짝이 일치하는 경우에만 ‘오늘 누적 시간’으로 기록됩니다.
    - 따라서, 입실(check-in) 중일 경우 오늘 누적 시간은 기록되지 않으며 퇴실(check-out) 태깅이 확인 된 후 누적 시간이 기록됩니다.
    - 목표시간을 설정할 수 있습니다. 기본 값으로 4시간이 적용되어 있으며, 목표시간을 1시간 단위로 24시간까지 변경하실 수 있습니다.
  - **`월 누적시간`**
    - 이번 달 클러스터 누적 시간을 표시합니다.
    - 패널을 펼쳐서 지원금 산정 기준이 되는 '인정시간'을 확인할 수 있습니다.
  - **`6주 / 6개월 체류시간 그래프`**
    - 6주, 6개월 체류 시간을 표시하는 바형 그래프가 추가되었습니다.
    - 각 바를 탭하면 누적 시간과 일 평균 시간을 확인할 수 있습니다.
  - **`실시간 현황`**
    - 42서울 클러스터의 현재 체류 인원이 표시됩니다.

- **캘린더**

  - 2022. 8(24HANE 서비스 시작 월)부터 현재까지의 기록을 확인 할 수 있습니다.
  - 월별로 총 누적시간을 확인할 수 있습니다.
  - 총 누적시간 패널을 탭하면 해당 월의 인정시간을 확인할 수 있습니다.
  - 일별 진척도를 색상을 통해 확인할 수 있습니다. (4시간 단위)
  - Pagination과 타이틀을 탭해서 월을 변경할 수 있습니다.
  - 일별로 태깅기록을 확일 할 수 있으며, 누락된 기록도 표시됩니다.

- **더보기**
  - 앱을 통해 카드 재발급 신청을 진행하실 수 있습니다.
  - 지원금 지침 안내페이지(링크)
  - 출입기록 문의(링크)
  - 이용 가이드(링크)
  - 앱 피드백(링크)
  - 로그아웃

# 👀 기술적인 항목

> **커밋 컨벤션**
    1. feat: 기능 추가와 새로운 패키지의 추가를 의미합니다. 
    2. fix: 기존 코드에서 수정사항이 있음을 의미합니다. 
    3. env: 개발 환경에 대한 변경사항이 있음을 의미합니다.
    4. docs: 디렉토리의 구조 변경이나 문서에 대한 변경사항이 있음을 의미합니다.(개발 문서, 파일 등등)
    5. test: git에 대한 테스트가 있음을 의미합니다.
    6. hotfix: 긴급한 수정사항이 있음을 의미합니다.
    7. refactor: 내부의 리팩토링이 있음을 의미합니다.
    8. remove: 파일 또는 기능, 문서의 삭제를 의미합니다.

> **SwiftLint**
    ```swift
    identifier_name:
      min_length: 0

    disabled_rules:
      - line_length
    ```

> **디렉토리 구조**
    .
    ├── 24HANE.entitlements
    ├── HANE24
    │   ├── Assets.xcassets
    │   │   ├── AccentColor.colorset
    │   │   ├── AppIcon.appiconset
    │   │   ├── Background.imageset
    │   │   └── Colors
    │   ├── ContentView.swift
    │   ├── GraphView.swift
    │   ├── HANE24App.swift
    │   ├── Info.plist
    │   ├── LaunchScreen.swift
    │   ├── Model
    │   │   ├── JSONs.swift
    │   │   └── Structs.swift
    │   ├── Preview Content
    │   │   └── Preview Assets.xcassets
    │   │       └── Contents.json
    │   ├── Utils
    │   │   ├── ColorExtension.swift
    │   │   ├── DarkMode.swift
    │   │   ├── DateExtensions.swift
    │   │   └── UserDefaultsExtension.swift
    │   ├── View
    │   │   ├── Calendar
    │   │   │   ├── AccTimeCardForCalendarView.swift
    │   │   │   ├── CalendarBodyView.swift
    │   │   │   ├── CalendarGridView.swift
    │   │   │   ├── CalendarHeaderView.swift
    │   │   │   ├── CalendarView.swift
    │   │   │   └── TagLogView.swift
    │   │   ├── Home
    │   │   │   ├── ChartDetailView.swift
    │   │   │   ├── ChartView.swift
    │   │   │   ├── HomeView.swift
    │   │   │   ├── NoticeView.swift
    │   │   │   ├── PopulationView.swift
    │   │   │   ├── ThisMonthAccTimeCardView.swift
    │   │   │   └── TodayAccTimeCardView.swift
    │   │   ├── LoadingView.swift
    │   │   ├── MainView.swift
    │   │   ├── More
    │   │   │   ├── AlertView.swift
    │   │   │   ├── CardProgressView.swift
    │   │   │   ├── ErrorView.swift
    │   │   │   ├── MoreView.swift
    │   │   │   └── ReissuanceView.swift
    │   │   ├── SignInView.swift
    │   │   └── SignInWebView.swift
    │   └── ViewModel
    │       ├── CalendarVM.swift
    │       ├── HaneVM.swift
    │       ├── NetworkManager.swift
    │       └── NetworkMonitoringManager.swift
    ├── HANE24TEST
    │   ├── HANE24Test.swift
    │   └── HaneTest.xctestplan
    ├── HANE24Widget
    │   ├── AccumulationTimeStruct.swift
    │   ├── Assets.xcassets
    │   ├── HANE24Widget.swift
    │   ├── HANE24WidgetBundle.swift
    │   ├── HANE24WidgetConstant.swift
    │   └── Info.plist
    ├── Podfile
    ├── Podfile.lock
    ├── Pods
    ├── README.md
    ├── env.xcconfig
    └── pull_request_template.md
