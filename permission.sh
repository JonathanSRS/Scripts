#!/bin/bash
chown nome_usuario:nome_grupo /nome_diretorio/
sudo chown nome_usuario /nome_diretorio/

# |Leitura  | 4 | r |
# |Gravação | 2 | w |
# |Execução | 1 | x |
# |Nenhuma  | 0 |   |
ls -l
# |Dono|Grupo|outros|
# |rwx-| rwx-| rwx-ch |

chmod 100 /nome_diretorio