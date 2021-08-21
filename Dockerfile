FROM ubuntu:20.04

WORKDIR /app

RUN ln -snf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
  && echo "Etc/UTC" > /etc/timezone

RUN apt-get update && apt-get install --no-install-recommends -y \
      g++=4:9.3.0-1ubuntu2 \
      make=4.2.1-1.2 \
      python3.9-dev=3.9.5-3~20.04.1 \
      python3.9-venv=3.9.5-3~20.04.1 \
      python3.9=3.9.5-3~20.04.1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN python3.9 -m venv .venv
ENV PATH="/app/.venv/bin:$PATH"

COPY requirements.txt ./
RUN pip install -r requirements.txt
