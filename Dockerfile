# Étape 1 : Build et Test
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# 1️⃣ Copier tout le code source (principale et tests)
COPY FilRouge_TicketMaster_MVC_Core/ /app/FilRouge_TicketMaster_MVC_Core/
COPY FilRouge_TicketMaster_MVC_Core.test/ /app/FilRouge_TicketMaster_MVC_Core.test/

# 2️⃣3️⃣ Restaurer les dépendances en ciblant la solution
RUN dotnet restore /app/FilRouge_TicketMaster_MVC_Core/FilRouge_TicketMaster_MVC_Core.sln

# 4️⃣ Construire l’application
WORKDIR /app/FilRouge_TicketMaster_MVC_Core
RUN dotnet build -c Release --no-restore

# 5️⃣ Exécuter les tests unitaires
WORKDIR /app/FilRouge_TicketMaster_MVC_Core.test
RUN dotnet test --no-build --logger trx --results-directory /app/TestResults

# 6️⃣ Publier l’application si tout a réussi
WORKDIR /app/FilRouge_TicketMaster_MVC_Core
RUN dotnet publish -c Release -o /app/out

# Étape 2 : Exécution (runtime)
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .

# Exposer le port
EXPOSE 80
ENTRYPOINT ["dotnet", "FilRouge_TicketMaster_MVC_Core.dll"]