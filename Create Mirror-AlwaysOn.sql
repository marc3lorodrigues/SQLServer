
--| criar EndPoints nas maquinas que serão espelhadas PRINCIPAL/MIRROR
CREATE ENDPOINT SRV01
STATE=STARTED
AS TCP (LISTENER_PORT=5022)
FOR DATABASE_MIRRORING (ROLE=PARTNER)
GO

CREATE ENDPOINT SRV02
STATE=STARTED
AS TCP (LISTENER_PORT=5022)
FOR DATABASE_MIRRORING (ROLE=PARTNER)
GO



--| Criar backup do database PRINCIPAL. Será necessário um backup full e outro de log.
backup database adventureworks2017 to disk = 'd:\SQL\Backup\admin.bak'
with compression, stats

backup log admin to disk = 'd:\SQL\Backup\admin_log.trn'
with compression, stats



--| Restaurar backup do database no MIRROR. Será necessário restaurar o full e o log com norecovery.
restore database adventureworks2017 from disk = 'd:\SQL\Backup\adventureworks2017.bak'
with norecovery

restore log adventureworks2017 from disk = 'd:\SQL\Backup\adventureworks2017.trn'
with norecovery



--| Fazer o apontamento do database para o outro servidor.
-- No servidor MIRROR apontar para o database PRINCIPAL 
alter database adventureworks2017
set partner = 'TCP://PMPCLUS001:5022'

-- No servidor PRINCIPAL apontar para o database MIRROR
alter database adventureworks2017
set partner = 'TCP://PMPCLUS002:5022'

