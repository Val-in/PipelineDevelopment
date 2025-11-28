# Базовый образ
FROM eclipse-temurin:17-jre-alpine

# Рабочая директория
WORKDIR /app

# Копируем pom.xml и скачиваем зависимости для кэша
COPY pom.xml .
RUN ./mvnw dependency:go-offline -B

# Копируем весь код
COPY src ./src

# Собираем jar
RUN ./mvnw package -B

# Запуск приложения
CMD ["java", "-jar", "target/DockerConfiguration.jar"]