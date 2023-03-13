FROM mcr.microsoft.com/dotnet/runtime:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder
WORKDIR /src
COPY src/app/app.csproj app/
COPY src/library/library.csproj library/
RUN dotnet restore app/app.csproj
COPY src .
RUN dotnet publish app/app.csproj -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
COPY --from=builder /app/publish .
ENTRYPOINT ["dotnet", "app.dll"]
