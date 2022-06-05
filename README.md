# DEVOPS | TP1

## Lien vers les dépôts Github et DockerHub :

https://hub.docker.com/repository/docker/celinekhauv/meteo/general  
https://github.com/xulaing/devops_tp1/settings/access

## Solution

- Wrapper (bash)
  Le wrapper contient uniquement la commande « curl ». C’est l’abréviation de « Client URL ». On l’utilise pour récupérer la réponse de l’API weatherapimap.  
  On a décidé de faire un wrapper en bash car la commande est relativement simple et très connue.  
  
- DockerFile  
  L’image docker utilisé est Alpine. Elle est complète et de taille minimale. On n’a pas besoin de beaucoup de puissance pour faire de simples requêtes http.  
  On installe ensuite la commande curl.  
  On importe le wrapper dans le conteneur Docker en utilisant la commande "COPY".  
  On execute ensuite le wrapper avec la commande "CMD". Cette commande spécifie l'instruction qui doit être exécutée au démarrage d'un conteneur Docker.  
