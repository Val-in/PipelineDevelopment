# Базовый образ
FROM eclipse-temurin:17-jre-alpine

# Рабочая директория
WORKDIR /app

# Файл, который необходимо скопировать в образ
COPY out/artifacts/DockerConfiguration_jar/DockerConfiguration.jar app.jar

# Порт, необходимый для доступа к приложению
EXPOSE 8080

# Команда запуска приложения
CMD ["java", "-jar", "app.jar"]
