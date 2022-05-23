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

RUN echo $(ls -la docker-sae203-1)

RUN chmod u+x docker-sae203-1/run.sh

# Exposer le port 80
EXPOSE 80


# Lancer le service apache au démarrage du conteneur
CMD ["/bin/bash", "docker-sae203-1/run.sh"]

