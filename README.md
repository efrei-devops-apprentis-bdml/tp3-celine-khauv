# EFREI DEVOPS TP3

## API
On utilise Flask qui est un micro framwork adapté pour Python. En tant que étudiant dans le Big Data maitrisant le python, c'est un choix évident.


On y crée un serveur sur le port 80 qui renvoie la réponse du WeatherApi. 
L'API Key est passé à l'aide d'un environnement car il s'agit d'une donnée sensible. La latitude et la longitude sont des données passées en argument par l'utilisateur.


## Dockerfile
Ayant utilisé flask pour l'API, nous utilisons l'image python:3.11.0a7-alpine3.15.

```
RUN pip3 install --no-cache-dir -r requirements.txt
```
On install les packages necessaires pour run l'API à l'aide d'un fichier text qu'on a précédemmment copier.

```
COPY . .
```
On copie le fichier dans notre conteneur.

```
EXPOSE 8081
```
On expose le port 8081 dans le container qui est le port utilisé dans le api.js.

```
CMD ["python3", "main.py"]
```
On lance l'API à l'aide de la commande CMD.


## Workflows

```
on : push
```
On déclenche le workflow à chaque fois qu'il y a un push.
```
- name: Check out the repo
  uses: actions/checkout@v3
```
action/checkout est une action github officiel.
Elle extrait notre référentiel sous $GITHUB_WORKSPACE, afin que notre flux de travail puisse y accéder.

```
- name: "Login via Azure CLI"
uses: azure/login@v1
    with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}
```
On se connecte à Azure à l'aide d'une variable secrete.

```
- name: "Build and push image"
  uses: azure/docker-login@v1
    with:
        login-server: ${{ secrets.REGISTRY_LOGIN_SERVER }}
        username: ${{ secrets.REGISTRY_USERNAME }}
        password: ${{ secrets.REGISTRY_PASSWORD }}
```
On se connecte à docker à partir de Azure toujours à l'aide de variables secretes stockées dans le github.

```
- run: |
    docker build . -t ${{ secrets.REGISTRY_LOGIN_SERVER }}/20180417:v1
    docker push ${{ secrets.REGISTRY_LOGIN_SERVER }}/20180417:v1
```
Grâce à cette commande `RUN` pour build et push le code expliqué precedemment dans notre container Docker Azure.

```
name: "Deploy to Azure Container Instances"
uses: "azure/aci-deploy@v1"
```
A l'aide des action officiel de Github, nous déployons une instance de conteneur.

```
with:
    resource-group: ${{ secrets.RESOURCE_GROUP }}
    dns-name-label: devops-20180417
    image: ${{ secrets.REGISTRY_LOGIN_SERVER }}/20180417:v1
    registry-login-server: ${{ secrets.REGISTRY_LOGIN_SERVER }}
    registry-username: ${{ secrets.REGISTRY_USERNAME }}
    registry-password: ${{ secrets.REGISTRY_PASSWORD }}
    environment-variables: API_KEY=${{ secrets.API_KEY }}
    name: "20180417"
    ports: 80
    location: "france central"
```
Voici les paramètres du container. Le port est le même que celui précisé dans l'API. 
L'API_KEY a été passé en secret pour qu'il n'y ait aucune donnée sensible dans le code.