DIR='/home/isucon/isuumo/conf'

ln -sf $DIR/sysctl.conf /etc/sysctl.conf
ln -sf $DIR/nginx/isuumo.conf /etc/nginx/sites-available/isuumo.conf
ln -sf $DIR/nginx/isuumo.php.conf /etc/nginx/sites-available/isuumo.php.conf
ln -sf $DIR/systemd/isuumo.go.service /etc/systemd/system/isuumo.go.service
ln -sf $DIR/systemd/isuumo.nodejs.service /etc/systemd/system/isuumo.nodejs.service
ln -sf $DIR/systemd/isuumo.ruby.service /etc/systemd/system/isuumo.ruby.service
ln -sf $DIR/systemd/isuumo.perl.service /etc/systemd/system/isuumo.perl.service
ln -sf $DIR/systemd/isuumo.python.service /etc/systemd/system/isuumo.python.service
ln -sf $DIR/systemd/isuumo.php.service /etc/systemd/system/isuumo.php.service
ln -sf $DIR/systemd/isuumo.deno.service /etc/systemd/system/isuumo.deno.service
ln -sf $DIR/systemd/isuumo.rust.service /etc/systemd/system/isuumo.rust.service
ln -sf $DIR/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
