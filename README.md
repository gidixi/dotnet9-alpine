# dotnet9-alpine 🐳

[![Docker Pulls](https://img.shields.io/docker/pulls/gidiesse/dotnet9-alpine)](https://hub.docker.com/r/gidiesse/dotnet9-alpine)
[![Alpine Version](https://img.shields.io/badge/Alpine-3.19-blue)](https://alpinelinux.org/)
[![.NET Version](https://img.shields.io/badge/.NET-9.0-blueviolet)](https://dotnet.microsoft.com/)

Immagine Docker ottimizzata per .NET 9 su Alpine Linux, leggera e pronta per l'uso in produzione.

## 🚀 Caratteristiche principali
- **Estremamente compatta** (~50MB dopo l'installazione di .NET 9)
- **Basata su Alpine Linux 3.19**
- **Configurazione ottimizzata** per container
- **Senza telemetria** (`DOTNET_CLI_TELEMETRY_OPTOUT=true`)
- **Pronta per applicazioni ASP.NET Core** e console

## 📦 Utilizzo dell'immagine

### 1. Pull dall'Docker Hub
```bash
docker pull gidiesse/dotnet9-alpine:latest
```

### 2. Base per il tuo Dockerfile
```dockerfile
FROM gidiesse/dotnet9-alpine:latest

WORKDIR /app
COPY ["publish/", "."]

ENTRYPOINT ["dotnet", "YourApp.dll"]
```

### 3. Build ed esecuzione
```bash
# Pubblica la tua app .NET
dotnet publish -c Release -o ./publish

# Builda l'immagine
docker build -t my-dotnet9-app .

# Esegui il container
docker run -p 8080:80 --rm my-dotnet9-app
```

## 🛠 Build locale dell'immagine

Se vuoi buildare l'immagine localmente:

```bash
docker build -t dotnet9-alpine .
docker tag dotnet9-alpine gidiesse/dotnet9-alpine:latest
docker push gidiesse/dotnet9-alpine:latest
```

## 🔧 Configurazioni consigliate

### Variabili d'ambiente utili
```dockerfile
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS=http://+:80
ENV DOTNET_RUNNING_IN_CONTAINER=true
```

### Esempio completo per ASP.NET Core
```dockerfile
FROM gidiesse/dotnet9-alpine:latest

WORKDIR /app
COPY ["publish/", "."]

ENV ASPNETCORE_ENVIRONMENT=Production     ASPNETCORE_URLS=http://+:80

EXPOSE 80

ENTRYPOINT ["dotnet", "YourApp.dll"]
```

## 📊 Dimensioni dell'immagine

- Base Alpine: ~5MB
- Con .NET 9 SDK: ~150MB
- Con .NET 9 Runtime: ~50MB

## 📄 Licenza

MIT - Libero per uso personale e commerciale
