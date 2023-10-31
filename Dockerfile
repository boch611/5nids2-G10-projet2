# Utilisez une image de base
FROM python:3.8

# Copiez les fichiers du projet dans l'image
COPY . /app

# Définissez le répertoire de travail
WORKDIR /app

# Installez les dépendances
RUN pip install -r requirements.txt

# Exécutez votre application
CMD ["python", "app.py"]