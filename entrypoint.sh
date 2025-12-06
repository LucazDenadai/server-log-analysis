#!/bin/bash
set -e

# Se uma senha foi fornecida no runtime, aplica a senha ao usuário devops
if [ -n "${DEVOPS_PASSWORD:-}" ]; then
    echo "devops:${DEVOPS_PASSWORD}" | chpasswd
    # Ativa autenticação por senha
    sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
fi

exec "$@"