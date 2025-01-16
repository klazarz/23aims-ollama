
####
#### load Oracle sample data 
####
OF

mkdir tmp

wget https://github.com/oracle-samples/db-sample-schemas/archive/refs/tags/v23.3.zip 

unzip -o v23.3.zip -d /scripts/tmp/

#Remove accept and add positional substitution variables
cd /scripts/tmp/db-sample-schemas-23.3/human_resources && sed -i '/ACCEPT/d' hr_install.sql && sed -i 's/pass/1/g' hr_install.sql && sed -i 's/tbs/2/g' hr_install.sql && sed -i 's/overwrite_schema/3/g' hr_install.sql

cd /scripts/tmp/db-sample-schemas-23.3/sales_history && sed -i '/ACCEPT/d' sh_install.sql && sed -i 's/pass/1/g' sh_install.sql && sed -i 's/tbs/2/g' sh_install.sql && sed -i 's/overwrite_schema/3/g' sh_install.sql

cd /scripts/tmp/db-sample-schemas-23.3/customer_orders && sed -i '/ACCEPT/d' co_install.sql && sed -i 's/pass/1/g' co_install.sql && sed -i 's/tbs/2/g' co_install.sql && sed -i 's/overwrite_schema/3/g' co_install.sql

#Load data
cd /scripts/tmp/db-sample-schemas-23.3/human_resources/ && sql system/Welcome23ai@23ai:1521/freepdb1 @hr_install.sql Welcome23ai USERS YES

cd /scripts/tmp/db-sample-schemas-23.3/sales_history/  && sql system/Welcome23ai@23ai:1521/freepdb1 @sh_install.sql Welcome23ai USERS YES

cd /scripts/tmp/db-sample-schemas-23.3/customer_orders/  && sql system/Welcome23ai@23ai:1521/freepdb1 @co_install.sql Welcome23ai USERS YES


#Init users, ORDS, etc.
cd /scripts/ && sql system/Welcome23ai@23ai:1521/freepdb1 @init.sql

#Add Ollama creds and allow DB to talk to ollama container
cd /scripts/ && sql sys/Welcome23ai@23ai/freepdb1 as sysdba @1-ollama.sql

rm -rf /scripts/tmp

rm -f v23.3.zip

rm -f moviestreamload.zip

exec tail -f /dev/null
