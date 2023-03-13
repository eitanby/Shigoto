all : clean publish image

clean:
	dotnet clean

restore:
	dotnet restore

build: 
	dotnet build -c Debug

publish:
	dotnet publish --no-restore .\src\app -c Release -o app\publish

run:
	dotnet run

image:
	docker build -t shigoto:local .