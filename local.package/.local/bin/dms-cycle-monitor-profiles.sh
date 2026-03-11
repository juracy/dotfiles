#!/bin/sh

# Script para alternar entre perfis de monitor no Dank Linux (dms)
# Uso: basta executar o script para pular para o próximo perfil

# Obtém a lista de perfis
output=$(dms ipc outputs listProfiles)

# Extrai todos os nomes de perfis (tudo antes de " [" ou " ->")
profiles=$(echo "$output" | sed 's/ \[.*//;s/ ->.*//')

# Descobre o perfil ativo (linha que contém "[active]" ou "[active,matched]")
active=$(echo "$output" | grep '\[active\]\|\[active,matched\]' | sed 's/ \[.*//;s/ ->.*//')


if [ -z "$active" ]; then
    echo "Erro: nenhum perfil ativo encontrado."
    exit 1
fi

# Converte a lista de perfis em um array indexado
total=$(echo "$profiles" | wc -l)
current_index=0
i=0

while IFS= read -r profile; do
    if [ "$profile" = "$active" ]; then
        current_index=$i
    fi
    i=$((i + 1))
done <<EOF
$profiles
EOF

# Calcula o próximo índice (volta ao início se estiver no último)
next_index=$(( (current_index + 1) % total ))

# Obtém o nome do próximo perfil
next_profile=$(echo "$profiles" | sed -n "$((next_index + 1))p")

echo "Perfil atual: $active"
echo "Próximo perfil: $next_profile"

# Aplica o próximo perfil
dms ipc outputs setProfile "$next_profile"
dms ipc toast info "Change output profile: $next_profile"
dms ipc outputs listProfiles
