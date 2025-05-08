FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /myApp

COPY . ./
RUN dotnet publish -c Release -o /myApp/publish
FROM mcr.microsoft.com/dotnet/runtime:8.0

WORKDIR /myApp

COPY --from=build /myApp/publish .

ENTRYPOINT ["dotnet", "myApp.dll"]