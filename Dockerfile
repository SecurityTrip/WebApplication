# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /build

COPY ["WebApplication.csproj", "./"]
RUN dotnet restore "WebApplication.csproj"

COPY . .
RUN dotnet build "WebApplication.csproj" -c Release -o /app/build

# Publish stage
FROM build AS publish
RUN dotnet publish "WebApplication.csproj" -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=publish /app/publish .

EXPOSE 8080

# Use shell form so Railway's $PORT variable is expanded at runtime.
CMD ["dotnet", "WebApplication.dll"]
