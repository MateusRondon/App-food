# Imagem base oficial do Flutter
FROM cirrusci/flutter:latest

# Instalar dependências extras
USER root
RUN apt-get update && apt-get install -y \
    git curl unzip xz-utils zip libglu1-mesa && \
    apt-get clean

# Criar usuário padrão (VSCode)
RUN useradd -ms /bin/bash vscode
USER vscode

# Definir diretório de trabalho
WORKDIR /workspace
COPY . /workspace

# Atualizar e pré-aquecer o Flutter SDK
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter precache

# Comando padrão
CMD ["bash"]