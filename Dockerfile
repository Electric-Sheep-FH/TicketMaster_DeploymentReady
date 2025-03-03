# Étape 1 : Build et Test
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# 1️⃣ Copier la solution (.sln) dans /app
COPY FilRouge_TicketMaster_MVC_Core/FilRouge_TicketMaster_MVC_Core.sln /app/

# 2️⃣ Copier les fichiers projet (.csproj) dans leurs dossiers respectifs
COPY FilRouge_TicketMaster_MVC_Core/*.csproj /app/FilRouge_TicketMaster_MVC_Core/
COPY FilRouge_TicketMaster_MVC_Core.test/*.csproj /app/FilRouge_TicketMaster_MVC_Core.test/

# 3️⃣ Copier tout le code source (ATTENTION : Bien copier le contenu entier)
COPY FilRouge_TicketMaster_MVC_Core/ /app/FilRouge_TicketMaster_MVC_Core/
COPY FilRouge_TicketMaster_MVC_Core.test/ /app/FilRouge_TicketMaster_MVC_Core.test/

# 4️⃣ Vérifier la structure avant de continuer
RUN ls -R /app

# 5️⃣ Restaurer les dépendances en ciblant la solution
RUN dotnet restore /app/FilRouge_TicketMaster_MVC_Core/FilRouge_TicketMaster_MVC_Core.sln

# 6️⃣ Construire l’application
WORKDIR /app/FilRouge_TicketMaster_MVC_Core
RUN dotnet build -c Release --no-restore

# 7️⃣ Exécuter les tests unitaires
WORKDIR /app/FilRouge_TicketMaster_MVC_Core.test
RUN dotnet test --no-build --logger trx --results-directory /app/TestResults

# 8️⃣ Publier l’application si tout a réussi
WORKDIR /app/FilRouge_TicketMaster_MVC_Core
RUN dotnet publish -c Release -o /app/out

# Étape 2 : Exécution (runtime)
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .

# Exposer le port et exécuter l’application
EXPOSE 80
ENTRYPOINT ["dotnet", "FilRouge_TicketMaster_MVC_Core.dll"]