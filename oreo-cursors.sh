## https://github.com/varlesh/oreo-cursors
git clone https://github.com/varlesh/oreo-cursors.git
cd oreo-cursors
ruby generator/convert.rb
# DBUS_SESSION_BUS_ADDRESS="" make build
make build
sudo make install

