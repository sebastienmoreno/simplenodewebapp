# usage:
#	make build - build docker images
# make version - modifie la version de ce projet

# Nom complet de l'image
NAME=simplenodewebapp

# la version des sources de ce projet
VERSION=latest

# Registry
REGISTRY_PREFIX=docker.io/smoreno

# Le Dockerfile n'est pas à la racine à cause du pipeline et du context Docker.
# sur les agents de build le pipeline est placé dans le worskpace c'est à dire dans les sources de ce projet.
# si le context de la commande 'build' et '.', le context contient le pipeline.
# Hors Docker envoit tout le context au serveur Docker (localhost), ça prends du temps et des ressources pour rien .
# Donc nous limitons le context au répertoire docker.
DOCKERFILE=./Dockerfile

.PHONY: all build-image push-image

build: build-image

build-image:
	echo "Building image $(NAME):$(VERSION)"
	docker build --pull --no-cache -f $(DOCKERFILE) -t ${REGISTRY_PREFIX}/$(NAME):$(VERSION) .

push-image:
	echo "Pushing image $(NAME):$(VERSION)"
	docker push ${REGISTRY_PREFIX}/$(NAME):$(VERSION)

