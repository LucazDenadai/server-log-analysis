#!/usr/bin/env bash
# Versão minimalista para estudar — cada comando é direto e fácil de entender.

# 1) Uptime: mostra há quanto tempo o sistema está no ar, usuários e load average.
echo "== Uptime =="
uptime
echo

# 2) CPU: mostra a linha de resumo do top com a quebra por us/sy/idle/etc.
#    Não tenta calcular porcentagens, só mostra o que o top já fornece.
echo "== CPU (resumo do top) =="
top -bn1 | grep -m1 "%Cpu"
echo

# 3) Memória: mostra a saída legível do free; aqui você vê total/used/free e buffers/cache.
echo "== Memória =="
free -h
echo

# 4) Disco: mostra o uso da partição raiz (/) em formato legível.
echo "== Disco (/) =="
df -h /
echo

# 5) Top processos por memória: lista usuarios, PID e uso de memória (5 maiores).
echo "== Top 5 processos por memória =="
ps aux --sort=-%mem | head -n 6
echo

# 6) Top processos por CPU: lista usuarios, PID e uso de CPU (5 maiores).
echo "== Top 5 processos por CPU =="
ps aux --sort=-%cpu | head -n 6
echo