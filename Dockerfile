FROM mcr.microsoft.com/dotnet/runtime:7.0 AS base
WORKDIR /app
COPY app/publish .
ENTRYPOINT ["dotnet", "app.dll"]
