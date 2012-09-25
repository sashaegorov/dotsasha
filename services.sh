# Перезапуски
# - PostgreSQL

# Linux
if [ `uname`=="Linux" ]; then
  alias pg_restart='sudo /etc/init.d/postgresql restart'
  alias pg_restart='sudo /etc/init.d/postgresql stop'
fi

# Mac
if [ `uname`=="Darvin" ]; then
  PGPATH='/usr/local/var/postgres'
  alias pg_start="pg_ctl -D ${PGPATH} -l ${PGPATH}/server.log start"
  alias pg_stop="pg_ctl -D ${PGPATH} stop -m fast"
  alias pg_restart="pg_ctl -D ${PGPATH} restart -m fast"
  alias pg_reload="pg_ctl -D ${PGPATH} reload"
  alias pg_status="pg_ctl -D ${PGPATH} status"
fi