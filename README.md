# DEVOPS | TP1

## Lien vers les dépôts Github et DockerHub :

https://hub.docker.com/repository/docker/celinekhauv/meteo/general  
https://github.com/xulaing/devops_tp1/settings/access

## Solution

- Wrapper (express)
  
- DockerFile  
  L’image docker utilisé est node:10-alpine. Elle est complète et de taille minimale. On n’a pas besoin de beaucoup de puissance pour faire de simples requêtes http.  
  On installe ensuite la commande curl.  
  On importe le wrapper dans le conteneur Docker en utilisant la commande "COPY".  
  On execute ensuite le wrapper avec la commande "CMD". Cette commande spécifie l'instruction qui doit être exécutée au démarrage d'un conteneur Docker.  
