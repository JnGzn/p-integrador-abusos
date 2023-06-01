from decouple import config

# Lectura de variables del .env
mySqlHost = config('MYSQL_HOST')
mySqlUser = config('MYSQL_USER')
mySqlPassword = config('MYSQL_PASSWORD')
mySqlBd = config('MYSQL_BASE_DATOS')