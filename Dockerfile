FROM ubuntu:22.04

RUN apt update && \
	apt install -y lsb-release

RUN apt install -y gpg && \
	apt install -y curl

RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list && \
	apt update && \
	apt install -y redis

EXPOSE 6379

CMD ["redis-server"]
