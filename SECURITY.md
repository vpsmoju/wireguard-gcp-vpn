\# 🔐 Política de Segurança



Este repositório contém scripts e configurações sensíveis para VPN com WireGuard. Abaixo estão as boas práticas recomendadas:



\## 🔒 Proteja suas chaves



\- Nunca faça `git commit` de arquivos `.key`, `.conf`, `.env`, ou com dados reais de segurança

\- Use o arquivo `.env.example` como referência para variáveis sensíveis



\## 🧩 Permissões de arquivos



\- Deixe arquivos com chaves (`\*.key`) restritos a leitura exclusiva do usuário root

\- Recomenda-se `chmod 600` para esses arquivos



\## 🔄 Atualizações



\- Mantenha seus pacotes do sistema e WireGuard atualizados com frequência

\- Periodicamente revise este repositório e os hooks locais de segurança



\## 📢 Reporte vulnerabilidades



Se identificar falhas de segurança nos scripts deste projeto, por favor, abra uma \*\*issue marcada como `type:security`\*\* ou envie um e-mail para: `walkerson@seudominio.com`.



Obrigado por manter este projeto mais seguro! 🙏



