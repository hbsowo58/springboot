# 1. 빌드 스테이지
FROM eclipse-temurin:17-jdk-alpine AS build
# 작업 디렉토리를 설정하는 것이 좋습니다.
WORKDIR /app
COPY . .

# gradlew에 실행 권한을 부여 (Permission denied 방지)
RUN chmod +x ./gradlew

# 빌드 실행 (테스트를 제외하면 메모리 부족 현상을 줄일 수 있습니다)
RUN ./gradlew clean bootJar -x test

# 2. 실행 스테이지
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# 위 build 스테이지의 WORKDIR(/app) 내 build/libs 폴더에서 가져오도록 수정
COPY --from=build /app/build/libs/*.jar app.jar

# Render 등 서비스에서 사용할 포트 (보통 8080)
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
