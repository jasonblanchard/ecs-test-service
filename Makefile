ecrlogin:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 076797644834.dkr.ecr.us-east-1.amazonaws.com

build:
	~/Downloads/pack build ecs-test-service --builder heroku/buildpacks:18

dockerepo:
	aws ecr create-repository \
    --repository-name ecs-test-service \
    --image-scanning-configuration scanOnPush=true \
    --region us-east-1

push:
	docker tag ecs-test-service:latest 076797644834.dkr.ecr.us-east-1.amazonaws.com/ecs-test-service:latest
	docker push 076797644834.dkr.ecr.us-east-1.amazonaws.com/ecs-test-service:latest
