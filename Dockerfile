# 1. 빌드 스테이지
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# 모든 파일을 복사
COPY . .

# Maven 실행 파일(mvnw)에 권한 부여
RUN chmod +x ./mvnw

# Maven 빌드 실행 (테스트 제외하여 메모리 절약)
# -DskipTests 옵션이 Gradle의 -x test와 같은 역할입니다.
RUN ./mvnw clean package -DskipTests

# 2. 실행 스테이지
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Maven은 빌드 결과물이 'target' 폴더에 생성됩니다.
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
