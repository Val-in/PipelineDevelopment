# Базовый образ
FROM maven:3.9.0-eclipse-temurin-17

# Рабочая директория
WORKDIR /app

# Копируем pom.xml и скачиваем зависимости для кэша
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Копируем весь код
COPY src ./src

# Собираем jar
RUN mvn package -B

# Запуск приложения
CMD ["java", "-jar", "target/DockerConfiguration-1.0-SNAPSHOT-jar-with-dependencies.jar"]

