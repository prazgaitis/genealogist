ssh root@159.89.189.232 '\
cd /home/rails/example; \
git pull; \
sudo -i -u rails; \
bundle; \
bin/rails db:migrate; \
systemctl restart rails.service'