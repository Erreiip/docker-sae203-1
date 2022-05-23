# Utiliser l'image debian officielle comme image parent
FROM debian:latest


# Installer des services et des packages
RUN  apt-get update &&  \
    apt-get -y install  \
    nginx               \
    git                 \
    default-jdk


# Copier les fichiers de l'hôte vers l'image
RUN git clone https://github.com/Erreiip/docker-sae203-1.git

RUN cp -r docker-sae203-1/html/ /var/www/


# Exposer le port 80
EXPOSE 80


# Lancer le service apache au démarrage du conteneur
CMD ["nginx", "-g", "daemon off;"]
