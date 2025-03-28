FROM alpine:3.19

RUN apk add --no-cache \
    bash \
    icu-libs \
    krb5-libs \
    libgcc \
    libintl \
    libssl3 \
    libstdc++ \
    zlib \
    && apk add --no-cache --virtual .build-deps \
    curl \
    gnupg \
    tar \
    && rm -rf /var/cache/apk/*


ENV \
    # Abilita la modalità invariante globale
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false \
    # Non mostra il welcome message al primo avvio
    DOTNET_NOLOGO=true \
    # Disabilita la telemetria
    DOTNET_CLI_TELEMETRY_OPTOUT=true \
    # Percorso di installazione .NET
    DOTNET_ROOT=/usr/share/dotnet \
    # Aggiunge dotnet al PATH
    PATH=$PATH:/usr/share/dotnet


RUN curl -sSL https://dot.net/v1/dotnet-install.sh --output dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --channel 9.0 --install-dir /usr/share/dotnet \
    && rm dotnet-install.sh

RUN dotnet --list-sdks

RUN apk del .build-deps

WORKDIR /app

CMD ["dotnet", "--info"]
