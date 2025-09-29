# Étape 1 : Image de base Java
FROM openjdk:17-jdk-slim

# Étape 2 : Créer un répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier le jar généré par Maven dans le conteneur
COPY target/student-management-0.0.1-SNAPSHOT.jar app.jar

# Étape 4 : Exposer le port sur lequel tourne ton Spring Boot
EXPOSE 8089

# Étape 5 : Lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
