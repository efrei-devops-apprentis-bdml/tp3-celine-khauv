# DEVOPS | TP1

## Lien vers les dépôts Github et DockerHub :

https://hub.docker.com/repository/docker/celinekhauv/meteo/general  
https://hub.docker.com/repository/docker/celinekhauv/efrei-devops-tp2

## Solution

- Wrapper (express)
  J'ai utilisé Express car un framework que je maitrise.
  J'ai créé une route pour faire en sorte que la requête
  http://localhost:8081/?lat=5.902785&lon=102.754175 fonctionne
  Pour l'utiliser en local, il suffit d'écrire dans le terminal : node api.js \*\*\*\* //(API_KEY)

- DockerFile  
  L’image docker utilisé est node:10-alpine. Elle est complète et de taille minimale. On n’a pas besoin de beaucoup de puissance pour faire de simples requêtes http.  
  On importe l'api et le package.json dans le conteneur Docker en utilisant la commande "COPY".  
  On bascule l'utilisateur à node
  On installe ensuite la commande npm et on télécharge les packages necessaires pour lancer le api.js.
  On indique à Docker de copier le code de l'application dans le répertoire de l'application sur le conteneur avec les bonnes autorisations et la propriété, c'est-à-dire l'utilisateur du nœud non root
  On expose le port 8081 dans le container qui est le port utilisé dans le api.js
  On execute ensuite l'api avec la commande "CMD". Cette commande spécifie l'instruction qui doit être exécutée au démarrage d'un conteneur Docker.

Malheureusement, mon code ne fonctionne pas lorsque je lance la commande "curl "http://localhost:8081/?lat=5.902785&lon=102.754175"" dans le terminal.
La connection est refusée et je n'ai pas su trouver la solution

- main.yml

Le code ne marche malheureusement pas non plus ppour les actions. Je ne parviens pas à récuperer mes secrets. Lorsque je veux print mes variables, rien ne s'affiche. Ma syntaxe a pourtant l'air bonne et mes variables existent bien dans le repository.