FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /src

ARG git_branch
RUN echo "hello ${git_branch}"

# Copy only .csproj and restore
COPY ./src/SimpleAPI/*.csproj ./SimpleAPI/
RUN dotnet restore ./SimpleAPI/

# Copy all and build
COPY ./src/ .
RUN dotnet build ./SimpleAPI/


# publish
RUN dotnet publish ./SimpleAPI/ -o /publish --configuration Release
RUN ls /publish



# Publish Stage
FROM microsoft/dotnet:2.2.0-aspnetcore-runtime

WORKDIR /app
COPY --from=build-env /publish .
EXPOSE 80

ENTRYPOINT ["dotnet", "SimpleAPI.dll"]