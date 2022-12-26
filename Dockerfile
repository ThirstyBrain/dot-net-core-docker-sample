 
#=========== start
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
ENV ASPNETCORE_ENVIRONMENT=Development
ENV ASPNETCORE_URLS=http://+:80
WORKDIR /DockerSample
COPY . .
RUN dotnet restore
ENTRYPOINT [ "dotnet","run","--no-launch-profile", "DockerSample.dll","--environment=Development" ]
#=========== ENd 
# # https://hub.docker.com/_/microsoft-dotnet
# FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
# ENV ASPNETCORE_ENVIRONMENT=Development
# ENV ASPNETCORE_URLS=http://+:80
# WORKDIR /DockerSample
# #EXPOSE 8080
# # copy csproj and restore as distinct layers
# COPY *.csproj ./
# RUN dotnet restore

# # copy and publish app and libraries
# COPY . ./
# RUN dotnet publish -c Release -o out 

# # final stage/image
# FROM mcr.microsoft.com/dotnet/sdk:5.0
# WORKDIR /DockerSample
# COPY --from=build-env /DockerSample/out .
# ENTRYPOINT ["dotnet","run", "DockerSample.dll","--environment=Development"]
# #CMD dotnet DockerSample.dll --urls "http://*:$PORT"



# # https://hub.docker.com/_/microsoft-dotnet
# FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
# ENV ASPNETCORE_ENVIRONMENT=Development
# #ENV ASPNETCORE_URLS=http://+:9000 
# WORKDIR /source
# #EXPOSE 9000
# # copy csproj and restore as distinct layers
# COPY *.csproj .
# RUN dotnet restore

# # copy and publish app and libraries
# COPY . .
# RUN dotnet publish -c Release -o /app

# # final stage/image
# FROM mcr.microsoft.com/dotnet/sdk:5.0
# WORKDIR /app
# COPY --from=build /app .
# ENTRYPOINT ["dotnet", "DockerSample.dll","--environment=Development"]


