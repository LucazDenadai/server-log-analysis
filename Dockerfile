FROM ubuntu:24.04

# Evita prompts interativos durante instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instala o SSH e cria o usuário devops
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd && \
    useradd -m -s /bin/bash devops && \
    usermod -aG sudo devops && \
    # Permitimos senha; entrypoint decide se ativa
    sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
# "-D" Não executa em background, fique rodando em primeiro plano.
CMD ["/usr/sbin/sshd","-D"]
