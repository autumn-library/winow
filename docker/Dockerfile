ARG DOCKER_USERNAME=library
ARG BASE_IMAGE=debian
ARG BASE_TAG=bullseye-slim

FROM library/adoptopenjdk:latest

# Installing mono and oscript dependencies
ARG MONO_VERSION=6.12.0.122

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates \
      gnupg \
      dirmngr \
      wget \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
  && echo "deb http://download.mono-project.com/repo/debian stable-buster main" > /etc/apt/sources.list.d/mono-official-stable.list \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    mono-runtime \
    ca-certificates-mono \
    libmono-i18n4.0-all \
    libmono-system-runtime-serialization4.0-cil \
  && rm -rf /etc/apt/sources.list.d/mono-official-stable.list \
  && apt-get update \
  && cert-sync --user /etc/ssl/certs/ca-certificates.crt \
  && rm -rf  \
    /var/lib/apt/lists/* \
    /var/cache/debconf \
    /tmp/*

# remove DST Root CA X3 cert if it exists
#COPY ./scripts/remove-dst-root-ca-x3.sh /remove-dst-root-ca-x3.sh
#RUN chmod +x /remove-dst-root-ca-x3.sh \
#  && /remove-dst-root-ca-x3.sh \
#  && rm /remove-dst-root-ca-x3.sh

# Installing oscript
ARG OVM_REPOSITORY_OWNER=oscript-library
ARG OVM_VERSION=v1.0.0-RC16
ARG ONESCRIPT_VERSION=stable
ARG ONESCRIPT_PACKAGES="autumn winow json"

RUN wget https://github.com/${OVM_REPOSITORY_OWNER}/ovm/releases/download/${OVM_VERSION}/ovm.exe \
  && mv ovm.exe /usr/local/bin/ \
  && echo 'mono /usr/local/bin/ovm.exe "$@"' | tee /usr/local/bin/ovm \
  && chmod +x /usr/local/bin/ovm \
  && ovm use --install ${ONESCRIPT_VERSION}

ENV OSCRIPTBIN=/root/.local/share/ovm/current/bin
ENV PATH="$OSCRIPTBIN:$PATH"

# Update and prepare oscript packages
RUN opm install opm \
  && opm update --all \
  && opm install ${ONESCRIPT_PACKAGES}

COPY ./docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh \
  && chmod +x /docker-entrypoint.sh

COPY ./app/ /opt/app/winow/

ENTRYPOINT ["/docker-entrypoint.sh"]
