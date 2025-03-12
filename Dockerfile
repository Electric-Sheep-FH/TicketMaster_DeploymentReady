# 🟢 Étape 1 : Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# 1️⃣ Copie tout le code source (principale et tests)
COPY FilRouge_TicketMaster_MVC_Core/ /app/FilRouge_TicketMaster_MVC_Core/
COPY FilRouge_TicketMaster_MVC_Core.test/ /app/FilRouge_TicketMaster_MVC_Core.test/

# 2️⃣ Restaurer les dépendances en ciblant le chemin de la solution
RUN dotnet restore /app/FilRouge_TicketMaster_MVC_Core/FilRouge_TicketMaster_MVC_Core.sln

# 3️⃣ Construit l'application
RUN dotnet build /app/FilRouge_TicketMaster_MVC_Core/FilRouge_TicketMaster_MVC_Core.csproj -c Release --no-restore

# 4️⃣ Exécute les tests unitaires
RUN dotnet test /app/FilRouge_TicketMaster_MVC_Core.test/FilRouge_TicketMaster_MVC_Core.test.csproj --no-build --logger trx --results-directory /app/TestResults

# 5️⃣ Publie l’application si tout a réussi
RUN dotnet publish /app/FilRouge_TicketMaster_MVC_Core/FilRouge_TicketMaster_MVC_Core.csproj -c Release -o /app/out

# 🟢 Étape 2 : Exécution
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .

# Exposer le port
EXPOSE 80
ENTRYPOINT ["dotnet", "FilRouge_TicketMaster_MVC_Core.dll"]