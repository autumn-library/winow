docker stop my-running-app
docker rm my-running-app
docker build -t test-winow .
docker run -dit --name my-running-app -p 3331:80 test-winow
