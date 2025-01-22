setup:
	bin/setup

up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

logs:
	docker-compose logs -f

test:
	docker-compose run web rails test

seed:
	docker-compose run web rails db:seed

worker-console:
	docker-compose run worker bash
